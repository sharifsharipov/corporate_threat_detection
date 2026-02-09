import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';

abstract class SettingsRulesDataSource {
  Stream<List<SettingsRuleModel>> streamRules({int limit = 200});
  Future<void> updateRuleEnabled(String id, bool isEnabled);
}
