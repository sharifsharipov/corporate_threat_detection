// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SystemLogModelImpl _$$SystemLogModelImplFromJson(Map<String, dynamic> json) =>
    _$SystemLogModelImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      level: $enumDecode(_$LogLevelEnumMap, json['level']),
      message: json['message'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$$SystemLogModelImplToJson(
  _$SystemLogModelImpl instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp.toIso8601String(),
  'level': _$LogLevelEnumMap[instance.level]!,
  'message': instance.message,
  'source': instance.source,
};

const _$LogLevelEnumMap = {
  LogLevel.error: 'error',
  LogLevel.warning: 'warning',
  LogLevel.info: 'info',
  LogLevel.debug: 'debug',
};
