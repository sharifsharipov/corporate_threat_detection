import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:equatable/equatable.dart';

class DeviceApiUsageState extends Equatable {
  final bool isLoading;
  final List<DeviceApiUsageModel> usage;
  final String? errorMessage;
  final String? deviceId;

  const DeviceApiUsageState({
    required this.isLoading,
    required this.usage,
    required this.errorMessage,
    required this.deviceId,
  });

  factory DeviceApiUsageState.initial() => const DeviceApiUsageState(
        isLoading: false,
        usage: [],
        errorMessage: null,
        deviceId: null,
      );

  DeviceApiUsageState copyWith({
    bool? isLoading,
    List<DeviceApiUsageModel>? usage,
    String? errorMessage,
    String? deviceId,
  }) {
    return DeviceApiUsageState(
      isLoading: isLoading ?? this.isLoading,
      usage: usage ?? this.usage,
      errorMessage: errorMessage,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, usage, errorMessage, deviceId];
}
