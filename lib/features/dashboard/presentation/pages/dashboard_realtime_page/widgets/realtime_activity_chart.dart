import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RealtimeActivityChart extends StatelessWidget {
  final List<int> dataPoints;

  const RealtimeActivityChart({super.key, required this.dataPoints});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Threat Activity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.c_03A64B.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.c_03A64B,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Live',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.c_03A64B,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: CustomPaint(
              painter: _ActivityChartPainter(dataPoints: dataPoints),
              child: Container(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '60s ago',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              Text(
                'Now',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityChartPainter extends CustomPainter {
  final List<int> dataPoints;

  _ActivityChartPainter({required this.dataPoints});

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) return;

    final maxValue = dataPoints.reduce(math.max).toDouble();
    final minValue = 0.0;
    final range = maxValue - minValue;

    // Grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 1;

    for (int i = 0; i <= 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Area under the line
    final areaPaint = Paint()
      ..color = AppColors.buttonColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final areaPath = Path();
    areaPath.moveTo(0, size.height);

    for (int i = 0; i < dataPoints.length; i++) {
      final x = size.width * i / (dataPoints.length - 1);
      final normalizedValue = range > 0
          ? (dataPoints[i] - minValue) / range
          : 0.5;
      final y = size.height - (normalizedValue * size.height);

      if (i == 0) {
        areaPath.lineTo(x, y);
      } else {
        areaPath.lineTo(x, y);
      }
    }

    areaPath.lineTo(size.width, size.height);
    areaPath.close();
    canvas.drawPath(areaPath, areaPaint);

    // Line
    final linePaint = Paint()
      ..color = AppColors.buttonColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final linePath = Path();
    for (int i = 0; i < dataPoints.length; i++) {
      final x = size.width * i / (dataPoints.length - 1);
      final normalizedValue = range > 0
          ? (dataPoints[i] - minValue) / range
          : 0.5;
      final y = size.height - (normalizedValue * size.height);

      if (i == 0) {
        linePath.moveTo(x, y);
      } else {
        linePath.lineTo(x, y);
      }
    }

    canvas.drawPath(linePath, linePaint);

    // Points
    final pointPaint = Paint()
      ..color = AppColors.buttonColor
      ..style = PaintingStyle.fill;

    final pointBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dataPoints.length; i++) {
      final x = size.width * i / (dataPoints.length - 1);
      final normalizedValue = range > 0
          ? (dataPoints[i] - minValue) / range
          : 0.5;
      final y = size.height - (normalizedValue * size.height);

      if (i == dataPoints.length - 1) {
        // Highlight the last point
        canvas.drawCircle(Offset(x, y), 5, pointBorderPaint);
        canvas.drawCircle(Offset(x, y), 3.5, pointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_ActivityChartPainter oldDelegate) {
    return oldDelegate.dataPoints != dataPoints;
  }
}
