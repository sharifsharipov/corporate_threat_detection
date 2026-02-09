import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/domain/repository/network_repository.dart';

class StreamTrafficLogsUseCase {
  final NetworkRepository repository;

  StreamTrafficLogsUseCase({required this.repository});

  Stream<Either<Failure, List<TrafficLog>>> call({int limit = 200}) =>
      repository.streamTrafficLogs(limit: limit);
}
