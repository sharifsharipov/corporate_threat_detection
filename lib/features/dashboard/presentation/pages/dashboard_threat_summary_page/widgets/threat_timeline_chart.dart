import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ThreatTimelineChart extends StatelessWidget {
  final List<ThreatTimelinePoint> data;

  const ThreatTimelineChart({super.key, required this.data});

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
            'Threat Trend (Last 7 Days)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: data.map((dayData) => _buildBar(dayData)).toList(),
            ),
          ),
          const SizedBox(height: 12),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildBar(ThreatTimelinePoint point) {
    final maxHeight = 140.0;
    final maxCount = data
        .map((d) => d.count)
        .reduce((a, b) => a > b ? a : b);
    final height = maxCount > 0
        ? (point.count / maxCount) * maxHeight
        : 0.0;
    final label = DateFormat('E').format(point.date);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (point.count > 0)
              Text(
                '${point.count}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            const SizedBox(height: 4),
            Container(
              height: height.clamp(4, maxHeight),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _getBarColor(point.count, maxCount),
                    _getBarColor(point.count, maxCount).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBarColor(int count, int maxCount) {
    if (maxCount == 0) {
      return AppColors.buttonColor;
    }
    final ratio = count / maxCount;
    if (ratio >= 0.7) {
      return AppColors.c_F71E52;
    }
    if (ratio >= 0.4) {
      return AppColors.c_F7931E;
    }
    return AppColors.buttonColor;
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem('Critical', AppColors.c_F71E52),
        const SizedBox(width: 16),
        _buildLegendItem('High/Medium', AppColors.c_F7931E),
        const SizedBox(width: 16),
        _buildLegendItem('Low', AppColors.buttonColor),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
