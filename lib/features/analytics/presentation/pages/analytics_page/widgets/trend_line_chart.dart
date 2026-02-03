import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TrendLineChart extends StatelessWidget {
  final List<MonthlyTrendData> data;

  const TrendLineChart({super.key, required this.data});

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
            'Monthly Threat Trends',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: CustomPaint(
              painter: _TrendLinePainter(data: data),
              child: Container(),
            ),
          ),
          const SizedBox(height: 12),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLegendItem('Detected', AppColors.c_F71E52),
        _buildLegendItem('Blocked', AppColors.c_03A64B),
        _buildLegendItem('False Positives', AppColors.c_F7931E),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 3,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}

class _TrendLinePainter extends CustomPainter {
  final List<MonthlyTrendData> data;

  _TrendLinePainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    // Grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = 1;

    for (int i = 0; i <= 5; i++) {
      final y = size.height * i / 5;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final maxValue = data.fold<int>(
      0,
      (max, d) => [
        max,
        d.detected,
        d.blocked,
        d.falsePositives,
      ].reduce((a, b) => a > b ? a : b),
    );

    // Draw lines
    _drawLine(
      canvas,
      size,
      data.map((d) => d.detected).toList(),
      maxValue,
      AppColors.c_F71E52,
    );
    _drawLine(
      canvas,
      size,
      data.map((d) => d.blocked).toList(),
      maxValue,
      AppColors.c_03A64B,
    );
    _drawLine(
      canvas,
      size,
      data.map((d) => d.falsePositives).toList(),
      maxValue,
      AppColors.c_F7931E,
    );

    // Draw month labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < data.length; i++) {
      final x = size.width * i / (data.length - 1);
      textPainter.text = TextSpan(
        text: data[i].month,
        style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height + 8),
      );
    }
  }

  void _drawLine(
    Canvas canvas,
    Size size,
    List<int> values,
    int maxValue,
    Color color,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    for (int i = 0; i < values.length; i++) {
      final x = size.width * i / (values.length - 1);
      final normalizedValue = maxValue > 0 ? values[i] / maxValue : 0.5;
      final y = size.height - (normalizedValue * size.height * 0.9);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);

    // Draw points
    final pointPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 0; i < values.length; i++) {
      final x = size.width * i / (values.length - 1);
      final normalizedValue = maxValue > 0 ? values[i] / maxValue : 0.5;
      final y = size.height - (normalizedValue * size.height * 0.9);
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
    }
  }

  @override
  bool shouldRepaint(_TrendLinePainter oldDelegate) {
    return oldDelegate.data != data;
  }
}

class MonthlyTrendData {
  final String month;
  final int detected;
  final int blocked;
  final int falsePositives;

  MonthlyTrendData({
    required this.month,
    required this.detected,
    required this.blocked,
    required this.falsePositives,
  });
}
