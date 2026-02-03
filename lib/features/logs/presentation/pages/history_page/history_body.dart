import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/history_mixin.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/widgets/filter_chip_bar.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/widgets/history_event_item.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatelessWidget {
  final HistoryMixin mixin;

  const HistoryBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    final filteredEvents = mixin.filteredEvents;

    return Container(
      color: AppColors.c_f0f2f4,
      child: Column(
        children: [
          // Search Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: mixin.handleSearch,
              decoration: InputDecoration(
                hintText: 'Search events...',
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
              ),
            ),
          ),

          // Filter Chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilterChipBar(
              selectedSeverity: mixin.selectedSeverity,
              onSeverityChanged: mixin.handleSeverityFilter,
              onClearFilters: mixin.clearFilters,
            ),
          ),

          const SizedBox(height: 8),

          // Event Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                if (mixin.selectedSeverity != null ||
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
  }
}
