import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';

abstract class AlertsRepository {
  Stream<Either<Failure, List<AlertItemModel>>> streamAlerts({int limit = 200});
  Stream<Either<Failure, List<AlertItemModel>>> streamAlertsBySeverity(
    AlertSeverity severity, {
    int limit = 200,
  });
  Future<Either<Failure, void>> updateAlertStatus(
    String id,
    AlertStatus status,
  );
}
