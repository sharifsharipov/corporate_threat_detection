import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/analytics/data/models/monthly_trend_model/monthly_trend_model.dart';
import 'package:corporate_threat_detection/features/analytics/domain/repository/analytics_repository.dart';

class StreamMonthlyTrendsUseCase {
  final AnalyticsRepository repository;

  StreamMonthlyTrendsUseCase({required this.repository});

  Stream<Either<Failure, List<MonthlyTrendModel>>> call() =>
      repository.streamMonthlyTrends();
}
