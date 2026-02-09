import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/domain/repository/network_repository.dart';

class StreamNetworkDeviceUseCase {
  final NetworkRepository repository;

  StreamNetworkDeviceUseCase({required this.repository});

  Stream<Either<Failure, NetworkDeviceModel?>> call({required String deviceId}) {
    return repository.streamDevice(deviceId: deviceId);
  }
}
