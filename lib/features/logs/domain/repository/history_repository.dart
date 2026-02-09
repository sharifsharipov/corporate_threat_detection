import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<HistoryEventModel>>> getHistoryEvents({
    int limit = 200,
  });
  Stream<Either<Failure, List<HistoryEventModel>>> streamHistoryEvents({
    int limit = 200,
  });
  Stream<Either<Failure, List<HistoryEventModel>>>
  streamHistoryEventsBySeverity(
    EventSeverity severity, {
    int limit = 200,
  });
}
