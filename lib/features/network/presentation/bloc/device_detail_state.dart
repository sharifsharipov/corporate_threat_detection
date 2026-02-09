import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:equatable/equatable.dart';

class DeviceDetailState extends Equatable {
  final bool isLoading;
  final NetworkDeviceModel? device;
  final List<TrafficLog> logs;
  final String? errorMessage;
  final String? deviceId;

  const DeviceDetailState({
    required this.isLoading,
    required this.device,
    required this.logs,
    required this.errorMessage,
    required this.deviceId,
  });

  factory DeviceDetailState.initial() => const DeviceDetailState(
        isLoading: false,
        device: null,
        logs: [],
        errorMessage: null,
        deviceId: null,
      );

  DeviceDetailState copyWith({
    bool? isLoading,
    NetworkDeviceModel? device,
    List<TrafficLog>? logs,
    String? errorMessage,
    String? deviceId,
  }) {
    return DeviceDetailState(
      isLoading: isLoading ?? this.isLoading,
      device: device ?? this.device,
      logs: logs ?? this.logs,
      errorMessage: errorMessage,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        device,
        logs,
        errorMessage,
        deviceId,
      ];
}
