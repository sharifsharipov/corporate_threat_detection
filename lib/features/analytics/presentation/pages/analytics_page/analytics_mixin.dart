import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/analytics_page.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/widgets/attack_vector_chart.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/widgets/trend_line_chart.dart';
import 'package:flutter/material.dart';

mixin AnalyticsMixin on State<AnalyticsPage> {
  // Performance Metrics
  final Map<String, MetricData> _metrics = {
    'Detection Rate': MetricData(
      value: '98.7%',
      icon: Icons.shield_outlined,
      color: AppColors.c_03A64B,
      changePercentage: 2.3,
      isIncrease: true,
    ),
    'Blocked Threats': MetricData(
      value: '1,247',
      icon: Icons.block,
      color: AppColors.c_F71E52,
      changePercentage: 15.8,
      isIncrease: true,
    ),
    'Avg Response': MetricData(
      value: '245ms',
      icon: Icons.speed,
      color: AppColors.buttonColor,
      changePercentage: 8.2,
      isIncrease: false,
    ),
    'System Uptime': MetricData(
      value: '99.9%',
      icon: Icons.check_circle_outline,
      color: AppColors.c_03A64B,
      changePercentage: 0.1,
      isIncrease: true,
    ),
  };

  // Monthly trend data (last 6 months)
  final List<MonthlyTrendData> _trendData = [
    MonthlyTrendData(
      month: 'Jul',
      detected: 890,
      blocked: 875,
      falsePositives: 12,
    ),
    MonthlyTrendData(
      month: 'Aug',
      detected: 920,
      blocked: 902,
      falsePositives: 15,
    ),
    MonthlyTrendData(
      month: 'Sep',
      detected: 1050,
      blocked: 1032,
      falsePositives: 18,
    ),
    MonthlyTrendData(
      month: 'Oct',
      detected: 980,
      blocked: 965,
      falsePositives: 14,
    ),
    MonthlyTrendData(
      month: 'Nov',
      detected: 1120,
      blocked: 1098,
      falsePositives: 20,
    ),
    MonthlyTrendData(
      month: 'Dec',
      detected: 1247,
      blocked: 1230,
      falsePositives: 17,
    ),
  ];

  // Attack vector distribution
  final Map<String, AttackVectorData> _attackVectors = {
    'Malware': AttackVectorData(count: 342, color: AppColors.c_F71E52),
    'Phishing': AttackVectorData(count: 287, color: AppColors.c_F7931E),
    'DDoS': AttackVectorData(count: 156, color: const Color(0xFF8B0000)),
    'Ransomware': AttackVectorData(count: 98, color: AppColors.c_5856D6),
    'SQL Injection': AttackVectorData(count: 234, color: AppColors.buttonColor),
    'XSS': AttackVectorData(count: 130, color: AppColors.c_03A64B),
  };

  // Response time data
  final ResponseTimeData _responseTime = ResponseTimeData(
    averageMs: 245,
    minMs: 85,
    maxMs: 1250,
  );

  Map<String, MetricData> get metrics => _metrics;
  List<MonthlyTrendData> get trendData => _trendData;
  Map<String, AttackVectorData> get attackVectors => _attackVectors;
  ResponseTimeData get responseTime => _responseTime;
}

class MetricData {
  final String value;
  final IconData icon;
  final Color color;
  final double changePercentage;
  final bool isIncrease;

  MetricData({
    required this.value,
    required this.icon,
    required this.color,
    required this.changePercentage,
    required this.isIncrease,
  });
}

class ResponseTimeData {
  final double averageMs;
  final double minMs;
  final double maxMs;

  ResponseTimeData({
    required this.averageMs,
    required this.minMs,
    required this.maxMs,
  });
}
