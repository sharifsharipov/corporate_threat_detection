import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
              color: AppColors.buttonColor.withOpacity(0.05),
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    size: 32,
                    color: AppColors.buttonColor,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'SecureGuard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Corporate Security',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: [
                _buildNavItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  label: 'Overview',
                  route: Routes.dashboardOverview,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.warning_amber_rounded,
                  label: 'Active Threats',
                  route: Routes.threatsActive,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.analytics_outlined,
                  label: 'Analytics',
                  route: Routes.analytics,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.description_outlined,
                  label: 'Reports',
                  route: Routes.reports,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.history_rounded,
                  label: 'System Logs',
                  route: Routes.logs,
                ),
                const Divider(height: 32),
                _buildNavItem(
                  context,
                  icon: Icons.notifications_none_rounded,
                  label: 'Alerts',
                  route: Routes.alerts,
                ),
                _buildNavItem(
                  context,
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  route:
                      Routes.settingsRules, // Changed to a valid settings route
                ),
              ],
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: InkWell(
              onTap: () {
                // Handle logout
                context.go(Routes.login);
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20, color: AppColors.c_F71E52),
                    const SizedBox(width: 12),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.c_F71E52,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    final isSelected = GoRouterState.of(context).uri.toString() == route;

    return ListTile(
      leading: Icon(
        icon,
        size: 22,
        color: isSelected ? AppColors.buttonColor : Colors.grey.shade600,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected ? AppColors.buttonColor : Colors.black87,
        ),
      ),
      dense: true,
      minLeadingWidth: 20,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      selected: isSelected,
      selectedTileColor: AppColors.buttonColor.withOpacity(0.05),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(32)),
      ),
      onTap: () {
        context.pop(); // Close drawer
        context.go(route);
      },
    );
  }
}
