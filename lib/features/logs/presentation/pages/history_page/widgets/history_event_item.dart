import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';
import 'package:flutter/material.dart';

class HistoryEventItem extends StatefulWidget {
  final String title;
  final String description;
  final DateTime timestamp;
  final EventSeverity severity;
  final String eventType;
  final String? ipAddress;
  final String? target;
  final String actionTaken;
  final int relatedEvents;

  const HistoryEventItem({
    super.key,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.severity,
    required this.eventType,
    this.ipAddress,
    this.target,
    required this.actionTaken,
    this.relatedEvents = 0,
  });

  @override
  State<HistoryEventItem> createState() => _HistoryEventItemState();
}

class _HistoryEventItemState extends State<HistoryEventItem> {
  bool _isExpanded = false;

  Color get _severityColor {
    switch (widget.severity) {
      case EventSeverity.critical:
        return const Color(0xFF8B0000);
      case EventSeverity.high:
        return AppColors.c_F71E52;
      case EventSeverity.medium:
        return AppColors.c_F7931E;
      case EventSeverity.low:
        return AppColors.c_03A64B;
    }
  }

  String get _severityLabel {
    switch (widget.severity) {
      case EventSeverity.critical:
        return 'CRITICAL';
      case EventSeverity.high:
        return 'HIGH';
      case EventSeverity.medium:
        return 'MEDIUM';
      case EventSeverity.low:
        return 'LOW';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes}m ago';
      }
      return '${diff.inHours}h ago';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _isExpanded
              ? _severityColor.withOpacity(0.3)
              : Colors.grey.shade200,
          width: _isExpanded ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Severity Indicator
                  Container(
                    width: 4,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _severityColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: _severityColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                _severityLabel,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: _severityColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                            height: 1.3,
                          ),
                          maxLines: _isExpanded ? null : 2,
                          overflow: _isExpanded ? null : TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                widget.eventType,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.access_time,
                              size: 12,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatTimestamp(widget.timestamp),
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            if (widget.relatedEvents > 0) ...[
                              const Spacer(),
                              Icon(
                                Icons.link,
                                size: 12,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.relatedEvents} related',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),
          // Expanded Details
          if (_isExpanded) ...[
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildDetailRow('Action Taken', widget.actionTaken),
                  if (widget.ipAddress != null) ...[
                    const SizedBox(height: 8),
                    _buildDetailRow('Source IP', widget.ipAddress!),
                  ],
                  if (widget.target != null) ...[
                    const SizedBox(height: 8),
                    _buildDetailRow('Target', widget.target!),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // View full details
                          },
                          icon: const Icon(Icons.info_outline, size: 16),
                          label: const Text('Full Details'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            side: BorderSide(color: _severityColor),
                            foregroundColor: _severityColor,
                          ),
                        ),
                      ),
                      if (widget.relatedEvents > 0) ...[
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // View related events
                            },
                            icon: const Icon(Icons.link, size: 16),
                            label: Text('Related (${widget.relatedEvents})'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              side: BorderSide(color: Colors.grey.shade400),
                              foregroundColor: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
