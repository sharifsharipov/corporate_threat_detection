import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/attack_vector_model/attack_vector_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/monthly_trend_model/monthly_trend_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/performance_metric_model/performance_metric_model.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/response_time_model/response_time_model.dart';

abstract class AnalyticsRepository {
  Future<Either<Failure, List<PerformanceMetricModel>>> getPerformanceMetrics();
  Stream<Either<Failure, List<PerformanceMetricModel>>>
  streamPerformanceMetrics();
  Future<Either<Failure, List<MonthlyTrendModel>>> getMonthlyTrends();
  Stream<Either<Failure, List<MonthlyTrendModel>>> streamMonthlyTrends();
  Future<Either<Failure, List<AttackVectorModel>>> getAttackVectors();
  Stream<Either<Failure, List<AttackVectorModel>>> streamAttackVectors();
  Future<Either<Failure, ResponseTimeModel>> getResponseTime();
  Stream<Either<Failure, ResponseTimeModel>> streamResponseTime();
}
