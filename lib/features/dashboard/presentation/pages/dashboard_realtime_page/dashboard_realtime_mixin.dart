import 'dart:async';
import 'dart:math' as math;
import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/dashboard_realtime_page.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/threat_feed_item.dart';
import 'package:corporate_threat_detection/features/dashboard/presentation/pages/dashboard_realtime_page/widgets/threat_map_widget.dart';
import 'package:flutter/material.dart';

mixin DashboardRealtimeMixin on State<DashboardRealtimePage> {
  Timer? _updateTimer;
  final math.Random _random = math.Random();

  // Metrics
  int _activeThreats = 23;
  int _blockedAttacks = 156;
  int _activeConnections = 1847;
  int _systemLoad = 67;

  // Change tracking
  int _activeThreatsChange = 0;
  int _blockedAttacksChange = 0;
  int _activeConnectionsChange = 0;
  int _systemLoadChange = 0;

  // Activity chart data (last 20 data points)
  List<int> _activityData = List.generate(20, (index) => 5 + index % 8);

  // Threat feed
  List<ThreatFeedData> _threatFeed = [];

  // Threat map locations
  List<ThreatLocation> _mapLocations = [];

  int get activeThreats => _activeThreats;
  int get blockedAttacks => _blockedAttacks;
  int get activeConnections => _activeConnections;
  int get systemLoad => _systemLoad;

  int get activeThreatsChange => _activeThreatsChange;
  int get blockedAttacksChange => _blockedAttacksChange;
  int get activeConnectionsChange => _activeConnectionsChange;
  int get systemLoadChange => _systemLoadChange;

  List<int> get activityData => _activityData;
  List<ThreatFeedData> get threatFeed => _threatFeed;
  List<ThreatLocation> get mapLocations => _mapLocations;

  @override
  void initState() {
    super.initState();
    _initializeThreatFeed();
    _initializeMapLocations();
    _startRealtimeUpdates();
  }

  void _initializeThreatFeed() {
    _threatFeed = [
      ThreatFeedData(
        description: 'Multiple failed login attempts detected',
        type: ThreatType.unauthorized,
        source: '192.168.1.45',
        timestamp: DateTime.now().subtract(const Duration(seconds: 15)),
      ),
      ThreatFeedData(
        description: 'Suspicious email attachment intercepted',
        type: ThreatType.phishing,
        source: 'mail.server.com',
        timestamp: DateTime.now().subtract(const Duration(seconds: 45)),
      ),
      ThreatFeedData(
        description: 'Malware signature detected in download',
        type: ThreatType.malware,
        source: '10.0.0.123',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
    ];
  }

  void _initializeMapLocations() {
    _mapLocations = [
      ThreatLocation(
        x: 80,
        y: 60,
        country: 'USA',
        threatCount: 12,
        color: AppColors.c_F71E52,
      ),
      ThreatLocation(
        x: 200,
        y: 50,
        country: 'UK',
        threatCount: 8,
        color: AppColors.c_F7931E,
      ),
      ThreatLocation(
        x: 280,
        y: 70,
        country: 'China',
        threatCount: 15,
        color: const Color(0xFF8B0000),
      ),
      ThreatLocation(
        x: 150,
        y: 90,
        country: 'Nigeria',
        threatCount: 5,
        color: AppColors.c_03A64B,
      ),
    ];
  }

  void _startRealtimeUpdates() {
    _updateTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        _updateMetrics();
        _updateActivityChart();
        if (_random.nextInt(100) < 40) {
          // 40% chance to add new threat
          _addNewThreat();
        }
        setState(() {});
      }
    });
  }

  void _updateMetrics() {
    // Update active threats (can go up or down)
    final activeChange = _random.nextInt(5) - 2;
    _activeThreatsChange = activeChange.abs();
    _activeThreats = (_activeThreats + activeChange).clamp(10, 100);

    // Update blocked attacks (usually goes up)
    final blockedChange = _random.nextInt(4) + 1;
    _blockedAttacksChange = blockedChange;
    _blockedAttacks += blockedChange;

    // Update active connections (fluctuates)
    final connectionsChange = _random.nextInt(20) - 10;
    _activeConnectionsChange = connectionsChange.abs();
    _activeConnections = (_activeConnections + connectionsChange).clamp(
      1000,
      3000,
    );

    // Update system load (fluctuates)
    final loadChange = _random.nextInt(10) - 5;
    _systemLoadChange = loadChange.abs();
    _systemLoad = (_systemLoad + loadChange).clamp(50, 95);
  }

  void _updateActivityChart() {
    // Remove first element and add new one at the end
    _activityData.removeAt(0);
    final newValue = 3 + _random.nextInt(12);
    _activityData.add(newValue);
  }

  void _addNewThreat() {
    final threats = [
      'DDoS attack detected from multiple sources',
      'Ransomware activity blocked',
      'SQL injection attempt prevented',
      'Brute force attack on SSH detected',
      'Suspicious outbound traffic identified',
      'Zero-day exploit attempt blocked',
      'Port scanning activity detected',
      'Unauthorized access attempt',
      'Credential stuffing attack detected',
      'XSS vulnerability exploit attempt',
    ];

    final sources = [
      '192.168.1.${_random.nextInt(255)}',
      '10.0.0.${_random.nextInt(255)}',
      '172.16.0.${_random.nextInt(255)}',
      'external.server.net',
      'unknown.host.com',
    ];

    final types = ThreatType.values;

    _threatFeed.insert(
      0,
      ThreatFeedData(
        description: threats[_random.nextInt(threats.length)],
        type: types[_random.nextInt(types.length)],
        source: sources[_random.nextInt(sources.length)],
        timestamp: DateTime.now(),
      ),
    );

    // Keep only last 10 threats
    if (_threatFeed.length > 10) {
      _threatFeed = _threatFeed.sublist(0, 10);
    }
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    super.dispose();
  }
}

class ThreatFeedData {
  final String description;
  final ThreatType type;
  final String source;
  final DateTime timestamp;

  ThreatFeedData({
    required this.description,
    required this.type,
    required this.source,
    required this.timestamp,
  });
}
