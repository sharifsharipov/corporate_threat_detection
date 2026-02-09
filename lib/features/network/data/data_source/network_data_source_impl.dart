import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/logs/data/models/traffic_log/traffic_log.dart';
import 'package:corporate_threat_detection/features/network/data/data_source/network_data_source.dart';
import 'package:corporate_threat_detection/features/network/data/models/device_api_usage_model/device_api_usage_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_device_model/network_device_model.dart';
import 'package:corporate_threat_detection/features/network/data/models/network_protocol_model/network_protocol_model.dart';

class NetworkDataSourceImpl implements NetworkDataSource {
  static const String _trafficCollection = 'traffic_logs';
  static const String _devicesCollection = 'network_devices';
  static const String _protocolsCollection = 'network_protocols';
  static const String _apiUsageCollection = 'device_api_usage';
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
    data.putIfAbsent('timestamp', () => DateTime.now().toIso8601String());

    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    }
    return data;
  }

  Map<String, dynamic> _normalizeDeviceData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('id', () => doc.id);
    data.putIfAbsent('name', () => doc.id);
    data.putIfAbsent('ipAddress', () => '');
    data.putIfAbsent('macAddress', () => '');
    data.putIfAbsent('type', () => 'Device');
    data.putIfAbsent('osVersion', () => '');
    data.putIfAbsent('lastSeen', () => DateTime.now().toIso8601String());

    final status = data['status'];
    if (status is DeviceStatus) {
      data['status'] = status.name;
    } else if (status is String) {
      data['status'] = status.toLowerCase();
    } else {
      data['status'] = DeviceStatus.online.name;
    }

    final lastSeen = data['lastSeen'];
    if (lastSeen is Timestamp) {
      data['lastSeen'] = lastSeen.toDate().toIso8601String();
    } else if (lastSeen is DateTime) {
      data['lastSeen'] = lastSeen.toIso8601String();
    }

    return data;
  }

  Map<String, dynamic> _normalizeProtocolData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('name', () => doc.id);
    data.putIfAbsent('description', () => '');
    data.putIfAbsent('port', () => 0);
    data.putIfAbsent('usageCount', () => 0);
    data.putIfAbsent('status', () => 'monitored');
    final lastSeen = data['lastSeen'];
    if (lastSeen is Timestamp) {
      data['lastSeen'] = lastSeen.toDate().toIso8601String();
    } else if (lastSeen is DateTime) {
      data['lastSeen'] = lastSeen.toIso8601String();
    }
    return data;
  }

  Map<String, dynamic> _normalizeApiUsageData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('deviceId', () => '');
    data.putIfAbsent('endpoint', () => '');
    data.putIfAbsent('method', () => 'GET');
    data.putIfAbsent('requestCount', () => 0);
    data.putIfAbsent('successRate', () => 0);
    data.putIfAbsent('status', () => 'healthy');
    final lastCalled = data['lastCalled'];
    if (lastCalled is Timestamp) {
      data['lastCalled'] = lastCalled.toDate().toIso8601String();
    } else if (lastCalled is DateTime) {
      data['lastCalled'] = lastCalled.toIso8601String();
    }
    return data;
  }

  @override
  Future<List<TrafficLog>> getTrafficLogs({int limit = 200}) async {
    final snapshot = await firestore
        .collection(_trafficCollection)
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
        .collection(_trafficCollection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TrafficLog.fromJson(_normalizeTrafficData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<TrafficLog>> streamTrafficLogsByDevice(
    String deviceId, {
    int limit = 200,
  }) {
    return firestore
        .collection(_trafficCollection)
        .where('deviceId', isEqualTo: deviceId)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TrafficLog.fromJson(_normalizeTrafficData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<NetworkDeviceModel>> streamDevices({int limit = 200}) {
    return firestore
        .collection(_devicesCollection)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => NetworkDeviceModel.fromJson(_normalizeDeviceData(doc)),
              )
              .toList(),
        );
  }

  @override
  Stream<NetworkDeviceModel?> streamDevice(String deviceId) {
    return firestore
        .collection(_devicesCollection)
        .doc(deviceId)
        .snapshots()
        .map((doc) {
          if (!doc.exists || doc.data() == null) {
            return null;
          }
          return NetworkDeviceModel.fromJson(_normalizeDeviceData(doc));
        });
  }

  @override
  Stream<List<NetworkProtocolModel>> streamProtocols({int limit = 200}) {
    return firestore
        .collection(_protocolsCollection)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => NetworkProtocolModel.fromJson(
                  _normalizeProtocolData(doc),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }

  @override
  Stream<List<DeviceApiUsageModel>> streamDeviceApiUsage({
    String? deviceId,
    int limit = 200,
  }) {
    Query<Map<String, dynamic>> query =
        firestore.collection(_apiUsageCollection);
    if (deviceId != null && deviceId.isNotEmpty) {
      query = query.where('deviceId', isEqualTo: deviceId);
    }
    return query.limit(limit).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => DeviceApiUsageModel.fromJson(
                  _normalizeApiUsageData(doc),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }
}
