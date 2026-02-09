import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/alerts_repository.dart';

class StreamAlertsBySeverityUseCase {
  final AlertsRepository repository;

  StreamAlertsBySeverityUseCase({required this.repository});

  Stream<Either<Failure, List<AlertItemModel>>> call(
    AlertSeverity severity, {
    int limit = 200,
  }) =>
      repository.streamAlertsBySeverity(severity, limit: limit);
}
