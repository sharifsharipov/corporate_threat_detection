import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/history_repository.dart';

class StreamHistoryEventsBySeverityUseCase {
  final HistoryRepository repository;

  StreamHistoryEventsBySeverityUseCase({required this.repository});

  Stream<Either<Failure, List<HistoryEventModel>>> call(
    EventSeverity severity, {
    int limit = 200,
  }) =>
      repository.streamHistoryEventsBySeverity(severity, limit: limit);
}
