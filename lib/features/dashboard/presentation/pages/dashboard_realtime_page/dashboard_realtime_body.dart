import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/dashboard_realtime_mixin.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/live_metric_card.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/realtime_activity_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/threat_feed_item.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/threat_map_widget.dart';
import 'package:flutter/material.dart';

class DashboardRealtimeBody extends StatelessWidget {
  final DashboardRealtimeMixin mixin;

  const DashboardRealtimeBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c_f0f2f4,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Live Metrics Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                LiveMetricCard(
                  icon: Icons.warning_amber_rounded,
                  value: mixin.activeThreats,
                  label: 'Active Threats',
                  color: AppColors.c_F71E52,
                  isIncreasing: true,
                  changeAmount: mixin.activeThreatsChange,
                ),
                LiveMetricCard(
                  icon: Icons.shield_rounded,
                  value: mixin.blockedAttacks,
                  label: 'Blocked Today',
                  color: AppColors.c_03A64B,
                  isIncreasing: true,
                  changeAmount: mixin.blockedAttacksChange,
                ),
                LiveMetricCard(
                  icon: Icons.people_alt_rounded,
                  value: mixin.activeConnections,
                  label: 'Active Connections',
                  color: AppColors.buttonColor,
                  isIncreasing: true,
                  changeAmount: mixin.activeConnectionsChange,
                ),
                LiveMetricCard(
                  icon: Icons.speed_rounded,
                  value: mixin.systemLoad,
                  label: 'System Load %',
                  color: AppColors.c_F7931E,
                  isIncreasing: true,
                  changeAmount: mixin.systemLoadChange,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Activity Chart
            RealtimeActivityChart(dataPoints: mixin.activityData),
            const SizedBox(height: 20),

            // Threat Feed Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Live Threat Feed',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.shade600.withOpacity(0.5),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
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

            // Threat Feed Items
            if (mixin.threatFeed.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    'No recent threats detected',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              )
            else
              ...mixin.threatFeed.asMap().entries.map((entry) {
                final index = entry.key;
                final threat = entry.value;
                return ThreatFeedItem(
                  key: ValueKey('${threat.timestamp.millisecondsSinceEpoch}'),
                  description: threat.description,
                  type: threat.type,
                  source: threat.source,
                  timestamp: threat.timestamp,
                  index: index,
                );
              }),

            const SizedBox(height: 20),

            // Threat Map
            ThreatMapWidget(locations: mixin.mapLocations),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
