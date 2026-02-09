import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';

abstract class SettingsRulesRepository {
  Stream<Either<Failure, List<SettingsRuleModel>>> streamRules({int limit = 200});
  Future<Either<Failure, void>> updateRuleEnabled(String id, bool isEnabled);
}
