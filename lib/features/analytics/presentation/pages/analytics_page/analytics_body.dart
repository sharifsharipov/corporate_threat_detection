import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/analytics_cubit.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/bloc/analytics_state.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/widgets/attack_vector_chart.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/widgets/performance_metric_card.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/widgets/response_time_widget.dart';
import 'package:corporate_threat_detection/features/analytics/presentation/pages/analytics_page/widgets/trend_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsBody extends StatelessWidget {
  const AnalyticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsCubit, AnalyticsState>(
      builder: (context, state) {
        final metrics = state.metrics;
        return Container(
          color: AppColors.c_f0f2f4,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.isLoading && metrics.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  // Performance Metrics Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.95,
                    children: metrics.entries.map((entry) {
                      return PerformanceMetricCard(
                        title: entry.key,
                        value: entry.value.value,
                        icon: entry.value.icon,
                        color: entry.value.color,
                        changePercentage: entry.value.changePercentage,
                        isIncrease: entry.value.isIncrease,
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 20),

                // Monthly Trend Chart
                TrendLineChart(data: state.trends),
                const SizedBox(height: 20),

                // Response Time Widget
                ResponseTimeWidget(
                  averageMs: state.responseTime.averageMs,
                  minMs: state.responseTime.minMs,
                  maxMs: state.responseTime.maxMs,
                ),
                const SizedBox(height: 20),

                // Attack Vector Chart
                AttackVectorChart(attackVectors: state.attackVectors),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
