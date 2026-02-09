import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_devices_cubit.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_devices_state.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NetworkDevicesBody extends StatelessWidget {
  const NetworkDevicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkDevicesCubit, NetworkDevicesState>(
      builder: (context, state) {
        if (state.isLoading && state.devices.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.devices.isEmpty) {
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
                        context.read<NetworkDevicesCubit>().startRealtime,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.devices.isEmpty) {
          return Center(
            child: Text(
              'No devices found',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.devices.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final device = state.devices[index];
              return _DeviceCard(device: device);
            },
          ),
        );
      },
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final NetworkDeviceModel device;

  const _DeviceCard({required this.device});

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
    final lastSeen = DateFormat('MMM d, HH:mm').format(device.lastSeen);
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.deviceDetail,
        extra: device,
      ),
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
              spacing: 12,
              runSpacing: 6,
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
