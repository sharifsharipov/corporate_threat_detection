import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/domain/repository/network_repository.dart';

class StreamTrafficLogsByDeviceUseCase {
  final NetworkRepository repository;

  StreamTrafficLogsByDeviceUseCase({required this.repository});

  Stream<Either<Failure, List<TrafficLog>>> call({
    required String deviceId,
    int limit = 200,
  }) {
    return repository.streamTrafficLogsByDevice(
      deviceId: deviceId,
      limit: limit,
    );
  }
}
