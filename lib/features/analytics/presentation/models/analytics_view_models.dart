import 'package:flutter/material.dart';

class MetricData {
  final String value;
  final IconData icon;
  final Color color;
  final double changePercentage;
  final bool isIncrease;

  const MetricData({
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

  const ResponseTimeData({
    required this.averageMs,
    required this.minMs,
    required this.maxMs,
  });
}

class MonthlyTrendData {
  final String month;
  final int detected;
  final int blocked;
  final int falsePositives;

  const MonthlyTrendData({
    required this.month,
    required this.detected,
    required this.blocked,
    required this.falsePositives,
  });
}

class AttackVectorData {
  final int count;
  final Color color;

  const AttackVectorData({required this.count, required this.color});
}
