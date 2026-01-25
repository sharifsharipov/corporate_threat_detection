import 'package:freezed_annotation/freezed_annotation.dart';

part 'detection_method.freezed.dart';
part 'detection_method.g.dart';

@freezed
class DetectionMethod with _$DetectionMethod {
  const factory DetectionMethod({
    required String methodId,
    required String name,
    required String type, // signature, anomaly, behavior, rule
    required String description,
    DateTime? createdAt,
  }) = _DetectionMethod;

  factory DetectionMethod.fromJson(Map<String, dynamic> json) => _$DetectionMethodFromJson(json);
}
