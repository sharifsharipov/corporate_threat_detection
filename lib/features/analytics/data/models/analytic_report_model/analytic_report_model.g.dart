// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytic_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticReportModelImpl _$$AnalyticReportModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticReportModelImpl(
  id: json['id'] as String,
  reportName: json['reportName'] as String,
  reportType: json['reportType'] as String,
  generatedDate: DateTime.parse(json['generatedDate'] as String),
  fileSize: json['fileSize'] as String,
  format: json['format'] as String,
  downloadUrl: json['downloadUrl'] as String,
);

Map<String, dynamic> _$$AnalyticReportModelImplToJson(
  _$AnalyticReportModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'reportName': instance.reportName,
  'reportType': instance.reportType,
  'generatedDate': instance.generatedDate.toIso8601String(),
  'fileSize': instance.fileSize,
  'format': instance.format,
  'downloadUrl': instance.downloadUrl,
};
