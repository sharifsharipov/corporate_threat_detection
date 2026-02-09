import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_repository.dart';

class UpdateUserProfileParams {
  final String uid;
  final Map<String, dynamic> data;

  UpdateUserProfileParams({required this.uid, required this.data});
}

class UpdateUserProfileUseCase {
  final SettingsRepository repository;

  UpdateUserProfileUseCase({required this.repository});

  Future<Either<Failure, void>> call(UpdateUserProfileParams params) =>
      repository.updateUserProfile(params.uid, params.data);
}
