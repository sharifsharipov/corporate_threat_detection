import 'package:corporate_threat_detection/features/analytics/data/models/attack_vector_model/attack_vector_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/monthly_trend_model/monthly_trend_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/performance_metric_model/performance_metric_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/response_time_model/response_time_model.dart';

abstract class AnalyticsDataSource {
  Future<List<PerformanceMetricModel>> getPerformanceMetrics();
  Stream<List<PerformanceMetricModel>> streamPerformanceMetrics();
  Future<List<MonthlyTrendModel>> getMonthlyTrends();
  Stream<List<MonthlyTrendModel>> streamMonthlyTrends();
  Future<List<AttackVectorModel>> getAttackVectors();
  Stream<List<AttackVectorModel>> streamAttackVectors();
  Future<ResponseTimeModel> getResponseTime();
  Stream<ResponseTimeModel> streamResponseTime();
}
