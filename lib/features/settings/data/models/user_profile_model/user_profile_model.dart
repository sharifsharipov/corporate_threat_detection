import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

enum UserRole { admin, analyst, viewer }

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String uid,
    required String email,
    required String displayName,
    required String? photoUrl,
    required UserRole role,
    DateTime? lastLogin,
    @Default(true) bool isActive,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}
