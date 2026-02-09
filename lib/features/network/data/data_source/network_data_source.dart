import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';

abstract class NetworkDataSource {
  Future<List<TrafficLog>> getTrafficLogs({int limit = 200});
  Stream<List<TrafficLog>> streamTrafficLogs({int limit = 200});
}
