import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum AlertFilter { all, critical, high, medium, low }

class AlertFilterTabs extends StatelessWidget {
  final AlertFilter selectedFilter;
  final Function(AlertFilter) onFilterChanged;

  const AlertFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildTab('All Alerts', AlertFilter.all),
          const SizedBox(width: 8),
          _buildTab('Critical', AlertFilter.critical),
          const SizedBox(width: 8),
          _buildTab('High', AlertFilter.high),
          const SizedBox(width: 8),
          _buildTab('Medium', AlertFilter.medium),
          const SizedBox(width: 8),
          _buildTab('Low', AlertFilter.low),
        ],
      ),
    );
  }

  Widget _buildTab(String label, AlertFilter filter) {
    final isSelected = selectedFilter == filter;

    Color getColor() {
      switch (filter) {
        case AlertFilter.critical:
          return AppColors.c_8B0000;
        case AlertFilter.high:
          return AppColors.c_F71E52;
        case AlertFilter.medium:
          return AppColors.c_F7931E;
        case AlertFilter.low:
          return AppColors.c_03A64B;
        default:
          return AppColors.buttonColor;
      }
    }

    final color = getColor();

    return GestureDetector(
      onTap: () => onFilterChanged(filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isSelected ? color : Colors.grey.shade300),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
