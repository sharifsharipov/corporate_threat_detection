class RecentReportModel {
  final String reportName;
  final String reportType;
  final DateTime generatedDate;
  final String fileSize;
  final String format;

  const RecentReportModel({
    required this.reportName,
    required this.reportType,
    required this.generatedDate,
    required this.fileSize,
    required this.format,
  });

  factory RecentReportModel.fromJson(Map<String, dynamic> json) {
    return RecentReportModel(
      reportName: json['reportName'] as String? ?? '',
      reportType: json['reportType'] as String? ?? '',
      generatedDate: _parseDate(json['generatedDate']),
      fileSize: json['fileSize'] as String? ?? '',
      format: json['format'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'reportName': reportName,
    'reportType': reportType,
    'generatedDate': generatedDate.toIso8601String(),
    'fileSize': fileSize,
    'format': format,
  };

  static DateTime _parseDate(dynamic value) {
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }
}
