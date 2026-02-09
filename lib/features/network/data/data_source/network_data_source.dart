import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';

abstract class NetworkDataSource {
  Future<List<TrafficLog>> getTrafficLogs({int limit = 200});
  Stream<List<TrafficLog>> streamTrafficLogs({int limit = 200});
  Stream<List<TrafficLog>> streamTrafficLogsByDevice(
    String deviceId, {
    int limit = 200,
  });
  Stream<List<NetworkDeviceModel>> streamDevices({int limit = 200});
  Stream<NetworkDeviceModel?> streamDevice(String deviceId);
  Stream<List<NetworkProtocolModel>> streamProtocols({int limit = 200});
  Stream<List<DeviceApiUsageModel>> streamDeviceApiUsage({
    String? deviceId,
    int limit = 200,
  });
}
