import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_map_location_model/threat_map_location_model.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_realtime_cubit.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/bloc/dashboard_realtime_state.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/live_metric_card.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/realtime_activity_chart.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/threat_feed_item.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/threat_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardRealtimeBody extends StatelessWidget {
  const DashboardRealtimeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardRealtimeCubit, DashboardRealtimeState>(
      builder: (context, state) {
        final metrics = state.metrics;
        final activityData = state.activityPoints;
        final feed = state.threatFeed;
        final locations = state.mapLocations;

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
                  children: _buildMetricCards(metrics),
                ),
                const SizedBox(height: 20),

                // Activity Chart
                RealtimeActivityChart(dataPoints: activityData),
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
                if (feed.isEmpty)
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
                  ...feed.asMap().entries.map((entry) {
                    final index = entry.key;
                    final threat = entry.value;
                    return ThreatFeedItem(
                      key:
                          ValueKey('${threat.timestamp.millisecondsSinceEpoch}'),
                      description: threat.description,
                      type: _mapThreatType(threat.type),
                      source: threat.source,
                      timestamp: threat.timestamp,
                      index: index,
                    );
                  }),

                const SizedBox(height: 20),

                // Threat Map
                ThreatMapWidget(
                  locations: locations.map(_mapLocation).toList(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildMetricCards(List<RealtimeMetricModel> metrics) {
    if (metrics.isEmpty) {
      return [
        LiveMetricCard(
          icon: Icons.warning_amber_rounded,
          value: 0,
          label: 'Active Threats',
          color: AppColors.c_F71E52,
        ),
        LiveMetricCard(
          icon: Icons.shield_rounded,
          value: 0,
          label: 'Blocked Today',
          color: AppColors.c_03A64B,
        ),
        LiveMetricCard(
          icon: Icons.people_alt_rounded,
          value: 0,
          label: 'Active Connections',
          color: AppColors.buttonColor,
        ),
        LiveMetricCard(
          icon: Icons.speed_rounded,
          value: 0,
          label: 'System Load %',
          color: AppColors.c_F7931E,
        ),
      ];
    }

    return metrics.map((metric) {
      return LiveMetricCard(
        icon: IconData(
          metric.iconCodePoint,
          fontFamily: 'MaterialIcons',
        ),
        value: metric.value.round(),
        label: metric.label,
        color: Color(metric.colorValue),
        isIncreasing: metric.isIncreasing,
        changeAmount: metric.changeAmount.round(),
      );
    }).toList();
  }

  ThreatType _mapThreatType(String value) {
    switch (value.toLowerCase()) {
      case 'malware':
        return ThreatType.malware;
      case 'phishing':
        return ThreatType.phishing;
      case 'ddos':
        return ThreatType.ddos;
      case 'unauthorized':
        return ThreatType.unauthorized;
      case 'breach':
        return ThreatType.breach;
      default:
        return ThreatType.suspicious;
    }
  }

  ThreatLocation _mapLocation(ThreatMapLocationModel location) {
    return ThreatLocation(
      x: location.x,
      y: location.y,
      country: location.country,
      threatCount: location.threatCount,
      color: Color(location.colorValue),
    );
  }
}
