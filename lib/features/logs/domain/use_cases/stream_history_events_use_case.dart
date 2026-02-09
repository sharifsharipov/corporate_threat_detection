import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/history_repository.dart';

class StreamHistoryEventsUseCase {
  final HistoryRepository repository;

  StreamHistoryEventsUseCase({required this.repository});

  Stream<Either<Failure, List<HistoryEventModel>>> call({int limit = 200}) =>
      repository.streamHistoryEvents(limit: limit);
}
