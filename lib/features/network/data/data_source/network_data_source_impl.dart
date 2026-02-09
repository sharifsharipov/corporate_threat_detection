import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/data_source/network_data_source.dart';

class NetworkDataSourceImpl implements NetworkDataSource {
  static const String _collection = 'traffic_logs';
  final FirebaseFirestore firestore;

  NetworkDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeTrafficData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('deviceId', () => '');
    data.putIfAbsent('sourceIp', () => '');
    data.putIfAbsent('destinationIp', () => '');
    data.putIfAbsent('protocol', () => '');
    data.putIfAbsent('port', () => 0);
    data.putIfAbsent('packetSize', () => 0);

    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    }
    return data;
  }

  @override
  Future<List<TrafficLog>> getTrafficLogs({int limit = 200}) async {
    final snapshot = await firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs
        .map((doc) => TrafficLog.fromJson(_normalizeTrafficData(doc)))
        .toList();
  }

  @override
  Stream<List<TrafficLog>> streamTrafficLogs({int limit = 200}) {
    return firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TrafficLog.fromJson(_normalizeTrafficData(doc)))
              .toList(),
        );
  }
}
