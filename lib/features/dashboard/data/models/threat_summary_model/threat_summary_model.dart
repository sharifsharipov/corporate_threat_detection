import 'package:freezed_annotation/freezed_annotation.dart';

part 'threat_summary_model.freezed.dart';
part 'threat_summary_model.g.dart';

@freezed
class ThreatSummaryModel with _$ThreatSummaryModel {
  const factory ThreatSummaryModel({
    required int totalThreats,
    required int criticalCount,
    required int highCount,
    required int mediumCount,
    required int lowCount,
    required List<ThreatCategoryData> categories,
    required List<ThreatTimelinePoint> timelineData,
    required List<TopThreatData> topThreats,
  }) = _ThreatSummaryModel;

  factory ThreatSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ThreatSummaryModelFromJson(json);
}

@freezed
class ThreatCategoryData with _$ThreatCategoryData {
  const factory ThreatCategoryData({
    required String name,
    required int count,
    required int colorValue,
    required int iconCodePoint,
  }) = _ThreatCategoryData;

  factory ThreatCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ThreatCategoryDataFromJson(json);
}

@freezed
class ThreatTimelinePoint with _$ThreatTimelinePoint {
  const factory ThreatTimelinePoint({
    required DateTime date,
    required int count,
  }) = _ThreatTimelinePoint;

  factory ThreatTimelinePoint.fromJson(Map<String, dynamic> json) =>
      _$ThreatTimelinePointFromJson(json);
}

@freezed
class TopThreatData with _$TopThreatData {
  const factory TopThreatData({
    required String name,
    required String description,
    required int count,
    required String severity, // "high", "critical", etc.
    required bool isIncreasing,
  }) = _TopThreatData;

  factory TopThreatData.fromJson(Map<String, dynamic> json) =>
      _$TopThreatDataFromJson(json);
}
