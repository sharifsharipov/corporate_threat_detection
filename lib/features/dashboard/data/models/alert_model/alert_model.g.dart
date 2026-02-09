// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertModelImpl _$$AlertModelImplFromJson(Map<String, dynamic> json) =>
    _$AlertModelImpl(
      title: json['title'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      severity: $enumDecode(_$AlertSeverityEnumMap, json['severity']),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$AlertModelImplToJson(_$AlertModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'timestamp': instance.timestamp.toIso8601String(),
      'severity': _$AlertSeverityEnumMap[instance.severity]!,
      'isRead': instance.isRead,
    };

const _$AlertSeverityEnumMap = {
  AlertSeverity.low: 'low',
  AlertSeverity.medium: 'medium',
  AlertSeverity.high: 'high',
  AlertSeverity.critical: 'critical',
};
