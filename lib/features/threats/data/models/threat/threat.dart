import 'package:freezed_annotation/freezed_annotation.dart';

part 'threat.freezed.dart';
part 'threat.g.dart';

@freezed
class Threat with _$Threat {
  const factory Threat({
    required String threatId,
    required String deviceId,
    required String type,
    required String riskLevel,
    required String description,
    required String detectionMethod,
    required String status,
    required DateTime detectedAt,
  }) = _Threat;

  factory Threat.fromJson(Map<String, dynamic> json) => _$ThreatFromJson(json);
}
