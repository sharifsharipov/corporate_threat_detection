import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/history_cubit.dart';
import 'package:corporate_threat_detection/features/logs/presentation/bloc/history_state.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/widgets/filter_chip_bar.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/widgets/history_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        var filteredEvents = state.events;
        if (state.selectedSeverity != null) {
          filteredEvents = filteredEvents
              .where((event) => event.severity == state.selectedSeverity)
              .toList();
        }
        if (state.searchQuery.isNotEmpty) {
          final query = state.searchQuery.toLowerCase();
          filteredEvents = filteredEvents.where((event) {
            return event.title.toLowerCase().contains(query) ||
                event.description.toLowerCase().contains(query) ||
                event.eventType.toLowerCase().contains(query);
          }).toList();
        }

        return Container(
          color: AppColors.c_f0f2f4,
          child: Column(
            children: [
              // Search Bar
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: context.read<HistoryCubit>().setSearchQuery,
                  decoration: InputDecoration(
                    hintText: 'Search events...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: state.searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => context
                                .read<HistoryCubit>()
                                .setSearchQuery(''),
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
                  ),
                ),
              ),

              // Filter Chips
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FilterChipBar(
                  selectedSeverity: state.selectedSeverity,
                  onSeverityChanged: context.read<HistoryCubit>().setSeverity,
                  onClearFilters: context.read<HistoryCubit>().clearFilters,
                ),
              ),

              const SizedBox(height: 8),

              // Event Count
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      '${filteredEvents.length} events',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    if (state.selectedSeverity != null ||
                        state.searchQuery.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: context.read<HistoryCubit>().clearFilters,
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

              if (state.isLoading && state.events.isEmpty)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.errorMessage != null && state.events.isEmpty)
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
                                .read<HistoryCubit>()
                                .startRealtimeBySeverity(
                                  state.selectedSeverity,
                                ),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                // Events List
                Expanded(
                  child: filteredEvents.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.history,
                                size: 64,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No events found',
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
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: filteredEvents.length,
                          itemBuilder: (context, index) {
                            final event = filteredEvents[index];
                            return HistoryEventItem(
                              title: event.title,
                              description: event.description,
                              timestamp: event.timestamp,
                              severity: event.severity,
                              eventType: event.eventType,
                              ipAddress: event.ipAddress,
                              target: event.target,
                              actionTaken: event.actionTaken,
                              relatedEvents: event.relatedEvents,
                            );
                          },
                        ),
                ),
            ],
          ),
        );
      },
    );
  }
}
