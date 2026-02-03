import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/dashboard_threat_summary_page.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/threat_timeline_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/top_threat_item.dart';
import 'package:flutter/material.dart';

mixin DashboardThreatSummaryMixin on State<DashboardThreatSummaryPage> {
  // Category data
  final Map<String, CategoryData> _categories = {
    'Malware': CategoryData(
      icon: Icons.bug_report,
      count: 342,
      color: AppColors.c_F71E52,
    ),
    'Phishing': CategoryData(
      icon: Icons.phishing,
      count: 287,
      color: AppColors.c_F7931E,
    ),
    'DDoS': CategoryData(
      icon: Icons.cloud_off,
      count: 156,
      color: const Color(0xFF8B0000),
    ),
    'Unauthorized Access': CategoryData(
      icon: Icons.lock_outline,
      count: 234,
      color: AppColors.c_F71E52,
    ),
    'Data Breach': CategoryData(
      icon: Icons.security,
      count: 89,
      color: const Color(0xFF8B0000),
    ),
    'Suspicious Activity': CategoryData(
      icon: Icons.warning_amber_rounded,
      count: 139,
      color: AppColors.c_F7931E,
    ),
  };

  // Timeline data (last 7 days)
  final List<DayThreatData> _timelineData = [
    DayThreatData(dayLabel: 'Mon', critical: 12, high: 25, medium: 18, low: 8),
    DayThreatData(dayLabel: 'Tue', critical: 8, high: 22, medium: 20, low: 12),
    DayThreatData(dayLabel: 'Wed', critical: 15, high: 28, medium: 16, low: 9),
    DayThreatData(dayLabel: 'Thu', critical: 10, high: 24, medium: 22, low: 11),
    DayThreatData(dayLabel: 'Fri', critical: 18, high: 30, medium: 19, low: 7),
    DayThreatData(dayLabel: 'Sat', critical: 6, high: 15, medium: 12, low: 10),
    DayThreatData(dayLabel: 'Sun', critical: 9, high: 18, medium: 14, low: 8),
  ];

  // Top threats
  final List<TopThreatData> _topThreats = [
    TopThreatData(
      name: 'Trojan.GenericKD',
      description: 'Generic trojan malware infection',
      count: 145,
      severity: ThreatSeverity.critical,
      isIncreasing: true,
    ),
    TopThreatData(
      name: 'Phishing Email Campaign',
      description: 'Targeted email phishing attempts',
      count: 128,
      severity: ThreatSeverity.high,
      isIncreasing: true,
    ),
    TopThreatData(
      name: 'SQL Injection Attempts',
      description: 'Database injection attacks',
      count: 97,
      severity: ThreatSeverity.high,
      isIncreasing: false,
    ),
    TopThreatData(
      name: 'Brute Force Login',
      description: 'Multiple failed authentication',
      count: 89,
      severity: ThreatSeverity.medium,
      isIncreasing: true,
    ),
    TopThreatData(
      name: 'Port Scanning',
      description: 'Network reconnaissance activity',
      count: 76,
      severity: ThreatSeverity.medium,
      isIncreasing: false,
    ),
  ];

  // Severity distribution
  final Map<String, int> _severityDistribution = {
    'critical': 78,
    'high': 162,
    'medium': 121,
    'low': 65,
  };

  Map<String, CategoryData> get categories => _categories;
  List<DayThreatData> get timelineData => _timelineData;
  List<TopThreatData> get topThreats => _topThreats;
  Map<String, int> get severityDistribution => _severityDistribution;

  int get totalThreats =>
      _categories.values.fold(0, (sum, category) => sum + category.count);

  int get criticalCount => _severityDistribution['critical'] ?? 0;
  int get highCount => _severityDistribution['high'] ?? 0;
  int get mediumCount => _severityDistribution['medium'] ?? 0;
  int get lowCount => _severityDistribution['low'] ?? 0;
}

class CategoryData {
  final IconData icon;
  final int count;
  final Color color;

  CategoryData({required this.icon, required this.count, required this.color});
}

class TopThreatData {
  final String name;
  final String description;
  final int count;
  final ThreatSeverity severity;
  final bool isIncreasing;

  TopThreatData({
    required this.name,
    required this.description,
    required this.count,
    required this.severity,
    required this.isIncreasing,
  });
}
