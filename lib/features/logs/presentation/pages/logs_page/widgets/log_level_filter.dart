import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/widgets/log_entry_item.dart';
import 'package:flutter/material.dart';

class LogLevelFilter extends StatelessWidget {
  final LogLevel? selectedLevel;
  final Function(LogLevel?) onLevelChanged;
  final VoidCallback onClearFilters;

  const LogLevelFilter({
    super.key,
    required this.selectedLevel,
    required this.onLevelChanged,
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
                    selectedLevel == null,
                    () => onLevelChanged(null),
                    AppColors.buttonColor,
                    Icons.list,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Error',
                    selectedLevel == LogLevel.error,
                    () => onLevelChanged(LogLevel.error),
                    AppColors.c_F71E52,
                    Icons.error,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Warning',
                    selectedLevel == LogLevel.warning,
                    () => onLevelChanged(LogLevel.warning),
                    AppColors.c_F7931E,
                    Icons.warning,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Info',
                    selectedLevel == LogLevel.info,
                    () => onLevelChanged(LogLevel.info),
                    AppColors.buttonColor,
                    Icons.info,
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Debug',
                    selectedLevel == LogLevel.debug,
                    () => onLevelChanged(LogLevel.debug),
                    Colors.grey.shade600,
                    Icons.bug_report,
                  ),
                ],
              ),
            ),
          ),
          if (selectedLevel != null) ...[
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
              tooltip: 'Clear filter',
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
    IconData icon,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: isSelected ? Colors.white : color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
