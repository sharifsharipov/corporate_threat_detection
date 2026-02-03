import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/dashboard_threat_summary_mixin.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/severity_distribution_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/threat_category_card.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/threat_timeline_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/top_threat_item.dart';
import 'package:flutter/material.dart';

class DashboardThreatSummaryBody extends StatelessWidget {
  final DashboardThreatSummaryMixin mixin;

  const DashboardThreatSummaryBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c_f0f2f4,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Statistics
            _buildSummaryCards(),
            const SizedBox(height: 20),

            // Timeline Chart
            ThreatTimelineChart(data: mixin.timelineData),
            const SizedBox(height: 20),

            // Severity Distribution
            SeverityDistributionChart(
              critical: mixin.criticalCount,
              high: mixin.highCount,
              medium: mixin.mediumCount,
              low: mixin.lowCount,
            ),
            const SizedBox(height: 20),

            // Threat Categories
            const Text(
              'Threat Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...mixin.categories.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ThreatCategoryCard(
                  icon: entry.value.icon,
                  category: entry.key,
                  count: entry.value.count,
                  total: mixin.totalThreats,
                  color: entry.value.color,
                ),
              );
            }),
            const SizedBox(height: 20),

            // Top Threats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Threats',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to all threats
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...mixin.topThreats.map((threat) {
              return TopThreatItem(
                name: threat.name,
                description: threat.description,
                count: threat.count,
                severity: threat.severity,
                isIncreasing: threat.isIncreasing,
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildSummaryCard(
          'Total Threats',
          '${mixin.totalThreats}',
          Icons.shield_outlined,
          AppColors.buttonColor,
        ),
        _buildSummaryCard(
          'Critical',
          '${mixin.criticalCount}',
          Icons.dangerous_outlined,
          const Color(0xFF8B0000),
        ),
        _buildSummaryCard(
          'High Priority',
          '${mixin.highCount}',
          Icons.error_outline,
          AppColors.c_F71E52,
        ),
        _buildSummaryCard(
          'Categories',
          '${mixin.categories.length}',
          Icons.category_outlined,
          AppColors.c_F7931E,
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
