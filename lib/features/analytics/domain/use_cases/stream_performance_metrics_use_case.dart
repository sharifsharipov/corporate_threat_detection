import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/performance_metric_model/performance_metric_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/analytics_repository.dart';

class StreamPerformanceMetricsUseCase {
  final AnalyticsRepository repository;

  StreamPerformanceMetricsUseCase({required this.repository});

  Stream<Either<Failure, List<PerformanceMetricModel>>> call() =>
      repository.streamPerformanceMetrics();
}
