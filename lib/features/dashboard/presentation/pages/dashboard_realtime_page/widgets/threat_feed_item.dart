import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

enum ThreatType { malware, phishing, ddos, unauthorized, suspicious, breach }

class ThreatFeedItem extends StatefulWidget {
  final String description;
  final ThreatType type;
  final String source;
  final DateTime timestamp;
  final int index;

  const ThreatFeedItem({
    super.key,
    required this.description,
    required this.type,
    required this.source,
    required this.timestamp,
    this.index = 0,
  });

  @override
  State<ThreatFeedItem> createState() => _ThreatFeedItemState();
}

class _ThreatFeedItemState extends State<ThreatFeedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) {
        _slideController.forward();
      }
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  Color get _getThreatColor {
    switch (widget.type) {
      case ThreatType.malware:
        return AppColors.c_F71E52;
      case ThreatType.phishing:
        return AppColors.c_F7931E;
      case ThreatType.ddos:
        return const Color(0xFF8B0000);
      case ThreatType.unauthorized:
        return AppColors.c_F71E52;
      case ThreatType.suspicious:
        return AppColors.c_F7931E;
      case ThreatType.breach:
        return const Color(0xFF8B0000);
    }
  }

  IconData get _getThreatIcon {
    switch (widget.type) {
      case ThreatType.malware:
        return Icons.bug_report;
      case ThreatType.phishing:
        return Icons.phishing;
      case ThreatType.ddos:
        return Icons.cloud_off;
      case ThreatType.unauthorized:
        return Icons.lock_outline;
      case ThreatType.suspicious:
        return Icons.warning_amber_rounded;
      case ThreatType.breach:
        return Icons.security;
    }
  }

  String get _getThreatLabel {
    switch (widget.type) {
      case ThreatType.malware:
        return 'Malware';
      case ThreatType.phishing:
        return 'Phishing';
      case ThreatType.ddos:
        return 'DDoS';
      case ThreatType.unauthorized:
        return 'Unauthorized';
      case ThreatType.suspicious:
        return 'Suspicious';
      case ThreatType.breach:
        return 'Breach';
    }
  }

  String _getTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(widget.timestamp);

    if (difference.inSeconds < 10) {
      return 'Just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inHours}h ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _getThreatColor.withValues(alpha: 0.2), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _getThreatColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(_getThreatIcon, color: _getThreatColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getThreatColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getThreatLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: _getThreatColor,
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
                        _getTimeAgo(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.source,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
