import 'package:corporate_threat_detection/features/settings/data/models/app_setting_model/app_setting_model.dart';
import 'package:corporate_threat_detection/features/settings/data/models/user_profile_model/user_profile_model.dart';
import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool isLoading;
  final Map<String, AppSettingModel> settings;
  final UserProfileModel? profile;
  final String? errorMessage;

  const SettingsState({
    required this.isLoading,
    required this.settings,
    required this.profile,
    required this.errorMessage,
  });

  factory SettingsState.initial() => const SettingsState(
    isLoading: false,
    settings: {},
    profile: null,
    errorMessage: null,
  );

  SettingsState copyWith({
    bool? isLoading,
    Map<String, AppSettingModel>? settings,
    Object? profile = _unset,
    String? errorMessage,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      settings: settings ?? this.settings,
      profile: profile == _unset ? this.profile : profile as UserProfileModel?,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    settings,
    profile,
    errorMessage,
  ];
}

const Object _unset = Object();
