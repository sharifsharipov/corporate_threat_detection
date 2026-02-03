import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/logs_mixin.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/widgets/log_entry_item.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/widgets/log_level_filter.dart';
import 'package:flutter/material.dart';

class LogsBody extends StatelessWidget {
  final LogsMixin mixin;

  const LogsBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    final filteredLogs = mixin.filteredLogs;

    return Container(
      color: AppColors.c_f0f2f4,
      child: Column(
        children: [
          // Search and Controls Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: mixin.handleSearch,
                        decoration: InputDecoration(
                          hintText: 'Search logs...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: mixin.searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () => mixin.handleSearch(''),
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.buttonColor,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Auto-scroll toggle
                    Material(
                      color: mixin.autoScroll
                          ? AppColors.buttonColor
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: mixin.toggleAutoScroll,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                size: 16,
                                color: mixin.autoScroll
                                    ? Colors.white
                                    : Colors.grey.shade700,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Auto',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: mixin.autoScroll
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Export button
                    ElevatedButton.icon(
                      onPressed: mixin.handleExportLogs,
                      icon: const Icon(Icons.download, size: 16),
                      label: const Text('Export'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Filter Chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LogLevelFilter(
              selectedLevel: mixin.selectedLevel,
              onLevelChanged: mixin.handleLevelFilter,
              onClearFilters: mixin.clearFilters,
            ),
          ),

          const SizedBox(height: 8),

          // Log Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  '${filteredLogs.length} log entries',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                if (mixin.selectedLevel != null ||
                    mixin.searchQuery.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: mixin.clearFilters,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Clear all'),
                  ),
                ],
              ],
            ),
          ),

          // Logs List
          Expanded(
            child: filteredLogs.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No logs found',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: filteredLogs.length,
                      itemBuilder: (context, index) {
                        final log = filteredLogs[index];
                        return LogEntryItem(
                          timestamp: log.timestamp,
                          level: log.level,
                          message: log.message,
                          source: log.source,
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
