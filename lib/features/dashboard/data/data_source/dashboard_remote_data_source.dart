import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/stat_model/stat_model.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/threat_summary_model/threat_summary_model.dart';

abstract class DashboardRemoteDataSource {
  Future<List<StatModel>> getDashboardStats();
  Future<List<AlertModel>> getRecentAlerts();
  Future<List<RealtimeMetricModel>> getRealtimeMetrics();
  Future<ThreatSummaryModel> getThreatSummary();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final FirebaseFirestore firestore;

  DashboardRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<StatModel>> getDashboardStats() async {
    final snapshot = await firestore.collection('dashboard_stats').get();
    return snapshot.docs.map((doc) => StatModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<AlertModel>> getRecentAlerts() async {
    final snapshot = await firestore
        .collection('alerts')
        .orderBy('timestamp', descending: true)
        .limit(10)
        .get();
    return snapshot.docs.map((doc) => AlertModel.fromJson(doc.data())).toList();
  }

  @override
  Future<List<RealtimeMetricModel>> getRealtimeMetrics() async {
    final snapshot = await firestore.collection('realtime_metrics').get();
    return snapshot.docs
        .map((doc) => RealtimeMetricModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<ThreatSummaryModel> getThreatSummary() async {
    final doc = await firestore
        .collection('threat_summaries')
        .doc('current_summary')
        .get();
    if (doc.exists) {
      return ThreatSummaryModel.fromJson(doc.data()!);
    } else {
      throw Exception("Threat summary not found");
    }
  }
}
