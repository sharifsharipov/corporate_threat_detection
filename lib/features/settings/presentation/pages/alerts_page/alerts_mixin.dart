import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart' hide AlertSeverity;
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/alerts_page.dart';
import 'package:corporate_threat_detection/features/settings/presentation/pages/alerts_page/widgets/alert_filter_tabs.dart';
import 'package:flutter/material.dart';

mixin AlertsMixin on State<AlertsPage> {
  AlertFilter selectedFilter = AlertFilter.all;

  // Sample data
  final List<AlertData> _allAlerts = [
    AlertData(
      id: '1',
      title: 'Suspicious Administrative Access',
      description:
          'Multiple failed login attempts detected on root account from IP 192.168.1.105',
      severity: AlertSeverity.critical,
      status: AlertStatus.active,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    AlertData(
      id: '2',
      title: 'Malware Detected',
      description:
          'Trojan.Win32.Generic signature found in file "update_patch_v2.exe"',
      severity: AlertSeverity.high,
      status: AlertStatus.active,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    AlertData(
      id: '3',
      title: 'Unusual Outbound Traffic',
      description:
          'Large data transfer (2.5GB) to unknown external IP detected',
      severity: AlertSeverity.high,
      status: AlertStatus.acknowledged,
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    AlertData(
      id: '4',
      title: 'New Device Connected',
      description:
          'Unauthorized device "Unknown-MacBook" connected to secure VLAN',
      severity: AlertSeverity.medium,
      status: AlertStatus.active,
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    AlertData(
      id: '5',
      title: 'Software Update Available',
      description: 'Critical security patch available for Firewall Gateway',
      severity: AlertSeverity.medium,
      status: AlertStatus.resolved,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    AlertData(
      id: '6',
      title: 'Policy Violation',
      description: 'User accessed blocked social media site during work hours',
      severity: AlertSeverity.low,
      status: AlertStatus.active,
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    ),
    AlertData(
      id: '7',
      title: 'Weak Password Detected',
      description: 'User "jdoe" created an account with a weak password',
      severity: AlertSeverity.low,
      status: AlertStatus.resolved,
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
    ),
    AlertData(
      id: '8',
      title: 'Port Scan Detected',
      description: 'Horizontal port scan detected from internal IP 10.0.0.45',
      severity: AlertSeverity.medium,
      status: AlertStatus.acknowledged,
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 5)),
    ),
    AlertData(
      id: '9',
      title: 'DDoS Attack Mitigated',
      description: 'Volumetric attack detected and blocked by edge firewall',
      severity: AlertSeverity.critical,
      status: AlertStatus.resolved,
      timestamp: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  List<AlertData> get filteredAlerts {
    if (selectedFilter == AlertFilter.all) return _allAlerts;

    return _allAlerts.where((alert) {
      switch (selectedFilter) {
        case AlertFilter.critical:
          return alert.severity == AlertSeverity.critical;
        case AlertFilter.high:
          return alert.severity == AlertSeverity.high;
        case AlertFilter.medium:
          return alert.severity == AlertSeverity.medium;
        case AlertFilter.low:
          return alert.severity == AlertSeverity.low;
        case AlertFilter.all:
          return true;
      }
    }).toList();
  }

  int get currentAlertCount => filteredAlerts.length;

  // Metrics
  int get activeCriticalCount => _allAlerts
      .where(
        (a) =>
            a.severity == AlertSeverity.critical &&
            a.status != AlertStatus.resolved,
      )
      .length;
  int get activeHighCount => _allAlerts
      .where(
        (a) =>
            a.severity == AlertSeverity.high &&
            a.status != AlertStatus.resolved,
      )
      .length;

  void handleFilterChanged(AlertFilter filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  void acknowledgeAlert(String id) {
    setState(() {
      final index = _allAlerts.indexWhere((element) => element.id == id);
      if (index != -1) {
        _allAlerts[index] = _allAlerts[index].copyWith(
          status: AlertStatus.acknowledged,
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Alert acknowledged'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void resolveAlert(String id) {
    setState(() {
      final index = _allAlerts.indexWhere((element) => element.id == id);
      if (index != -1) {
        _allAlerts[index] = _allAlerts[index].copyWith(
          status: AlertStatus.resolved,
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Alert resolved'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void resolveAllVisible() {
    // Implementation for bulk resolve
  }
}

class AlertData {
  final String id;
  final String title;
  final String description;
  final AlertSeverity severity;
  final AlertStatus status;
  final DateTime timestamp;

  AlertData({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.status,
    required this.timestamp,
  });

  AlertData copyWith({
    String? id,
    String? title,
    String? description,
    AlertSeverity? severity,
    AlertStatus? status,
    DateTime? timestamp,
  }) {
    return AlertData(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
