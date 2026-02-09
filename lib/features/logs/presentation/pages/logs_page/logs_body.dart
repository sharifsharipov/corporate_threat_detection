import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/logs_cubit.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/logs_state.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/widgets/log_entry_item.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/widgets/log_level_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogsBody extends StatelessWidget {
  const LogsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogsCubit, LogsState>(
      builder: (context, state) {
        var filteredLogs = state.logs;
        if (state.selectedLevel != null) {
          filteredLogs = filteredLogs
              .where((log) => log.level == state.selectedLevel)
              .toList();
        }
        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          filteredLogs = filteredLogs.where((log) {
            return log.message.toLowerCase().contains(query) ||
                log.source.toLowerCase().contains(query);
          }).toList();
        }

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
                            onChanged:
                                context.read<LogsCubit>().setSearchQuery,
                            decoration: InputDecoration(
                              hintText: 'Search logs...',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: state.searchQuery.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () => context
                                          .read<LogsCubit>()
                                          .setSearchQuery(''),
                                    )
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
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
                          color: state.autoScroll
                              ? AppColors.buttonColor
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: context.read<LogsCubit>().toggleAutoScroll,
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
                                    color: state.autoScroll
                                        ? Colors.white
                                        : Colors.grey.shade700,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Auto',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: state.autoScroll
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
                          onPressed: () => context
                              .read<LogsCubit>()
                              .exportLogs(filteredLogs),
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
                  selectedLevel: state.selectedLevel,
                  onLevelChanged: context.read<LogsCubit>().setLevel,
                  onClearFilters: context.read<LogsCubit>().clearFilters,
                ),
              ),

              const SizedBox(height: 8),

              // Log Count
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    if (state.selectedLevel != null ||
                        state.searchQuery.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: context.read<LogsCubit>().clearFilters,
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

              if (state.isLoading && state.logs.isEmpty)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.errorMessage != null && state.logs.isEmpty)
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => context
                                .read<LogsCubit>()
                                .startRealtimeByLevel(state.selectedLevel),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
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
      },
    );
  }
}
