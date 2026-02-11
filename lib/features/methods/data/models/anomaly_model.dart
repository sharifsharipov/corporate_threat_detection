import 'package:freezed_annotation/freezed_annotation.dart';

part 'anomaly_model.freezed.dart';
part 'anomaly_model.g.dart';

@freezed
class AnomalyModel with _$AnomalyModel {
  const factory AnomalyModel({
    required String id,
    required DateTime timestamp,
    required String description,
    required double confidenceScore,
    required String detectedByModel, // e.g. "Isolation Forest"
    required String status, // "New", "Investigating", "False Positive"
  }) = _AnomalyModel;

  factory AnomalyModel.fromJson(Map<String, dynamic> json) =>
      _$AnomalyModelFromJson(json);
}
