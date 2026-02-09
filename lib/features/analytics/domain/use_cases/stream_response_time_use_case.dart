import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/response_time_model/response_time_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/analytics_repository.dart';

class StreamResponseTimeUseCase {
  final AnalyticsRepository repository;

  StreamResponseTimeUseCase({required this.repository});

  Stream<Either<Failure, ResponseTimeModel>> call() =>
      repository.streamResponseTime();
}
