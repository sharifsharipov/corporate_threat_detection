import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';

abstract class LogsDataSource {
  Future<List<SystemLogModel>> getSystemLogs({int limit = 200});
  Stream<List<SystemLogModel>> streamSystemLogs({int limit = 200});
  Stream<List<SystemLogModel>> streamSystemLogsByLevel(
    LogLevel level, {
    int limit = 200,
  });
}
