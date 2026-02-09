// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traffic_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrafficLogModelImpl _$$TrafficLogModelImplFromJson(
  Map<String, dynamic> json,
) => _$TrafficLogModelImpl(
  id: json['id'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  sourceIp: json['sourceIp'] as String,
  destinationIp: json['destinationIp'] as String,
  port: (json['port'] as num).toInt(),
  protocol: json['protocol'] as String,
  bytesTransferred: (json['bytesTransferred'] as num).toInt(),
  status: json['status'] as String,
);

Map<String, dynamic> _$$TrafficLogModelImplToJson(
  _$TrafficLogModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'timestamp': instance.timestamp.toIso8601String(),
  'sourceIp': instance.sourceIp,
  'destinationIp': instance.destinationIp,
  'port': instance.port,
  'protocol': instance.protocol,
  'bytesTransferred': instance.bytesTransferred,
  'status': instance.status,
};
