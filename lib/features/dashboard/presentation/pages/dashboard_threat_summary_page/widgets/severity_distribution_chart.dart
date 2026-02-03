import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SeverityDistributionChart extends StatelessWidget {
  final int critical;
  final int high;
  final int medium;
  final int low;

  const SeverityDistributionChart({
    super.key,
    required this.critical,
    required this.high,
    required this.medium,
    required this.low,
  });

  int get total => critical + high + medium + low;

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
            'Severity Distribution',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 160,
              height: 160,
              child: Stack(
                children: [
                  CustomPaint(
                    size: const Size(160, 160),
                    painter: _DonutChartPainter(
                      critical: critical,
                      high: high,
                      medium: medium,
                      low: low,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$total',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildLegendItems(),
        ],
      ),
    );
  }

  Widget _buildLegendItems() {
    return Column(
      children: [
        _buildLegendItem(
          'Critical',
          const Color(0xFF8B0000),
          critical,
          (critical / total * 100).toStringAsFixed(1),
        ),
        const SizedBox(height: 8),
        _buildLegendItem(
          'High',
          AppColors.c_F71E52,
          high,
          (high / total * 100).toStringAsFixed(1),
        ),
        const SizedBox(height: 8),
        _buildLegendItem(
          'Medium',
          AppColors.c_F7931E,
          medium,
          (medium / total * 100).toStringAsFixed(1),
        ),
        const SizedBox(height: 8),
        _buildLegendItem(
          'Low',
          AppColors.c_03A64B,
          low,
          (low / total * 100).toStringAsFixed(1),
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    String label,
    Color color,
    int count,
    String percentage,
  ) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '($percentage%)',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final int critical;
  final int high;
  final int medium;
  final int low;

  _DonutChartPainter({
    required this.critical,
    required this.high,
    required this.medium,
    required this.low,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final total = critical + high + medium + low;
    if (total == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 30.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -math.pi / 2;

    // Critical
    if (critical > 0) {
      final sweepAngle = (critical / total) * 2 * math.pi;
      paint.color = const Color(0xFF8B0000);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    // High
    if (high > 0) {
      final sweepAngle = (high / total) * 2 * math.pi;
      paint.color = AppColors.c_F71E52;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    // Medium
    if (medium > 0) {
      final sweepAngle = (medium / total) * 2 * math.pi;
      paint.color = AppColors.c_F7931E;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    // Low
    if (low > 0) {
      final sweepAngle = (low / total) * 2 * math.pi;
      paint.color = AppColors.c_03A64B;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_DonutChartPainter oldDelegate) {
    return oldDelegate.critical != critical ||
        oldDelegate.high != high ||
        oldDelegate.medium != medium ||
        oldDelegate.low != low;
  }
}
