import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';

abstract class NetworkRepository {
  Future<Either<Failure, List<TrafficLog>>> getTrafficLogs({int limit = 200});
  Stream<Either<Failure, List<TrafficLog>>> streamTrafficLogs({
    int limit = 200,
  });
}
