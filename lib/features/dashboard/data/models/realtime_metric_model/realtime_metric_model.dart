import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_metric_model.freezed.dart';
part 'realtime_metric_model.g.dart';

@freezed
class RealtimeMetricModel with _$RealtimeMetricModel {
  const factory RealtimeMetricModel({
    required String label,
    required double value,
    required int iconCodePoint,
    required int colorValue,
    @Default(true) bool isIncreasing,
    @Default(0) double changeAmount,
    @Default(0xFFFFFFFF) int backgroundColorValue,
  }) = _RealtimeMetricModel;

  factory RealtimeMetricModel.fromJson(Map<String, dynamic> json) =>
      _$RealtimeMetricModelFromJson(json);
}
