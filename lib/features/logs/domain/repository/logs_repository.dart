import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';

abstract class LogsRepository {
  Future<Either<Failure, List<SystemLogModel>>> getSystemLogs({int limit = 200});
  Stream<Either<Failure, List<SystemLogModel>>> streamSystemLogs({
    int limit = 200,
  });
  Stream<Either<Failure, List<SystemLogModel>>> streamSystemLogsByLevel(
    LogLevel level, {
    int limit = 200,
  });
}
