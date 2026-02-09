import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytic_report_model.freezed.dart';
part 'analytic_report_model.g.dart';

@freezed
class AnalyticReportModel with _$AnalyticReportModel {
  const factory AnalyticReportModel({
    required String id,
    required String reportName,
    required String reportType,
    required DateTime generatedDate,
    required String fileSize,
    required String format,
    required String downloadUrl,
  }) = _AnalyticReportModel;

  factory AnalyticReportModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticReportModelFromJson(json);
}
