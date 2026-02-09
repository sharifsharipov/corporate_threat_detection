import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';

abstract class HistoryDataSource {
  Future<List<HistoryEventModel>> getHistoryEvents({int limit = 200});
  Stream<List<HistoryEventModel>> streamHistoryEvents({int limit = 200});
  Stream<List<HistoryEventModel>> streamHistoryEventsBySeverity(
    EventSeverity severity, {
    int limit = 200,
  });
}
