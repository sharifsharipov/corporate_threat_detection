import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart'
    as model;
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_overview_cubit.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_overview_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/alert_item.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/stat_card.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/threat_level_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardOverviewBody extends StatelessWidget {
  const DashboardOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardOverviewCubit, DashboardOverviewState>(
      builder: (context, state) {
        if (state.isLoading &&
            state.stats.isEmpty &&
            state.alerts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.errorMessage != null &&
            state.stats.isEmpty &&
            state.alerts.isEmpty) {
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

        return Container(
          color: AppColors.c_f0f2f4,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Statistics Cards Grid
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.4,
                  children: _buildStatCards(state.stats),
                ),
                const SizedBox(height: 20),

                // Threat Level Indicator
                ThreatLevelIndicator(
                  level: state.threatLevel,
                  percentage: state.threatPercentage,
                ),
                const SizedBox(height: 24),

                // Recent Alerts Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Alerts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all alerts
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Alert Items
                if (state.alerts.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'No recent alerts',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  )
                else
                  ...state.alerts.take(5).map((alert) {
                    return AlertItem(
                      title: alert.title,
                      timeAgo: _timeAgo(alert.timestamp),
                      severity: _mapSeverity(alert.severity),
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

  List<Widget> _buildStatCards(List<StatModel> stats) {
    if (stats.isEmpty) {
      return const [
        StatCard(
          icon: Icons.shield_rounded,
          value: '0',
          label: 'Total Threats',
          color: AppColors.c_F71E52,
        ),
        StatCard(
          icon: Icons.notifications_active_rounded,
          value: '0',
          label: 'Active Alerts',
          color: AppColors.c_F7931E,
        ),
        StatCard(
          icon: Icons.check_circle_rounded,
          value: '0',
          label: 'Resolved',
          color: AppColors.c_03A64B,
        ),
        StatCard(
          icon: Icons.monitor_heart_rounded,
          value: 'Unknown',
          label: 'System Status',
          color: AppColors.buttonColor,
        ),
      ];
    }

    return stats
        .map(
          (stat) => StatCard(
            icon: IconData(stat.iconCodePoint, fontFamily: 'MaterialIcons'),
            value: stat.value,
            label: stat.label,
            color: Color(stat.colorValue),
            backgroundColor: Color(stat.backgroundColorValue),
          ),
        )
        .toList();
  }

  AlertSeverity _mapSeverity(model.AlertSeverity severity) {
    switch (severity) {
      case model.AlertSeverity.critical:
        return AlertSeverity.critical;
      case model.AlertSeverity.high:
        return AlertSeverity.high;
      case model.AlertSeverity.medium:
        return AlertSeverity.medium;
      case model.AlertSeverity.low:
        return AlertSeverity.low;
    }
  }

  String _timeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    }
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    }
    if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    }
    return '${difference.inDays}d ago';
  }
}
