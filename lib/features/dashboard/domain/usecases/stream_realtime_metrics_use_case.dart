import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/realtime_metric_model/realtime_metric_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamRealtimeMetricsUseCase {
  final DashboardRepository repository;

  StreamRealtimeMetricsUseCase({required this.repository});

  Stream<Either<Failure, List<RealtimeMetricModel>>> call() {
    return repository.streamRealtimeMetrics();
  }
}
