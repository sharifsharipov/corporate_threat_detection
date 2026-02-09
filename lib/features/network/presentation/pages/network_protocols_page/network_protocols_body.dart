import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_protocols_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_protocols_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NetworkProtocolsBody extends StatelessWidget {
  const NetworkProtocolsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkProtocolsCubit, NetworkProtocolsState>(
      builder: (context, state) {
        if (state.isLoading && state.protocols.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.protocols.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed:
                        context.read<NetworkProtocolsCubit>().startRealtime,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.protocols.isEmpty) {
          return Center(
            child: Text(
              'No protocols found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.protocols.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final protocol = state.protocols[index];
              return _ProtocolCard(protocol: protocol);
            },
          ),
        );
      },
    );
  }
}

class _ProtocolCard extends StatelessWidget {
  final NetworkProtocolModel protocol;

  const _ProtocolCard({required this.protocol});

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'blocked':
        return AppColors.c_F71E52;
      case 'allowed':
        return AppColors.c_03A64B;
      case 'monitored':
      default:
        return AppColors.c_F7931E;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lastSeen = protocol.lastSeen != null
        ? DateFormat('MMM d, HH:mm').format(protocol.lastSeen!)
        : '—';
    final statusColor = _statusColor(protocol.status);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  protocol.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  protocol.status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            protocol.description,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              _info('Port', protocol.port.toString()),
              _info('Usage', '${protocol.usageCount}'),
              _info('Last seen', lastSeen),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
