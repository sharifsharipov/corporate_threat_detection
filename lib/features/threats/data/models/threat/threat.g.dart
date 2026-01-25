// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreatImpl _$$ThreatImplFromJson(Map<String, dynamic> json) => _$ThreatImpl(
  threatId: json['threatId'] as String,
  deviceId: json['deviceId'] as String,
  type: json['type'] as String,
  riskLevel: json['riskLevel'] as String,
  description: json['description'] as String,
  detectionMethod: json['detectionMethod'] as String,
  status: json['status'] as String,
  detectedAt: DateTime.parse(json['detectedAt'] as String),
);

Map<String, dynamic> _$$ThreatImplToJson(_$ThreatImpl instance) =>
    <String, dynamic>{
      'threatId': instance.threatId,
      'deviceId': instance.deviceId,
      'type': instance.type,
      'riskLevel': instance.riskLevel,
      'description': instance.description,
      'detectionMethod': instance.detectionMethod,
      'status': instance.status,
      'detectedAt': instance.detectedAt.toIso8601String(),
    };
