import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/logs/data/data_source/history_data_source.dart';
import 'package:corporate_threat_detection/features/logs/data/models/history_event_model/history_event_model.dart';

class HistoryDataSourceImpl implements HistoryDataSource {
  static const String _collection = 'history_events';
  final FirebaseFirestore firestore;

  HistoryDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeEventData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('title', () => '');
    data.putIfAbsent('description', () => '');
    data.putIfAbsent('eventType', () => '');
    data.putIfAbsent('actionTaken', () => '');
    data.putIfAbsent('relatedEvents', () => 0);

    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    }

    final severity = data['severity'];
    if (severity is EventSeverity) {
      data['severity'] = severity.name;
    } else if (severity is String) {
      data['severity'] = severity.toLowerCase();
    }

    return data;
  }

  @override
  Future<List<HistoryEventModel>> getHistoryEvents({int limit = 200}) async {
    final snapshot = await firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs
        .map((doc) => HistoryEventModel.fromJson(_normalizeEventData(doc)))
        .toList();
  }

  @override
  Stream<List<HistoryEventModel>> streamHistoryEvents({int limit = 200}) {
    return firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => HistoryEventModel.fromJson(_normalizeEventData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<HistoryEventModel>> streamHistoryEventsBySeverity(
    EventSeverity severity, {
    int limit = 200,
  }) {
    return firestore
        .collection(_collection)
        .where('severity', isEqualTo: severity.name)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => HistoryEventModel.fromJson(_normalizeEventData(doc)))
              .toList(),
        );
  }
}
