import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/dashboard/data/models/alert_model/alert_model.dart';
import 'package:corporate_threat_detection/features/dashboard/domain/repository/dashboard_repository.dart';

class StreamRecentAlertsUseCase {
  final DashboardRepository repository;

  StreamRecentAlertsUseCase({required this.repository});

  Stream<Either<Failure, List<AlertModel>>> call({int limit = 10}) {
    return repository.streamRecentAlerts(limit: limit);
  }
}
