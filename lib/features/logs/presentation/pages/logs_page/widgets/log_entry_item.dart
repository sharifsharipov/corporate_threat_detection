import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:flutter/material.dart';

class LogEntryItem extends StatefulWidget {
  final DateTime timestamp;
  final LogLevel level;
  final String message;
  final String source;

  const LogEntryItem({
    super.key,
    required this.timestamp,
    required this.level,
    required this.message,
    required this.source,
  });

  @override
  State<LogEntryItem> createState() => _LogEntryItemState();
}

class _LogEntryItemState extends State<LogEntryItem> {
  bool _isExpanded = false;

  Color get _levelColor {
    switch (widget.level) {
      case LogLevel.error:
        return AppColors.c_F71E52;
      case LogLevel.warning:
        return AppColors.c_F7931E;
      case LogLevel.info:
        return AppColors.buttonColor;
      case LogLevel.debug:
        return Colors.grey.shade600;
    }
  }

  String get _levelLabel {
    switch (widget.level) {
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.warning:
        return 'WARN';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.debug:
        return 'DEBUG';
    }
  }

  IconData get _levelIcon {
    switch (widget.level) {
      case LogLevel.error:
        return Icons.error;
      case LogLevel.warning:
        return Icons.warning;
      case LogLevel.info:
        return Icons.info;
      case LogLevel.debug:
        return Icons.bug_report;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}.${timestamp.millisecond.toString().padLeft(3, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
            left: BorderSide(color: _levelColor, width: 3),
          ),
          color: _isExpanded ? _levelColor.withOpacity(0.05) : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timestamp
                Text(
                  _formatTimestamp(widget.timestamp),
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'monospace',
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 10),
                // Level Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _levelColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_levelIcon, size: 12, color: _levelColor),
                      const SizedBox(width: 4),
                      Text(
                        _levelLabel,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: _levelColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Source
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    widget.source,
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
                  ),
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            const SizedBox(height: 6),
            // Message
            Text(
              widget.message,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Colors.black87,
                height: 1.4,
              ),
              maxLines: _isExpanded ? null : 2,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
