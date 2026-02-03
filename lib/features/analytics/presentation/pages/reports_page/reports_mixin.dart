import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/reports_page/reports_page.dart';
import 'package:flutter/material.dart';

mixin ReportsMixin on State<ReportsPage> {
  // Report types available
  final List<ReportTypeData> _reportTypes = [
    ReportTypeData(
      icon: Icons.security,
      title: 'Security Summary',
      description: 'Comprehensive overview of security posture and threats',
      color: AppColors.buttonColor,
      recentCount: 5,
    ),
    ReportTypeData(
      icon: Icons.bug_report,
      title: 'Threat Analysis',
      description: 'Detailed analysis of detected threats and patterns',
      color: AppColors.c_F71E52,
      recentCount: 3,
    ),
    ReportTypeData(
      icon: Icons.verified_user,
      title: 'Compliance Report',
      description: 'Compliance status and regulatory requirements',
      color: AppColors.c_03A64B,
      recentCount: 2,
    ),
    ReportTypeData(
      icon: Icons.warning_amber,
      title: 'Incident Report',
      description: 'Summary of security incidents and responses',
      color: AppColors.c_F7931E,
      recentCount: 8,
    ),
    ReportTypeData(
      icon: Icons.speed,
      title: 'Performance Report',
      description: 'System performance metrics and benchmarks',
      color: AppColors.c_5856D6,
      recentCount: 4,
    ),
    ReportTypeData(
      icon: Icons.analytics,
      title: 'Analytics Report',
      description: 'In-depth analytics and trend analysis',
      color: const Color(0xFF00BCD4),
      recentCount: 6,
    ),
  ];

  // Recent reports
  final List<RecentReportData> _recentReports = [
    RecentReportData(
      reportName: 'Security_Summary_Jan_2026',
      reportType: 'Security Summary',
      generatedDate: DateTime.now().subtract(const Duration(hours: 2)),
      fileSize: '2.3 MB',
      format: 'PDF',
    ),
    RecentReportData(
      reportName: 'Threat_Analysis_Weekly',
      reportType: 'Threat Analysis',
      generatedDate: DateTime.now().subtract(const Duration(days: 1)),
      fileSize: '1.8 MB',
      format: 'PDF',
    ),
    RecentReportData(
      reportName: 'Compliance_Q1_2026',
      reportType: 'Compliance Report',
      generatedDate: DateTime.now().subtract(const Duration(days: 2)),
      fileSize: '856 KB',
      format: 'Excel',
    ),
    RecentReportData(
      reportName: 'Incident_Report_2026_01',
      reportType: 'Incident Report',
      generatedDate: DateTime.now().subtract(const Duration(days: 3)),
      fileSize: '1.2 MB',
      format: 'PDF',
    ),
    RecentReportData(
      reportName: 'Performance_Metrics_Monthly',
      reportType: 'Performance Report',
      generatedDate: DateTime.now().subtract(const Duration(days: 5)),
      fileSize: '645 KB',
      format: 'CSV',
    ),
    RecentReportData(
      reportName: 'Analytics_Report_Dec',
      reportType: 'Analytics Report',
      generatedDate: DateTime.now().subtract(const Duration(days: 7)),
      fileSize: '3.1 MB',
      format: 'PDF',
    ),
  ];

  List<ReportTypeData> get reportTypes => _reportTypes;
  List<RecentReportData> get recentReports => _recentReports;

  void handleGenerateReport(String reportType) {
    // This will be implemented with dialog
    debugPrint('Generating $reportType');
  }

  void handleDownloadReport(String reportName) {
    // This will trigger download
    debugPrint('Downloading $reportName');
  }

  void handleViewReport(String reportName) {
    // This will open report viewer
    debugPrint('Viewing $reportName');
  }
}

class ReportTypeData {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final int recentCount;

  ReportTypeData({
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

  RecentReportData({
    required this.reportName,
    required this.reportType,
    required this.generatedDate,
    required this.fileSize,
    required this.format,
  });
}
