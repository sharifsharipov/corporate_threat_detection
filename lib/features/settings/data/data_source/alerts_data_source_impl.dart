import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/settings/data/data_source/alerts_data_source.dart';
import 'package:corporate_threat_detection/features/settings/data/models/alert_item_model/alert_item_model.dart';

class AlertsDataSourceImpl implements AlertsDataSource {
  static const String _collection = 'alerts';
  final FirebaseFirestore firestore;

  AlertsDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeAlertData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('title', () => '');
    data.putIfAbsent('description', () => '');
    data.putIfAbsent('severity', () => AlertSeverity.low.name);
    data.putIfAbsent('status', () => AlertStatus.active.name);

    final timestamp = data['timestamp'];
    if (timestamp is Timestamp) {
      data['timestamp'] = timestamp.toDate().toIso8601String();
    } else if (timestamp is DateTime) {
      data['timestamp'] = timestamp.toIso8601String();
    }

    return data;
  }

  @override
  Stream<List<AlertItemModel>> streamAlerts({int limit = 200}) {
    return firestore
        .collection(_collection)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => AlertItemModel.fromJson(
                  _normalizeAlertData(doc),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }

  @override
  Stream<List<AlertItemModel>> streamAlertsBySeverity(
    AlertSeverity severity, {
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
              .map(
                (doc) => AlertItemModel.fromJson(
                  _normalizeAlertData(doc),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> updateAlertStatus(String id, AlertStatus status) async {
    await firestore.collection(_collection).doc(id).update({
      'status': status.name,
    });
  }
}
