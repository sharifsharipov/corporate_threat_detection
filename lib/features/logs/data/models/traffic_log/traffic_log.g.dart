// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traffic_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrafficLogImpl _$$TrafficLogImplFromJson(Map<String, dynamic> json) =>
    _$TrafficLogImpl(
      deviceId: json['deviceId'] as String,
      sourceIp: json['sourceIp'] as String,
      destinationIp: json['destinationIp'] as String,
      protocol: json['protocol'] as String,
      port: (json['port'] as num).toInt(),
      packetSize: (json['packetSize'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      apiUsed: json['apiUsed'] as String?,
    );

Map<String, dynamic> _$$TrafficLogImplToJson(_$TrafficLogImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'sourceIp': instance.sourceIp,
      'destinationIp': instance.destinationIp,
      'protocol': instance.protocol,
      'port': instance.port,
      'packetSize': instance.packetSize,
      'timestamp': instance.timestamp.toIso8601String(),
      'apiUsed': instance.apiUsed,
    };
