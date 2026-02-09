import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/core/usecase/usecase.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';
import 'package:corporate_threat_detection/features/logs/domain/repository/logs_repository.dart';

class GetSystemLogsParams {
  final int limit;

  GetSystemLogsParams({this.limit = 200});
}

class GetSystemLogsUseCase
    extends UseCase<List<SystemLogModel>, GetSystemLogsParams> {
  final LogsRepository repository;

  GetSystemLogsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SystemLogModel>>> call(
    GetSystemLogsParams params,
  ) =>
      repository.getSystemLogs(limit: params.limit);
}
