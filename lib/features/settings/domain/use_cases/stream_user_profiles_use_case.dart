import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/repository/settings_repository.dart';

class StreamUserProfilesUseCase {
  final SettingsRepository repository;

  StreamUserProfilesUseCase({required this.repository});

  Stream<Either<Failure, List<UserProfileModel>>> call({int limit = 200}) {
    return repository.streamUserProfiles(limit: limit);
  }
}
