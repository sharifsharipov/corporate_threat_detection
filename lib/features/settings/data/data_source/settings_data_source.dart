import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';

abstract class SettingsDataSource {
  Future<List<AppSettingModel>> getAppSettings();
  Stream<List<AppSettingModel>> streamAppSettings();
  Future<UserProfileModel> getUserProfile(String uid);
  Stream<UserProfileModel> streamUserProfile(String uid);
  Future<void> updateSetting(AppSettingModel setting);
  Future<void> updateUserProfile(String uid, Map<String, dynamic> data);
}
