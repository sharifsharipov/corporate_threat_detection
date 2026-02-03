import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/history_page.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/history_page/widgets/history_event_item.dart';
import 'package:flutter/material.dart';

mixin HistoryMixin on State<HistoryPage> {
  EventSeverity? selectedSeverity;
  String searchQuery = '';

  // Historical events
  final List<HistoryEventData> _historyEvents = [
    HistoryEventData(
      title: 'Trojan Malware Detected and Blocked',
      description:
          'Trojan.GenericKD detected in incoming email attachment. File quarantined and sender blocked.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      severity: EventSeverity.critical,
      eventType: 'Malware Detection',
      ipAddress: '192.168.1.45',
      target: 'Email Server',
      actionTaken: 'File quarantined, IP blocked',
      relatedEvents: 3,
    ),
    HistoryEventData(
      title: 'Suspicious Login Attempt Blocked',
      description:
          'Multiple failed login attempts from unknown location. Account temporarily locked for security.',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      severity: EventSeverity.high,
      eventType: 'Authentication',
      ipAddress: '203.45.12.89',
      target: 'Admin Portal',
      actionTaken: 'Account locked, admin notified',
      relatedEvents: 2,
    ),
    HistoryEventData(
      title: 'Port Scan Detected',
      description:
          'Automated port scanning activity detected from external source.',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      severity: EventSeverity.medium,
      eventType: 'Network Scan',
      ipAddress: '45.123.67.234',
      target: 'Network Gateway',
      actionTaken: 'IP blocked at firewall',
      relatedEvents: 0,
    ),
    HistoryEventData(
      title: 'SSL Certificate Expiring Soon',
      description: 'SSL certificate for api.domain.com will expire in 7 days.',
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      severity: EventSeverity.medium,
      eventType: 'Certificate',
      target: 'api.domain.com',
      actionTaken: 'Alert sent to administrator',
      relatedEvents: 0,
    ),
    HistoryEventData(
      title: 'Phishing Email Detected',
      description:
          'Email claiming to be from IT department requesting password reset. Identified as phishing attempt.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      severity: EventSeverity.high,
      eventType: 'Phishing',
      ipAddress: '156.78.90.123',
      target: 'Multiple Users',
      actionTaken: 'Email blocked, users notified',
      relatedEvents: 5,
    ),
    HistoryEventData(
      title: 'Unusual Outbound Traffic',
      description:
          'Detected unusual volume of outbound traffic to unknown destination.',
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      severity: EventSeverity.high,
      eventType: 'Network Activity',
      ipAddress: '192.168.1.88',
      target: '78.34.12.56:8080',
      actionTaken: 'Traffic blocked, device isolated',
      relatedEvents: 1,
    ),
    HistoryEventData(
      title: 'SQL Injection Attempt',
      description:
          'SQL injection attempt detected in web application form submission.',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      severity: EventSeverity.critical,
      eventType: 'Web Attack',
      ipAddress: '67.89.123.45',
      target: 'Web Application',
      actionTaken: 'Request blocked, IP banned',
      relatedEvents: 4,
    ),
    HistoryEventData(
      title: 'Password Policy Violation',
      description:
          'User attempted to set weak password that does not meet security requirements.',
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 8)),
      severity: EventSeverity.low,
      eventType: 'Policy Violation',
      target: 'User Account',
      actionTaken: 'Password reset required',
      relatedEvents: 0,
    ),
    HistoryEventData(
      title: 'Firewall Rule Update',
      description:
          'New firewall rules applied to block traffic from suspicious regions.',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      severity: EventSeverity.low,
      eventType: 'Configuration',
      actionTaken: 'Rules applied successfully',
      relatedEvents: 0,
    ),
    HistoryEventData(
      title: 'DDoS Attack Mitigated',
      description:
          'Large-scale DDoS attack detected and successfully mitigated by cloud protection.',
      timestamp: DateTime.now().subtract(const Duration(days: 5)),
      severity: EventSeverity.critical,
      eventType: 'DDoS',
      ipAddress: 'Multiple Sources',
      target: 'Main Website',
      actionTaken: 'Cloud DDoS protection activated',
      relatedEvents: 12,
    ),
  ];

  List<HistoryEventData> get historyEvents => _historyEvents;

  List<HistoryEventData> get filteredEvents {
    var filtered = _historyEvents;

    // Filter by severity
    if (selectedSeverity != null) {
      filtered = filtered
          .where((event) => event.severity == selectedSeverity)
          .toList();
    }

    // Filter by search query
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((event) {
        return event.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            event.description.toLowerCase().contains(
              searchQuery.toLowerCase(),
            ) ||
            event.eventType.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void handleSeverityFilter(EventSeverity? severity) {
    setState(() {
      selectedSeverity = severity;
    });
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void clearFilters() {
    setState(() {
      selectedSeverity = null;
      searchQuery = '';
    });
  }
}

class HistoryEventData {
  final String title;
  final String description;
  final DateTime timestamp;
  final EventSeverity severity;
  final String eventType;
  final String? ipAddress;
  final String? target;
  final String actionTaken;
  final int relatedEvents;

  HistoryEventData({
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
}
