import 'package:freezed_annotation/freezed_annotation.dart';

part 'traffic_log.freezed.dart';
part 'traffic_log.g.dart';

@freezed
class TrafficLog with _$TrafficLog {
  const factory TrafficLog({
    required String deviceId,
    required String sourceIp,
    required String destinationIp,
    required String protocol,
    required int port,
    required int packetSize,
    required DateTime timestamp,
    String? apiUsed,
  }) = _TrafficLog;

  factory TrafficLog.fromJson(Map<String, dynamic> json) => _$TrafficLogFromJson(json);
}
