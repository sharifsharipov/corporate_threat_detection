import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_device_model.freezed.dart';
part 'network_device_model.g.dart';

enum DeviceStatus { online, offline, warning, critical }

@freezed
class NetworkDeviceModel with _$NetworkDeviceModel {
  const factory NetworkDeviceModel({
    required String id,
    required String name,
    required String ipAddress,
    required String macAddress,
    required String type, // e.g., "Server", "Workstation", "IoT"
    required DeviceStatus status,
    required DateTime lastSeen,
    required String osVersion,
  }) = _NetworkDeviceModel;

  factory NetworkDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkDeviceModelFromJson(json);
}
