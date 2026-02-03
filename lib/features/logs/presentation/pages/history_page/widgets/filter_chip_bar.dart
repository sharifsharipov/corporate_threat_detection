import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/widgets/history_event_item.dart';
import 'package:flutter/material.dart';

class FilterChipBar extends StatelessWidget {
  final EventSeverity? selectedSeverity;
  final Function(EventSeverity?) onSeverityChanged;
  final VoidCallback onClearFilters;

  const FilterChipBar({
    super.key,
    required this.selectedSeverity,
    required this.onSeverityChanged,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(
                    'All',
                    selectedSeverity == null,
                    () => onSeverityChanged(null),
                    AppColors.buttonColor,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Critical',
                    selectedSeverity == EventSeverity.critical,
                    () => onSeverityChanged(EventSeverity.critical),
                    const Color(0xFF8B0000),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'High',
                    selectedSeverity == EventSeverity.high,
                    () => onSeverityChanged(EventSeverity.high),
                    AppColors.c_F71E52,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Medium',
                    selectedSeverity == EventSeverity.medium,
                    () => onSeverityChanged(EventSeverity.medium),
                    AppColors.c_F7931E,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Low',
                    selectedSeverity == EventSeverity.low,
                    () => onSeverityChanged(EventSeverity.low),
                    AppColors.c_03A64B,
                  ),
                ],
              ),
            ),
          ),
          if (selectedSeverity != null) ...[
            const SizedBox(width: 8),
            IconButton(
              onPressed: onClearFilters,
              icon: const Icon(Icons.clear),
              iconSize: 20,
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.grey.shade700,
              ),
              tooltip: 'Clear filters',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected,
    VoidCallback onTap,
    Color color,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
