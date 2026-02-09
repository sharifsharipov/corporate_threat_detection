import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/logs/data/data_source/logs_data_source.dart';
import 'package:corporate_threat_detection/features/logs/data/models/system_log_model/system_log_model.dart';

class LogsDataSourceImpl implements LogsDataSource {
  static const String _collection = 'system_logs';
  final FirebaseFirestore firestore;

  LogsDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeLogData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});

    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    } else if (timestamp == null) {
      data['timestamp'] = DateTime.now().toIso8601String();
    }

    final level = data['level'];
    if (level == null) {
      data['level'] = LogLevel.info.name;
    } else if (level is LogLevel) {
      data['level'] = level.name;
    } else if (level is String) {
      final normalized = level.toLowerCase();
      final isKnown = LogLevel.values.any((entry) => entry.name == normalized);
      data['level'] = isKnown ? normalized : LogLevel.info.name;
    } else if (level is int) {
      if (level >= 0 && level < LogLevel.values.length) {
        data['level'] = LogLevel.values[level].name;
      } else {
        data['level'] = LogLevel.info.name;
      }
    }

    data.putIfAbsent('message', () => '');
    data.putIfAbsent('source', () => 'system');

    return data;
  }

  @override
  Future<List<SystemLogModel>> getSystemLogs({int limit = 200}) async {
    final snapshot = await firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs
        .map((doc) => SystemLogModel.fromJson(_normalizeLogData(doc)))
        .toList();
  }

  @override
  Stream<List<SystemLogModel>> streamSystemLogs({int limit = 200}) {
    return firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SystemLogModel.fromJson(_normalizeLogData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<SystemLogModel>> streamSystemLogsByLevel(
    LogLevel level, {
    int limit = 200,
  }) {
    return firestore
        .collection(_collection)
        .where('level', isEqualTo: level.name)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SystemLogModel.fromJson(_normalizeLogData(doc)))
              .toList(),
        );
  }
}
