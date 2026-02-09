import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_api_usage_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_api_usage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DeviceApiUsageBody extends StatelessWidget {
  const DeviceApiUsageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceApiUsageCubit, DeviceApiUsageState>(
      builder: (context, state) {
        if (state.isLoading && state.usage.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.usage.isEmpty) {
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
                    onPressed: () => context
                        .read<DeviceApiUsageCubit>()
                        .startRealtime(deviceId: state.deviceId),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.usage.isEmpty) {
          return Center(
            child: Text(
              'No API usage found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.usage.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final usage = state.usage[index];
              return _UsageCard(usage: usage);
            },
          ),
        );
      },
    );
  }
}

class _UsageCard extends StatelessWidget {
  final DeviceApiUsageModel usage;

  const _UsageCard({required this.usage});

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'degraded':
        return AppColors.c_F7931E;
      case 'down':
        return AppColors.c_F71E52;
      case 'healthy':
      default:
        return AppColors.c_03A64B;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lastCalled = usage.lastCalled != null
        ? DateFormat('MMM d, HH:mm').format(usage.lastCalled!)
        : '—';
    final statusColor = _statusColor(usage.status);
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
                  usage.endpoint,
                  style: const TextStyle(
                    fontSize: 14,
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
                  usage.status.toUpperCase(),
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
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              _info('Method', usage.method),
              _info('Requests', '${usage.requestCount}'),
              _info('Success', '${usage.successRate.toStringAsFixed(0)}%'),
              _info('Last call', lastCalled),
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
