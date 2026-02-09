import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/exeption.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/data_source/settings_rules_data_source.dart';
import 'package:corporate_threat_detection/features/settings/data/models/settings_rule_model/settings_rule_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_rules_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class SettingsRulesRepositoryImpl implements SettingsRulesRepository {
  final SettingsRulesDataSource dataSource;

  SettingsRulesRepositoryImpl({required this.dataSource});

  @override
  Stream<Either<Failure, List<SettingsRuleModel>>> streamRules({
    int limit = 200,
  }) {
    try {
      return dataSource
          .streamRules(limit: limit)
          .map((rules) => Right<Failure, List<SettingsRuleModel>>(rules));
    } on FirebaseException catch (e) {
      return Stream.value(Left(ServerFailure(message: e.message ?? e.code)));
    } catch (e) {
      return Stream.value(Left(UnexpectedFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> updateRuleEnabled(
    String id,
    bool isEnabled,
  ) async {
    try {
      await dataSource.updateRuleEnabled(id, isEnabled);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(message: e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
