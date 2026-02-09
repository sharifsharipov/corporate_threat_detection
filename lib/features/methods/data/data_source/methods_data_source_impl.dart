import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/methods/data/data_source/methods_data_source.dart';
import 'package:corporate_threat_detection/features/methods/data/models/detection_method/detection_method.dart';

class MethodsDataSourceImpl implements MethodsDataSource {
  static const String _collection = 'detection_methods';
  final FirebaseFirestore firestore;

  MethodsDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeMethodData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('methodId', () => doc.id);
    data.putIfAbsent('name', () => doc.id);
    data.putIfAbsent('type', () => 'signature');
    data.putIfAbsent('description', () => '');
    final createdAt = data['createdAt'];
    if (createdAt is Timestamp) {
      data['createdAt'] = createdAt.toDate().toIso8601String();
    } else if (createdAt is DateTime) {
      data['createdAt'] = createdAt.toIso8601String();
    }
    return data;
  }

  @override
  Stream<List<DetectionMethod>> streamMethods({
    String? type,
    int limit = 200,
  }) {
    Query<Map<String, dynamic>> query = firestore.collection(_collection);
    if (type != null && type.isNotEmpty) {
      query = query.where('type', isEqualTo: type);
    }
    return query.limit(limit).snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => DetectionMethod.fromJson(_normalizeMethodData(doc)))
              .toList(),
        );
  }
}
