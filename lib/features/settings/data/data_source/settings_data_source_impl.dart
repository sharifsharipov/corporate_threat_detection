import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corporate_threat_detection/features/settings/data/data_source/settings_data_source.dart';
import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';

class SettingsDataSourceImpl implements SettingsDataSource {
  final FirebaseFirestore firestore;

  SettingsDataSourceImpl({required this.firestore});

  Map<String, dynamic> _normalizeSettingData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('key', () => doc.id);
    data.putIfAbsent('description', () => '');
    if (!data.containsKey('type')) {
      final value = data['value'];
      if (value is bool) {
        data['type'] = 'bool';
      } else if (value is int) {
        data['type'] = 'int';
      } else if (value is double) {
        data['type'] = 'double';
      } else {
        data['type'] = 'string';
      }
    }
    return data;
  }

  Map<String, dynamic> _normalizeProfileData(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = Map<String, dynamic>.from(doc.data() ?? {});
    data.putIfAbsent('uid', () => doc.id);
    data.putIfAbsent('email', () => '');
    data.putIfAbsent('displayName', () => '');
    data.putIfAbsent('photoUrl', () => null);
    data.putIfAbsent('role', () => UserRole.viewer.name);
    data.putIfAbsent('isActive', () => true);

    final lastLogin = data['lastLogin'];
    if (lastLogin is Timestamp) {
      data['lastLogin'] = lastLogin.toDate().toIso8601String();
    } else if (lastLogin is DateTime) {
      data['lastLogin'] = lastLogin.toIso8601String();
    }

    final role = data['role'];
    if (role is UserRole) {
      data['role'] = role.name;
    } else if (role is String) {
      data['role'] = role.toLowerCase();
    }

    return data;
  }

  @override
  Future<List<AppSettingModel>> getAppSettings() async {
    final snapshot = await firestore.collection('app_settings').get();
    return snapshot.docs
        .map((doc) => AppSettingModel.fromJson(_normalizeSettingData(doc)))
        .toList();
  }

  @override
  Stream<List<AppSettingModel>> streamAppSettings() {
    return firestore.collection('app_settings').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => AppSettingModel.fromJson(_normalizeSettingData(doc)))
              .toList(),
        );
  }

  @override
  Future<UserProfileModel> getUserProfile(String uid) async {
    final doc = await firestore.collection('user_profiles').doc(uid).get();
    if (!doc.exists || doc.data() == null) {
      return UserProfileModel(
        uid: uid,
        email: '',
        displayName: '',
        photoUrl: null,
        role: UserRole.viewer,
      );
    }
    return UserProfileModel.fromJson(_normalizeProfileData(doc));
  }

  @override
  Stream<UserProfileModel> streamUserProfile(String uid) {
    return firestore.collection('user_profiles').doc(uid).snapshots().map(
          (doc) {
            if (!doc.exists || doc.data() == null) {
              return UserProfileModel(
                uid: uid,
                email: '',
                displayName: '',
                photoUrl: null,
                role: UserRole.viewer,
              );
            }
            return UserProfileModel.fromJson(_normalizeProfileData(doc));
          },
        );
  }

  @override
  Future<void> updateSetting(AppSettingModel setting) async {
    await firestore.collection('app_settings').doc(setting.key).set(
      <String, dynamic>{
        'key': setting.key,
        'value': setting.value,
        'type': setting.type,
        'description': setting.description,
      },
      SetOptions(merge: true),
    );
  }

  @override
  Future<void> updateUserProfile(String uid, Map<String, dynamic> data) async {
    await firestore.collection('user_profiles').doc(uid).set(
      data,
      SetOptions(merge: true),
    );
  }
}
