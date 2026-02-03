import 'dart:developer';

import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/logs_page.dart';
import 'package:corporate_threat_detection/features/logs/presentation/pages/logs_page/widgets/log_entry_item.dart';
import 'package:flutter/material.dart';

mixin LogsMixin on State<LogsPage> {
  LogLevel? selectedLevel;
  String searchQuery = '';
  bool autoScroll = false;

  // Log entries
  final List<LogEntryData> _logEntries = [
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 5)),
      level: LogLevel.error,
      message: 'Failed to connect to database: Connection refused at port 5432',
      source: 'DatabaseService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 12)),
      level: LogLevel.warning,
      message: 'High memory usage detected: 85% of available memory in use',
      source: 'SystemMonitor',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 18)),
      level: LogLevel.info,
      message: 'User authentication successful for user: admin@example.com',
      source: 'AuthService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 25)),
      level: LogLevel.debug,
      message: 'Processing request: GET /api/v1/threats?limit=50&offset=0',
      source: 'APIGateway',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 30)),
      level: LogLevel.error,
      message:
          'Malware scan failed: Unable to access file at /var/logs/suspicious.exe',
      source: 'MalwareScanner',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 42)),
      level: LogLevel.info,
      message: 'Firewall rule updated: Blocked IP range 192.168.100.0/24',
      source: 'FirewallManager',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(seconds: 55)),
      level: LogLevel.warning,
      message: 'SSL certificate expires in 7 days for domain: api.example.com',
      source: 'CertificateMonitor',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 1, seconds: 10),
      ),
      level: LogLevel.debug,
      message: 'Cache cleared for user session: session_id_12345',
      source: 'CacheManager',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 1, seconds: 25),
      ),
      level: LogLevel.info,
      message:
          'Scheduled backup completed successfully: 2.3GB backed up to cloud storage',
      source: 'BackupService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 1, seconds: 40),
      ),
      level: LogLevel.error,
      message:
          'Network timeout: Failed to reach external API endpoint after 30 seconds',
      source: 'NetworkService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      level: LogLevel.warning,
      message: 'Unusual login pattern detected from IP: 203.45.67.89',
      source: 'SecurityMonitor',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 2, seconds: 15),
      ),
      level: LogLevel.debug,
      message:
          'Query executed in 125ms: SELECT * FROM threats WHERE severity = \'HIGH\'',
      source: 'DatabaseService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 2, seconds: 30),
      ),
      level: LogLevel.info,
      message:
          'Email notification sent to 15 administrators regarding security alert',
      source: 'NotificationService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      level: LogLevel.error,
      message:
          'Permission denied: User does not have required role to access /admin/settings',
      source: 'AuthorizationService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 3, seconds: 20),
      ),
      level: LogLevel.warning,
      message: 'Disk space running low on /var partition: Only 2.1GB remaining',
      source: 'SystemMonitor',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 3, seconds: 45),
      ),
      level: LogLevel.info,
      message: 'System health check passed: All services running normally',
      source: 'HealthCheckService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      level: LogLevel.debug,
      message:
          'WebSocket connection established with client: ws://client-12345',
      source: 'WebSocketServer',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 4, seconds: 30),
      ),
      level: LogLevel.info,
      message: 'Threat detection model updated to version 2.5.3',
      source: 'ModelService',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      level: LogLevel.error,
      message:
          'Rate limit exceeded: Client made 150 requests in 60 seconds from IP: 45.123.67.89',
      source: 'RateLimiter',
    ),
    LogEntryData(
      timestamp: DateTime.now().subtract(
        const Duration(minutes: 5, seconds: 30),
      ),
      level: LogLevel.info,
      message: 'Application started successfully on port 8080',
      source: 'Application',
    ),
  ];

  List<LogEntryData> get logEntries => _logEntries;

  List<LogEntryData> get filteredLogs {
    var filtered = _logEntries;

    // Filter by level
    if (selectedLevel != null) {
      filtered = filtered.where((log) => log.level == selectedLevel).toList();
    }

    // Filter by search query
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((log) {
        return log.message.toLowerCase().contains(searchQuery.toLowerCase()) ||
            log.source.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void handleLevelFilter(LogLevel? level) {
    setState(() {
      selectedLevel = level;
    });
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void toggleAutoScroll() {
    setState(() {
      autoScroll = !autoScroll;
    });
  }

  void clearFilters() {
    setState(() {
      selectedLevel = null;
      searchQuery = '';
    });
  }

  void handleExportLogs() {
    // Handle log export
  log('Exporting ${filteredLogs.length} logs...');
  }
}

class LogEntryData {
  final DateTime timestamp;
  final LogLevel level;
  final String message;
  final String source;

  LogEntryData({
    required this.timestamp,
    required this.level,
    required this.message,
    required this.source,
  });
}
