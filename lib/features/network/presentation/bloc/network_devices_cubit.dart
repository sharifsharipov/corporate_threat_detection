import 'dart:async';

import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/domain/use_cases/stream_network_devices_use_case.dart';
import 'package:corporate_threat_detection/features/network/presentation/bloc/network_devices_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkDevicesCubit extends Cubit<NetworkDevicesState> {
  final StreamNetworkDevicesUseCase streamNetworkDevicesUseCase;
  StreamSubscription? _subscription;

  NetworkDevicesCubit({required this.streamNetworkDevicesUseCase})
    : super(NetworkDevicesState.initial());

  void startRealtime({int limit = 200}) {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    _subscription?.cancel();
    _subscription = streamNetworkDevicesUseCase(limit: limit).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (devices) => emit(
            state.copyWith(
              isLoading: false,
              devices: devices.isNotEmpty ? devices : _mockDevices,
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  static final List<NetworkDeviceModel> _mockDevices = [
    NetworkDeviceModel(
      id: 'D-1',
      name: 'Auth Server (Primary)',
      ipAddress: '192.168.1.10',
      macAddress: '00:1A:2B:3C:4D:5E',
      type: 'Server',
      status: DeviceStatus.online,
      lastSeen: DateTime.now().subtract(const Duration(minutes: 2)),
      osVersion: 'Ubuntu 22.04 LTS',
    ),
    NetworkDeviceModel(
      id: 'D-2',
      name: 'Corporate Gateway',
      ipAddress: '192.168.1.1',
      macAddress: 'AA:BB:CC:DD:EE:FF',
      type: 'Router',
      status: DeviceStatus.warning,
      lastSeen: DateTime.now().subtract(const Duration(seconds: 30)),
      osVersion: 'Custom OS v4.2',
    ),
    NetworkDeviceModel(
      id: 'D-3',
      name: 'Finance Workstation',
      ipAddress: '192.168.1.45',
      macAddress: '11:22:33:44:55:66',
      type: 'Workstation',
      status: DeviceStatus.online,
      lastSeen: DateTime.now().subtract(const Duration(hours: 1)),
      osVersion: 'Windows 11 Pro',
    ),
    NetworkDeviceModel(
      id: 'D-4',
      name: 'Guest WiFi AP',
      ipAddress: '192.168.2.1',
      macAddress: '00:11:22:33:44:55',
      type: 'Access Point',
      status: DeviceStatus.critical,
      lastSeen: DateTime.now().subtract(const Duration(minutes: 15)),
      osVersion: 'OpenWRT 21.02',
    ),
  ];

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
