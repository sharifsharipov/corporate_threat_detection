import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum AlertSeverity { critical, high, medium, low }

enum AlertStatus { active, acknowledged, resolved }

class AlertItemCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final AlertSeverity severity;
  final AlertStatus status;
  final DateTime timestamp;
  final VoidCallback onAcknowledge;
  final VoidCallback onResolve;

  const AlertItemCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.status,
    required this.timestamp,
    required this.onAcknowledge,
    required this.onResolve,
  });

  Color get _severityColor {
    switch (severity) {
      case AlertSeverity.critical:
        return AppColors.c_8B0000;
      case AlertSeverity.high:
        return AppColors.c_F71E52;
      case AlertSeverity.medium:
        return AppColors.c_F7931E;
      case AlertSeverity.low:
        return AppColors.c_03A64B;
    }
  }

  String get _severityLabel {
    return severity.name.toUpperCase();
  }

  String get _formattedTime {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: status == AlertStatus.resolved
              ? Colors.grey.shade200
              : _severityColor.withOpacity(0.3),
        ),
        boxShadow: [
          if (status != AlertStatus.resolved)
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Severity Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _severityColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    severity == AlertSeverity.critical ||
                            severity == AlertSeverity.high
                        ? Icons.warning_rounded
                        : Icons.info_outline_rounded,
                    color: _severityColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: _severityColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _severityLabel,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _formattedTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const Spacer(),
                          if (status == AlertStatus.resolved)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.c_03A64B.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.c_03A64B.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 12,
                                    color: AppColors.c_03A64B,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'RESOLVED',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.c_03A64B,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else if (status == AlertStatus.acknowledged)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.buttonColor.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 12,
                                    color: AppColors.buttonColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'ACK',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: status == AlertStatus.resolved
                              ? Colors.grey.shade600
                              : Colors.black87,
                          decoration: status == AlertStatus.resolved
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          if (status != AlertStatus.resolved)
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade100)),
                color: Colors.grey.shade50.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  if (status == AlertStatus.active)
                    Expanded(
                      child: TextButton.icon(
                        onPressed: onAcknowledge,
                        icon: const Icon(Icons.check, size: 16),
                        label: const Text('Acknowledge'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ),
                  if (status == AlertStatus.active)
                    Container(
                      width: 1,
                      height: 24,
                      color: Colors.grey.shade200,
                    ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: onResolve,
                      icon: const Icon(Icons.done_all, size: 16),
                      label: const Text('Resolve'),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.c_03A64B,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
