import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/threats/data/data_source/threats_data_source.dart';
import 'package:corporate_threat_detection/features/threats/data/models/threat/threat.dart';

class ThreatsDataSourceImpl implements ThreatsDataSource {
  final FirebaseFirestore firestore;

  ThreatsDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeThreatData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    if (!data.containsKey('threatId')) {
      data['threatId'] = doc.id;
    }
    final detectedAt = data['detectedAt'];
    if (detectedAt is Timestamp) {
      data['detectedAt'] = detectedAt.toDate().toIso8601String();
    } else if (detectedAt is DateTime) {
      data['detectedAt'] = detectedAt.toIso8601String();
    }
    return data;
  }

  @override
  Future<List<Threat>> getThreats() async {
    final snapshot = await firestore.collection('threats').get();
    return snapshot.docs
        .map((doc) => Threat.fromJson(_normalizeThreatData(doc)))
        .toList();
  }

  @override
  Stream<List<Threat>> streamThreats() {
    return firestore.collection('threats').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Threat.fromJson(_normalizeThreatData(doc)))
              .toList(),
        );
  }

  @override
  Stream<List<Threat>> streamThreatsByStatus(String status) {
    return firestore
        .collection('threats')
        .where('status', isEqualTo: status)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Threat.fromJson(_normalizeThreatData(doc)))
              .toList(),
        );
  }

  @override
  Future<Threat> getThreatById(String id) async {
    final doc = await firestore.collection('threats').doc(id).get();
    if (doc.exists) {
      return Threat.fromJson(_normalizeThreatData(doc));
    } else {
      throw Exception("Threat not found");
    }
  }

  @override
  Future<void> updateThreatStatus(String id, String status) async {
    await firestore.collection('threats').doc(id).update({'status': status});
  }
}
