import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_threat_summary_cubit.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_threat_summary_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/severity_distribution_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/threat_category_card.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/threat_timeline_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_threat_summary_page/widgets/top_threat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardThreatSummaryBody extends StatelessWidget {
  const DashboardThreatSummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardThreatSummaryCubit, DashboardThreatSummaryState>(
      builder: (context, state) {
        if (state.isLoading && state.summary == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null && state.summary == null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                state.errorMessage!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          );
        }

        final summary = state.summary;
        if (summary == null) {
          return Center(
            child: Text(
              'Threat summary not available',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Statistics
                _buildSummaryCards(summary),
                const SizedBox(height: 20),

                // Timeline Chart
                ThreatTimelineChart(data: summary.timelineData),
                const SizedBox(height: 20),

                // Severity Distribution
                SeverityDistributionChart(
                  critical: summary.criticalCount,
                  high: summary.highCount,
                  medium: summary.mediumCount,
                  low: summary.lowCount,
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
                ...summary.categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ThreatCategoryCard(
                      icon: IconData(
                        category.iconCodePoint,
                        fontFamily: 'MaterialIcons',
                      ),
                      category: category.name,
                      count: category.count,
                      total: summary.totalThreats,
                      color: Color(category.colorValue),
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
                ...summary.topThreats.map((threat) {
                  return TopThreatItem(
                    name: threat.name,
                    description: threat.description,
                    count: threat.count,
                    severity: _mapSeverity(threat.severity),
                    isIncreasing: threat.isIncreasing,
                  );
                }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryCards(ThreatSummaryModel summary) {
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
          '${summary.totalThreats}',
          Icons.shield_rounded,
          AppColors.buttonColor,
        ),
        _buildSummaryCard(
          'Critical',
          '${summary.criticalCount}',
          Icons.dangerous_rounded,
          const Color(0xFF8B0000),
        ),
        _buildSummaryCard(
          'High Priority',
          '${summary.highCount}',
          Icons.error_rounded,
          AppColors.c_F71E52,
        ),
        _buildSummaryCard(
          'Categories',
          '${summary.categories.length}',
          Icons.category_rounded,
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

  ThreatSeverity _mapSeverity(String value) {
    switch (value.toLowerCase()) {
      case 'critical':
        return ThreatSeverity.critical;
      case 'high':
        return ThreatSeverity.high;
      case 'low':
        return ThreatSeverity.low;
      default:
        return ThreatSeverity.medium;
    }
  }
}
