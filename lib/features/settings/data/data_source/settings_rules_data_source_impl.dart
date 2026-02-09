import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/settings/data/data_source/settings_rules_data_source.dart';
import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';

class SettingsRulesDataSourceImpl implements SettingsRulesDataSource {
  static const String _collection = 'settings_rules';
  final FirebaseFirestore firestore;

  SettingsRulesDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeRuleData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('title', () => doc.id);
    data.putIfAbsent('description', () => '');
    data.putIfAbsent('isEnabled', () => false);
    data.putIfAbsent('severity', () => 'medium');
    final updatedAt = data['updatedAt'];
    if (updatedAt is Timestamp) {
      data['updatedAt'] = updatedAt.toDate().toIso8601String();
    } else if (updatedAt is DateTime) {
      data['updatedAt'] = updatedAt.toIso8601String();
    }
    return data;
  }

  @override
  Stream<List<SettingsRuleModel>> streamRules({int limit = 200}) {
    return firestore
        .collection(_collection)
        .limit(limit)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => SettingsRuleModel.fromJson(
                  _normalizeRuleData(doc),
                  id: doc.id,
                ),
              )
              .toList(),
        );
  }

  @override
  Future<void> updateRuleEnabled(String id, bool isEnabled) async {
    await firestore.collection(_collection).doc(id).update({
      'isEnabled': isEnabled,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }
}
