import 'package:flutter/material.dart';

class ReportTypeData {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final int recentCount;

  const ReportTypeData({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.recentCount,
  });
}

class RecentReportData {
  final String reportName;
  final String reportType;
  final DateTime generatedDate;
  final String fileSize;
  final String format;

  const RecentReportData({
    required this.reportName,
    required this.reportType,
    required this.generatedDate,
    required this.fileSize,
    required this.format,
  });
}
