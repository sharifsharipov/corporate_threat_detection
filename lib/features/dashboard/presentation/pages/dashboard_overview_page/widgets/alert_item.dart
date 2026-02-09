import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum AlertSeverity { low, medium, high, critical }

class AlertItem extends StatelessWidget {
  final String title;
  final String timeAgo;
  final AlertSeverity severity;

  const AlertItem({
    super.key,
    required this.title,
    required this.timeAgo,
    required this.severity,
  });

  Color get _getSeverityColor {
    switch (severity) {
      case AlertSeverity.low:
        return AppColors.c_03A64B;
      case AlertSeverity.medium:
        return AppColors.c_F7931E;
      case AlertSeverity.high:
        return AppColors.c_F71E52;
      case AlertSeverity.critical:
        return const Color(0xFF8B0000);
    }
  }

  IconData get _getSeverityIcon {
    switch (severity) {
      case AlertSeverity.low:
        return Icons.info_rounded;
      case AlertSeverity.medium:
        return Icons.warning_amber_rounded;
      case AlertSeverity.high:
        return Icons.error_rounded;
      case AlertSeverity.critical:
        return Icons.dangerous_rounded;
    }
  }

  String get _getSeverityLabel {
    switch (severity) {
      case AlertSeverity.low:
        return 'Low';
      case AlertSeverity.medium:
        return 'Medium';
      case AlertSeverity.high:
        return 'High';
      case AlertSeverity.critical:
        return 'Critical';
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
        border: Border.all(
          color: _getSeverityColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getSeverityColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(_getSeverityIcon, color: _getSeverityColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getSeverityColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _getSeverityLabel,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _getSeverityColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
        ],
      ),
    );
  }
}
