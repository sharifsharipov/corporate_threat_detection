import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_rules_repository.dart';

class UpdateSettingsRuleUseCase {
  final SettingsRulesRepository repository;

  UpdateSettingsRuleUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id, bool isEnabled) =>
      repository.updateRuleEnabled(id, isEnabled);
}
