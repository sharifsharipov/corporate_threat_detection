import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_metric_model.freezed.dart';
part 'performance_metric_model.g.dart';

@freezed
class PerformanceMetricModel with _$PerformanceMetricModel {
  const factory PerformanceMetricModel({
    required String title,
    required String value,
    required int iconCodePoint,
    required int colorValue,
    required double changePercentage,
    @Default(true) bool isIncrease,
  }) = _PerformanceMetricModel;

  factory PerformanceMetricModel.fromJson(Map<String, dynamic> json) =>
      _$PerformanceMetricModelFromJson(json);
}
