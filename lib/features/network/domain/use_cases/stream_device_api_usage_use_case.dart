import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:corporate_threat_detection/features/network/domain/repository/network_repository.dart';

class StreamDeviceApiUsageUseCase {
  final NetworkRepository repository;

  StreamDeviceApiUsageUseCase({required this.repository});

  Stream<Either<Failure, List<DeviceApiUsageModel>>> call({
    String? deviceId,
    int limit = 200,
  }) {
    return repository.streamDeviceApiUsage(deviceId: deviceId, limit: limit);
  }
}
