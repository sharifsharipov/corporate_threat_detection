// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkDeviceModelImpl _$$NetworkDeviceModelImplFromJson(
  Map<String, dynamic> json,
) => _$NetworkDeviceModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  ipAddress: json['ipAddress'] as String,
  macAddress: json['macAddress'] as String,
  type: json['type'] as String,
  status: $enumDecode(_$DeviceStatusEnumMap, json['status']),
  lastSeen: DateTime.parse(json['lastSeen'] as String),
  osVersion: json['osVersion'] as String,
);

Map<String, dynamic> _$$NetworkDeviceModelImplToJson(
  _$NetworkDeviceModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'ipAddress': instance.ipAddress,
  'macAddress': instance.macAddress,
  'type': instance.type,
  'status': _$DeviceStatusEnumMap[instance.status]!,
  'lastSeen': instance.lastSeen.toIso8601String(),
  'osVersion': instance.osVersion,
};

const _$DeviceStatusEnumMap = {
  DeviceStatus.online: 'online',
  DeviceStatus.offline: 'offline',
  DeviceStatus.warning: 'warning',
  DeviceStatus.critical: 'critical',
};
