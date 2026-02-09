import 'package:corporate_threat_detection/core/either/either.dart';
import 'package:corporate_threat_detection/core/error/failure.dart';
import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';

abstract class SettingsRepository {
  Future<Either<Failure, List<AppSettingModel>>> getAppSettings();
  Stream<Either<Failure, List<AppSettingModel>>> streamAppSettings();
  Future<Either<Failure, UserProfileModel>> getUserProfile(String uid);
  Stream<Either<Failure, UserProfileModel>> streamUserProfile(String uid);
  Stream<Either<Failure, List<UserProfileModel>>> streamUserProfiles({
    int limit = 200,
  });
  Future<Either<Failure, void>> updateSetting(AppSettingModel setting);
  Future<Either<Failure, void>> updateUserProfile(
    String uid,
    Map<String, dynamic> data,
  );
}
