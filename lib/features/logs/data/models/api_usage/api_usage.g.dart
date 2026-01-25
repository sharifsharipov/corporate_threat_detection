// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiUsageImpl _$$ApiUsageImplFromJson(Map<String, dynamic> json) =>
    _$ApiUsageImpl(
      deviceId: json['deviceId'] as String,
      apiName: json['apiName'] as String,
      endpoint: json['endpoint'] as String?,
      requestCount: (json['requestCount'] as num).toInt(),
      avgResponseTime: (json['avgResponseTime'] as num).toDouble(),
      errorRate: (json['errorRate'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ApiUsageImplToJson(_$ApiUsageImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'apiName': instance.apiName,
      'endpoint': instance.endpoint,
      'requestCount': instance.requestCount,
      'avgResponseTime': instance.avgResponseTime,
      'errorRate': instance.errorRate,
      'timestamp': instance.timestamp.toIso8601String(),
    };
