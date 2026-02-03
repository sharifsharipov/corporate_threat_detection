import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThreatTimelineChart extends StatelessWidget {
  final List<DayThreatData> data;

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

  Widget _buildBar(DayThreatData dayData) {
    final maxHeight = 140.0;
    final maxCount = data
        .map((d) => d.totalCount)
        .reduce((a, b) => a > b ? a : b);
    final height = maxCount > 0
        ? (dayData.totalCount / maxCount) * maxHeight
        : 0.0;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (dayData.totalCount > 0)
              Text(
                '${dayData.totalCount}',
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
                    _getBarColor(dayData),
                    _getBarColor(dayData).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              dayData.dayLabel,
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBarColor(DayThreatData dayData) {
    if (dayData.critical > 0 || dayData.high > dayData.totalCount * 0.5) {
      return AppColors.c_F71E52;
    } else if (dayData.medium > dayData.totalCount * 0.5) {
      return AppColors.c_F7931E;
    } else {
      return AppColors.buttonColor;
    }
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

class DayThreatData {
  final String dayLabel;
  final int critical;
  final int high;
  final int medium;
  final int low;

  DayThreatData({
    required this.dayLabel,
    required this.critical,
    required this.high,
    required this.medium,
    required this.low,
  });

  int get totalCount => critical + high + medium + low;
}
