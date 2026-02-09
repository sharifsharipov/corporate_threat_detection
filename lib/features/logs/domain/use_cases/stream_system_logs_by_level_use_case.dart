import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/logs_repository.dart';

class StreamSystemLogsByLevelParams {
  final LogLevel level;
  final int limit;

  StreamSystemLogsByLevelParams({required this.level, this.limit = 200});
}

class StreamSystemLogsByLevelUseCase {
  final LogsRepository repository;

  StreamSystemLogsByLevelUseCase({required this.repository});

  Stream<Either<Failure, List<SystemLogModel>>> call(
    StreamSystemLogsByLevelParams params,
  ) =>
      repository.streamSystemLogsByLevel(params.level, limit: params.limit);
}
