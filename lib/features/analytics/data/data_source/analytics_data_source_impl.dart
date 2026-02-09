import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/analytics/data/data_source/analytics_data_source.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/attack_vector_model/attack_vector_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/monthly_trend_model/monthly_trend_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/performance_metric_model/performance_metric_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/response_time_model/response_time_model.dart';

class AnalyticsDataSourceImpl implements AnalyticsDataSource {
  final FirebaseFirestore firestore;

  AnalyticsDataSourceImpl({required this.firestore});

  @override
  Future<List<PerformanceMetricModel>> getPerformanceMetrics() async {
    final snapshot = await firestore.collection('performance_metrics').get();
    return snapshot.docs
        .map((doc) => PerformanceMetricModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Stream<List<PerformanceMetricModel>> streamPerformanceMetrics() {
    return firestore.collection('performance_metrics').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => PerformanceMetricModel.fromJson(doc.data()))
              .toList(),
        );
  }

  @override
  Future<List<MonthlyTrendModel>> getMonthlyTrends() async {
    final snapshot = await firestore.collection('monthly_trends').get();
    return snapshot.docs
        .map((doc) => MonthlyTrendModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Stream<List<MonthlyTrendModel>> streamMonthlyTrends() {
    return firestore.collection('monthly_trends').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => MonthlyTrendModel.fromJson(doc.data()))
              .toList(),
        );
  }

  @override
  Future<List<AttackVectorModel>> getAttackVectors() async {
    final snapshot = await firestore.collection('attack_vectors').get();
    return snapshot.docs
        .map((doc) => AttackVectorModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Stream<List<AttackVectorModel>> streamAttackVectors() {
    return firestore.collection('attack_vectors').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => AttackVectorModel.fromJson(doc.data()))
              .toList(),
        );
  }

  @override
  Future<ResponseTimeModel> getResponseTime() async {
    final doc = await firestore.collection('response_time').doc('current').get();
    if (!doc.exists || doc.data() == null) {
      return const ResponseTimeModel(averageMs: 0, minMs: 0, maxMs: 0);
    }
    return ResponseTimeModel.fromJson(doc.data()!);
  }

  @override
  Stream<ResponseTimeModel> streamResponseTime() {
    return firestore
        .collection('response_time')
        .doc('current')
        .snapshots()
        .map((doc) {
          final data = doc.data();
          if (!doc.exists || data == null) {
            return const ResponseTimeModel(averageMs: 0, minMs: 0, maxMs: 0);
          }
          return ResponseTimeModel.fromJson(data);
        });
  }
}
