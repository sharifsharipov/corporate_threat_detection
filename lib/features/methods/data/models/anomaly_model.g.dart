// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anomaly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnomalyModelImpl _$$AnomalyModelImplFromJson(Map<String, dynamic> json) =>
    _$AnomalyModelImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      description: json['description'] as String,
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      detectedByModel: json['detectedByModel'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AnomalyModelImplToJson(_$AnomalyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'description': instance.description,
      'confidenceScore': instance.confidenceScore,
      'detectedByModel': instance.detectedByModel,
      'status': instance.status,
    };
