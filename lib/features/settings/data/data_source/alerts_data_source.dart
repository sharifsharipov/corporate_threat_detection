import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';

abstract class AlertsDataSource {
  Stream<List<AlertItemModel>> streamAlerts({int limit = 200});
  Stream<List<AlertItemModel>> streamAlertsBySeverity(
    AlertSeverity severity, {
    int limit = 200,
  });
  Future<void> updateAlertStatus(String id, AlertStatus status);
}
