import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_rules_repository.dart';

class StreamSettingsRulesUseCase {
  final SettingsRulesRepository repository;

  StreamSettingsRulesUseCase({required this.repository});

  Stream<Either<Failure, List<SettingsRuleModel>>> call({int limit = 200}) =>
      repository.streamRules(limit: limit);
}
