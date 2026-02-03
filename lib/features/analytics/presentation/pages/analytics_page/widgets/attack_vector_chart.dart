import 'package:flutter/material.dart';
import 'dart:math' as math;

class AttackVectorChart extends StatelessWidget {
  final Map<String, AttackVectorData> attackVectors;

  const AttackVectorChart({super.key, required this.attackVectors});

  int get total =>
      attackVectors.values.fold(0, (sum, data) => sum + data.count);

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
            'Attack Vectors',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 180,
              height: 180,
              child: CustomPaint(
                painter: _PieChartPainter(attackVectors: attackVectors),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...attackVectors.entries.map((entry) {
            final percentage = total > 0
                ? (entry.value.count / total * 100)
                : 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: entry.value.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    '${entry.value.count}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(${percentage.toStringAsFixed(1)}%)',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _PieChartPainter extends CustomPainter {
  final Map<String, AttackVectorData> attackVectors;

  _PieChartPainter({required this.attackVectors});

  @override
  void paint(Canvas canvas, Size size) {
    final total = attackVectors.values.fold(0, (sum, data) => sum + data.count);
    if (total == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()..style = PaintingStyle.fill;

    double startAngle = -math.pi / 2;

    attackVectors.forEach((name, data) {
      final sweepAngle = (data.count / total) * 2 * math.pi;
      paint.color = data.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
    });
  }

  @override
  bool shouldRepaint(_PieChartPainter oldDelegate) {
    return oldDelegate.attackVectors != attackVectors;
  }
}

class AttackVectorData {
  final int count;
  final Color color;

  AttackVectorData({required this.count, required this.color});
}
