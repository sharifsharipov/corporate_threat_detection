import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ResponseTimeWidget extends StatelessWidget {
  final double averageMs;
  final double minMs;
  final double maxMs;

  const ResponseTimeWidget({
    super.key,
    required this.averageMs,
    required this.minMs,
    required this.maxMs,
  });

  String _formatTime(double ms) {
    if (ms < 1000) {
      return '${ms.toStringAsFixed(0)}ms';
    } else {
      return '${(ms / 1000).toStringAsFixed(2)}s';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Response Time',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          // Average Response Time
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.speed,
                  color: AppColors.buttonColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _formatTime(averageMs),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonColor,
                    ),
                  ),
                  Text(
                    'Average Response',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Min/Max Bar
          _buildRangeBar(),
          const SizedBox(height: 12),
          // Min/Max Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Min',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatTime(minMs),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c_03A64B,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Max',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatTime(maxMs),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c_F71E52,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRangeBar() {
    final range = maxMs - minMs;
    final avgPosition = range > 0 ? (averageMs - minMs) / range : 0.5;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth > 0
            ? constraints.maxWidth * 0.95
            : 300.0;

        return SizedBox(
          height: 40,
          child: Stack(
            children: [
              // Background bar
              Positioned(
                left: 0,
                right: 0,
                top: 18,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.c_03A64B,
                        AppColors.c_F7931E,
                        AppColors.c_F71E52,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              // Average indicator
              Positioned(
                left: avgPosition * availableWidth,
                top: 0,
                child: Container(
                  width: 3,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Average marker
              Positioned(
                left: (avgPosition * availableWidth) - 6,
                top: 15,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
