import 'dart:async';
import 'dart:developer';

import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/stream_app_settings_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/stream_user_profile_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/update_setting_use_case.dart';
import 'package:corporate_threat_detection/features/settings/domain/use_cases/update_user_profile_use_case.dart';
import 'package:corporate_threat_detection/features/settings/presentation/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  static const String keyDarkMode = 'dark_mode';
  static const String keyPushNotifications = 'push_notifications';
  static const String keyEmailNotifications = 'email_notifications';
  static const String keyBiometricAuth = 'biometric_auth';
  static const String keyTwoFactorAuth = 'two_factor_auth';
  static const String keyLanguage = 'language';

  final StreamAppSettingsUseCase streamAppSettingsUseCase;
  final StreamUserProfileUseCase streamUserProfileUseCase;
  final UpdateSettingUseCase updateSettingUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;

  StreamSubscription? _settingsSub;
  StreamSubscription? _profileSub;

  SettingsCubit({
    required this.streamAppSettingsUseCase,
    required this.streamUserProfileUseCase,
    required this.updateSettingUseCase,
    required this.updateUserProfileUseCase,
  }) : super(SettingsState.initial());

  void startRealtime(String uid) {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    _settingsSub?.cancel();
    _profileSub?.cancel();

    _settingsSub = streamAppSettingsUseCase().listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (settings) => emit(
            state.copyWith(
              isLoading: false,
              settings: {for (final s in settings) s.key: s},
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );

    _profileSub = streamUserProfileUseCase(uid).listen(
      (result) {
        result.either(
          (failure) => emit(
            state.copyWith(isLoading: false, errorMessage: failure.message),
          ),
          (profile) => emit(
            state.copyWith(
              isLoading: false,
              profile: profile.displayName.isEmpty
                  ? _mockProfile.copyWith(uid: uid)
                  : profile,
              errorMessage: null,
            ),
          ),
        );
      },
      onError: (Object error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  static final UserProfileModel _mockProfile = UserProfileModel(
    uid: 'mock-uid',
    email: 'sharif@example.com',
    displayName: 'Sharif Sharipov',
    photoUrl: null,
    role: UserRole.admin,
    isActive: true,
  );

  bool getBool(String key, {bool fallback = false}) {
    final setting = state.settings[key];
    final value = setting?.value;
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    if (value is num) return value != 0;
    return fallback;
  }

  String getString(String key, {String fallback = ''}) {
    final setting = state.settings[key];
    final value = setting?.value;
    if (value is String) return value;
    return value?.toString() ?? fallback;
  }

  Future<void> updateBoolSetting(String key, bool value) async {
    // Optimistic update
    final setting = AppSettingModel(
      key: key,
      value: value,
      type: 'bool',
      description: state.settings[key]?.description,
    );
    final updated = Map<String, AppSettingModel>.from(state.settings)
      ..[key] = setting;
    emit(state.copyWith(settings: updated, errorMessage: null));

    final result = await updateSettingUseCase(setting);
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  Future<void> updateStringSetting(String key, String value) async {
    // Optimistic update
    final setting = AppSettingModel(
      key: key,
      value: value,
      type: 'string',
      description: state.settings[key]?.description,
    );
    final updated = Map<String, AppSettingModel>.from(state.settings)
      ..[key] = setting;
    emit(state.copyWith(settings: updated, errorMessage: null));

    final result = await updateSettingUseCase(setting);
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => null,
    );
  }

  Future<void> updateUserProfile({
    required String uid,
    String? displayName,
    String? photoUrl,
  }) async {
    // Optimistic update
    if (state.profile != null) {
      final updatedProfile = state.profile!.copyWith(
        displayName: displayName ?? state.profile!.displayName,
        photoUrl: photoUrl ?? state.profile!.photoUrl,
      );
      emit(state.copyWith(profile: updatedProfile));
    }

    final data = <String, dynamic>{};
    if (displayName != null) data['displayName'] = displayName;
    if (photoUrl != null) data['photoUrl'] = photoUrl;
    if (data.isEmpty) return;

    final result = await updateUserProfileUseCase(
      UpdateUserProfileParams(uid: uid, data: data),
    );
    result.either(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => log('Profile updated'),
    );
  }

  String roleLabel(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return 'Security Admin';
      case UserRole.analyst:
        return 'Security Analyst';
      case UserRole.viewer:
        return 'Viewer';
    }
  }

  @override
  Future<void> close() {
    _settingsSub?.cancel();
    _profileSub?.cancel();
    return super.close();
  }
}
