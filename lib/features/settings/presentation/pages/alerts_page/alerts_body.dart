import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/alerts_mixin.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/widgets/alert_filter_tabs.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/widgets/alert_item_card.dart';
import 'package:flutter/material.dart';

class AlertsBody extends StatelessWidget {
  final AlertsMixin mixin;

  const AlertsBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c_f0f2f4,
      child: Column(
        children: [
          // Header summary
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Security Alerts',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Monitor and resolve system threats',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildSummaryBadge(
                  mixin.activeCriticalCount,
                  'Critical',
                  AppColors.c_8B0000,
                ),
                const SizedBox(width: 12),
                _buildSummaryBadge(
                  mixin.activeHighCount,
                  'High Priority',
                  AppColors.c_F71E52,
                ),
              ],
            ),
          ),

          // Filters
          AlertFilterTabs(
            selectedFilter: mixin.selectedFilter,
            onFilterChanged: mixin.handleFilterChanged,
          ),

          // Alert List
          Expanded(
            child: mixin.filteredAlerts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No alerts found',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'You\'re all caught up for this category',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: mixin.filteredAlerts.length,
                    itemBuilder: (context, index) {
                      final alert = mixin.filteredAlerts[index];
                      return AlertItemCard(
                        id: alert.id,
                        title: alert.title,
                        description: alert.description,
                        severity: alert.severity,
                        status: alert.status,
                        timestamp: alert.timestamp, // Fixed timestamp usage
                        onAcknowledge: () => mixin.acknowledgeAlert(alert.id),
                        onResolve: () => mixin.resolveAlert(alert.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryBadge(int count, String label, Color color) {
    if (count == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
