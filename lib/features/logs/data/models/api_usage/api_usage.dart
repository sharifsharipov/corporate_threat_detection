import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_usage.freezed.dart';
part 'api_usage.g.dart';

@freezed
class ApiUsage with _$ApiUsage {
  const factory ApiUsage({
    required String deviceId,
    required String apiName,
    String? endpoint,
    required int requestCount,
    required double avgResponseTime,
    required double errorRate,
    required DateTime timestamp,
  }) = _ApiUsage;

  factory ApiUsage.fromJson(Map<String, dynamic> json) => _$ApiUsageFromJson(json);
}
