import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/logs_repository.dart';

class StreamSystemLogsParams {
  final int limit;

  StreamSystemLogsParams({this.limit = 200});
}

class StreamSystemLogsUseCase {
  final LogsRepository repository;

  StreamSystemLogsUseCase({required this.repository});

  Stream<Either<Failure, List<SystemLogModel>>> call(
    StreamSystemLogsParams params,
  ) =>
      repository.streamSystemLogs(limit: params.limit);
}
