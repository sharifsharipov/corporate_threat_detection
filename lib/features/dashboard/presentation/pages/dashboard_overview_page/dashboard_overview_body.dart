import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/alert_item.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/stat_card.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_overview_page/widgets/threat_level_indicator.dart';
import 'package:flutter/material.dart';

class DashboardOverviewBody extends StatelessWidget {
  const DashboardOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: const [
                StatCard(
                  icon: Icons.shield_rounded,
                  value: '1,247',
                  label: 'Total Threats',
                  color: AppColors.c_F71E52,
                ),
                StatCard(
                  icon: Icons.notifications_active_rounded,
                  value: '23',
                  label: 'Active Alerts',
                  color: AppColors.c_F7931E,
                ),
                StatCard(
                  icon: Icons.check_circle_rounded,
                  value: '1,189',
                  label: 'Resolved',
                  color: AppColors.c_03A64B,
                ),
                StatCard(
                  icon: Icons.monitor_heart_rounded,
                  value: 'Online',
                  label: 'System Status',
                  color: AppColors.buttonColor,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Threat Level Indicator
            const ThreatLevelIndicator(
              level: ThreatLevel.medium,
              percentage: 65,
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
            const AlertItem(
              title: 'Suspicious login attempt detected',
              timeAgo: '2 min ago',
              severity: AlertSeverity.high,
            ),
            const AlertItem(
              title: 'Malware detected in email attachment',
              timeAgo: '15 min ago',
              severity: AlertSeverity.critical,
            ),
            const AlertItem(
              title: 'Unusual network activity',
              timeAgo: '1 hour ago',
              severity: AlertSeverity.medium,
            ),
            const AlertItem(
              title: 'Failed authentication attempts',
              timeAgo: '2 hours ago',
              severity: AlertSeverity.medium,
            ),
            const AlertItem(
              title: 'System update completed',
              timeAgo: '3 hours ago',
              severity: AlertSeverity.low,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
