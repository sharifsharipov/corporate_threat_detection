import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_detail_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/device_detail_state.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DeviceDetailBody extends StatelessWidget {
  const DeviceDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceDetailCubit, DeviceDetailState>(
      builder: (context, state) {
        if (state.isLoading && state.device == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.device == null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                state.errorMessage!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          );
        }

        final device = state.device;
        if (device == null) {
          return Center(
            child: Text(
              'Device not found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DeviceInfoCard(device: device),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    onPressed: () => context.pushNamed(
                      Routes.deviceApiUsage,
                      extra: device.id,
                    ),
                    icon: const Icon(Icons.api, size: 16),
                    label: const Text('View API Usage'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Recent Traffic',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 12),
                if (state.logs.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Text(
                      'No traffic logs for this device',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  )
                else
                  Column(
                    children: state.logs
                        .take(6)
                        .map((log) => _TrafficLogCard(log: log))
                        .toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DeviceInfoCard extends StatelessWidget {
  final NetworkDeviceModel device;

  const _DeviceInfoCard({required this.device});

  Color get _statusColor {
    switch (device.status) {
      case DeviceStatus.online:
        return AppColors.c_03A64B;
      case DeviceStatus.warning:
        return AppColors.c_F7931E;
      case DeviceStatus.critical:
        return AppColors.c_F71E52;
      case DeviceStatus.offline:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lastSeen = DateFormat('MMM d, yyyy • HH:mm').format(device.lastSeen);
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
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  device.name,
                  style: const TextStyle(
                    fontSize: 16,
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
                  color: _statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  device.status.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: _statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _info('IP', device.ipAddress),
              _info('MAC', device.macAddress),
              _info('Type', device.type),
              _info('OS', device.osVersion),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Last seen: $lastSeen',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
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
          value.isNotEmpty ? value : '—',
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _TrafficLogCard extends StatelessWidget {
  final TrafficLog log;

  const _TrafficLogCard({required this.log});

  @override
  Widget build(BuildContext context) {
    final timestamp = DateFormat('HH:mm:ss').format(log.timestamp);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.buttonColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.swap_horiz,
              size: 16,
              color: AppColors.buttonColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${log.sourceIp} → ${log.destinationIp}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${log.protocol.toUpperCase()} • Port ${log.port}',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Text(
            timestamp,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
