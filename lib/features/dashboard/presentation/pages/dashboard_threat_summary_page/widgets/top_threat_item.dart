import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum ThreatSeverity { critical, high, medium, low }

class TopThreatItem extends StatelessWidget {
  final String name;
  final String description;
  final int count;
  final ThreatSeverity severity;
  final bool isIncreasing;

  const TopThreatItem({
    super.key,
    required this.name,
    required this.description,
    required this.count,
    required this.severity,
    this.isIncreasing = true,
  });

  Color get _severityColor {
    switch (severity) {
      case ThreatSeverity.critical:
        return const Color(0xFF8B0000);
      case ThreatSeverity.high:
        return AppColors.c_F71E52;
      case ThreatSeverity.medium:
        return AppColors.c_F7931E;
      case ThreatSeverity.low:
        return AppColors.c_03A64B;
    }
  }

  String get _severityLabel {
    switch (severity) {
      case ThreatSeverity.critical:
        return 'Critical';
      case ThreatSeverity.high:
        return 'High';
      case ThreatSeverity.medium:
        return 'Medium';
      case ThreatSeverity.low:
        return 'Low';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _severityColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: _severityColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      isIncreasing ? Icons.trending_up : Icons.trending_down,
                      size: 16,
                      color: isIncreasing
                          ? Colors.red.shade600
                          : Colors.green.shade600,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _severityColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _severityLabel,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _severityColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$count occurrences',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
