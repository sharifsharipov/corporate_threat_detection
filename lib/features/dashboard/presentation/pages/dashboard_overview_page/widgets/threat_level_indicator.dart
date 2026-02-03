import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum ThreatLevel { low, medium, high, critical }

class ThreatLevelIndicator extends StatelessWidget {
  final ThreatLevel level;
  final int percentage;

  const ThreatLevelIndicator({
    super.key,
    required this.level,
    required this.percentage,
  });

  Color get _getColor {
    switch (level) {
      case ThreatLevel.low:
        return AppColors.c_03A64B;
      case ThreatLevel.medium:
        return AppColors.c_F7931E;
      case ThreatLevel.high:
        return AppColors.c_F71E52;
      case ThreatLevel.critical:
        return const Color(0xFF8B0000);
    }
  }

  String get _getLevelText {
    switch (level) {
      case ThreatLevel.low:
        return 'Low Risk';
      case ThreatLevel.medium:
        return 'Medium Risk';
      case ThreatLevel.high:
        return 'High Risk';
      case ThreatLevel.critical:
        return 'Critical Risk';
    }
  }

  IconData get _getIcon {
    switch (level) {
      case ThreatLevel.low:
        return Icons.check_circle_outline;
      case ThreatLevel.medium:
        return Icons.warning_amber_rounded;
      case ThreatLevel.high:
        return Icons.error_outline;
      case ThreatLevel.critical:
        return Icons.dangerous_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(_getIcon, color: _getColor, size: 28),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Threat Level',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _getLevelText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _getColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(_getColor),
            ),
          ),
        ],
      ),
    );
  }
}
