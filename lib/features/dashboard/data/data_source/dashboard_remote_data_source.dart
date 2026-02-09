import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_feed_model/threat_feed_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_map_location_model/threat_map_location_model.dart';
import 'package:flutter/material.dart';

abstract class DashboardRemoteDataSource {
  Future<List<StatModel>> getDashboardStats();
  Future<List<AlertModel>> getRecentAlerts();
  Future<List<RealtimeMetricModel>> getRealtimeMetrics();
  Future<ThreatSummaryModel> getThreatSummary();
  Stream<List<StatModel>> streamDashboardStats();
  Stream<List<AlertModel>> streamRecentAlerts({int limit = 10});
  Stream<List<RealtimeMetricModel>> streamRealtimeMetrics();
  Stream<ThreatSummaryModel> streamThreatSummary();
  Stream<List<int>> streamRealtimeActivity();
  Stream<List<ThreatFeedModel>> streamThreatFeed({int limit = 20});
  Stream<List<ThreatMapLocationModel>> streamThreatMapLocations({
    int limit = 20,
  });
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final FirebaseFirestore firestore;

  DashboardRemoteDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeAlertData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('title', () => '');
    data.putIfAbsent('severity', () => AlertSeverity.low.name);
    data.putIfAbsent('isRead', () => false);
    data.putIfAbsent('timestamp', () => DateTime.now().toIso8601String());
    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    }
    final severity = data['severity'];
    if (severity is AlertSeverity) {
      data['severity'] = severity.name;
    } else if (severity is String) {
      data['severity'] = severity.toLowerCase();
    }
    return data;
  }

  Map<String, dynamic> _normalizeStatData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('label', () => doc.id);
    data.putIfAbsent('value', () => '');
    data.putIfAbsent('iconCodePoint', () => Icons.shield_rounded.codePoint);
    data.putIfAbsent('colorValue', () => 0xFF03A64B);
    data.putIfAbsent('backgroundColorValue', () => 0xFFFFFFFF);
    return data;
  }

  Map<String, dynamic> _normalizeMetricData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('label', () => doc.id);
    data.putIfAbsent('value', () => 0);
    data.putIfAbsent('iconCodePoint', () => Icons.shield_rounded.codePoint);
    data.putIfAbsent('colorValue', () => 0xFF03A64B);
    data.putIfAbsent('isIncreasing', () => true);
    data.putIfAbsent('changeAmount', () => 0);
    data.putIfAbsent('backgroundColorValue', () => 0xFFFFFFFF);
    return data;
  }

  Map<String, dynamic> _normalizeThreatFeedData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('description', () => '');
    data.putIfAbsent('type', () => 'suspicious');
    data.putIfAbsent('source', () => '');
    data.putIfAbsent('timestamp', () => DateTime.now().toIso8601String());
    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    }
    return data;
  }

  Map<String, dynamic> _normalizeSummaryData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('totalThreats', () => 0);
    data.putIfAbsent('criticalCount', () => 0);
    data.putIfAbsent('highCount', () => 0);
    data.putIfAbsent('mediumCount', () => 0);
    data.putIfAbsent('lowCount', () => 0);

    final categories = (data['categories'] as List?) ?? const [];
    data['categories'] = categories.map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      map.putIfAbsent('name', () => '');
      map.putIfAbsent('count', () => 0);
      map.putIfAbsent('colorValue', () => 0xFF03A64B);
      map.putIfAbsent('iconCodePoint', () => Icons.shield_rounded.codePoint);
      return map;
    }).toList();

    final timelineData = (data['timelineData'] as List?) ?? const [];
    data['timelineData'] = timelineData.map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      final date = map['date'];
      if (date is Timestamp) {
        map['date'] = date.toDate().toIso8601String();
      } else if (date is DateTime) {
        map['date'] = date.toIso8601String();
      }
      map.putIfAbsent('count', () => 0);
      return map;
    }).toList();

    final topThreats = (data['topThreats'] as List?) ?? const [];
    data['topThreats'] = topThreats.map((item) {
      final map = Map<String, dynamic>.from(item as Map);
      map.putIfAbsent('name', () => '');
      map.putIfAbsent('description', () => '');
      map.putIfAbsent('count', () => 0);
      map.putIfAbsent('severity', () => 'medium');
      map.putIfAbsent('isIncreasing', () => true);
      return map;
    }).toList();

    return data;
  }

  ThreatSummaryModel _emptySummary() {
    return const ThreatSummaryModel(
      totalThreats: 0,
      criticalCount: 0,
      highCount: 0,
      mediumCount: 0,
      lowCount: 0,
      categories: [],
      timelineData: [],
      topThreats: [],
    );
  }

  @override
  Future<List<StatModel>> getDashboardStats() async {
    final snapshot = await firestore.collection('dashboard_stats').get();
    return snapshot.docs
        .map((doc) => StatModel.fromJson(_normalizeStatData(doc)))
        .toList();
  }

  @override
  Future<List<AlertModel>> getRecentAlerts() async {
    final snapshot = await firestore
        .collection('alerts')
        .orderBy('timestamp', descending: true)
        .limit(10)
        .get();
    return snapshot.docs
        .map((doc) => AlertModel.fromJson(_normalizeAlertData(doc)))
        .toList();
  }

  @override
  Future<List<RealtimeMetricModel>> getRealtimeMetrics() async {
    final snapshot = await firestore.collection('realtime_metrics').get();
    return snapshot.docs
        .map((doc) => RealtimeMetricModel.fromJson(_normalizeMetricData(doc)))
        .toList();
  }

  @override
  Future<ThreatSummaryModel> getThreatSummary() async {
    final doc = await firestore
        .collection('threat_summaries')
        .doc('current_summary')
        .get();
    if (doc.exists) {
      return ThreatSummaryModel.fromJson(_normalizeSummaryData(doc));
    } else {
      throw Exception("Threat summary not found");
    }
  }

  @override
  Stream<List<StatModel>> streamDashboardStats() {
    return firestore.collection('dashboard_stats').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => StatModel.fromJson(_normalizeStatData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<AlertModel>> streamRecentAlerts({int limit = 10}) {
    return firestore
        .collection('alerts')
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => AlertModel.fromJson(_normalizeAlertData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<RealtimeMetricModel>> streamRealtimeMetrics() {
    return firestore.collection('realtime_metrics').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => RealtimeMetricModel.fromJson(_normalizeMetricData(doc)))
              .toList(),
        );
  }

  @override
  Stream<ThreatSummaryModel> streamThreatSummary() {
    return firestore
        .collection('threat_summaries')
        .doc('current_summary')
        .snapshots()
        .map((doc) {
          if (!doc.exists || doc.data() == null) {
            return _emptySummary();
          }
          return ThreatSummaryModel.fromJson(_normalizeSummaryData(doc));
        });
  }

  @override
  Stream<List<int>> streamRealtimeActivity() {
    return firestore
        .collection('realtime_activity')
        .doc('current')
        .snapshots()
        .map((doc) {
          final data = doc.data() ?? <String, dynamic>{};
          final points = (data['dataPoints'] as List?) ?? const [];
          return points
              .map((value) => (value as num?)?.toInt() ?? 0)
              .toList();
        });
  }

  @override
  Stream<List<ThreatFeedModel>> streamThreatFeed({int limit = 20}) {
    return firestore
        .collection('threat_feed')
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ThreatFeedModel.fromJson(
                  _normalizeThreatFeedData(doc),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }

  @override
  Stream<List<ThreatMapLocationModel>> streamThreatMapLocations({
    int limit = 20,
  }) {
    return firestore
        .collection('threat_map')
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ThreatMapLocationModel.fromJson(
                  doc.data(),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }
}
