import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';

abstract class NetworkRepository {
  Future<Either<Failure, List<TrafficLog>>> getTrafficLogs({int limit = 200});
  Stream<Either<Failure, List<TrafficLog>>> streamTrafficLogs({
    int limit = 200,
  });
  Stream<Either<Failure, List<TrafficLog>>> streamTrafficLogsByDevice({
    required String deviceId,
    int limit = 200,
  });
  Stream<Either<Failure, List<NetworkDeviceModel>>> streamDevices({
    int limit = 200,
  });
  Stream<Either<Failure, NetworkDeviceModel?>> streamDevice({
    required String deviceId,
  });
  Stream<Either<Failure, List<NetworkProtocolModel>>> streamProtocols({
    int limit = 200,
  });
  Stream<Either<Failure, List<DeviceApiUsageModel>>> streamDeviceApiUsage({
    String? deviceId,
    int limit = 200,
  });
}
