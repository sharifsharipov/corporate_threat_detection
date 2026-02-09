import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:equatable/equatable.dart';

class NetworkDevicesState extends Equatable {
  final bool isLoading;
  final List<NetworkDeviceModel> devices;
  final String? errorMessage;

  const NetworkDevicesState({
    required this.isLoading,
    required this.devices,
    required this.errorMessage,
  });

  factory NetworkDevicesState.initial() => const NetworkDevicesState(
        isLoading: false,
        devices: [],
        errorMessage: null,
      );

  NetworkDevicesState copyWith({
    bool? isLoading,
    List<NetworkDeviceModel>? devices,
    String? errorMessage,
  }) {
    return NetworkDevicesState(
      isLoading: isLoading ?? this.isLoading,
      devices: devices ?? this.devices,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[isLoading, devices, errorMessage];
}
