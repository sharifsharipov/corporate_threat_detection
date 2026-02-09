// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserProfileModelImpl(
  uid: json['uid'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String?,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  lastLogin: json['lastLogin'] == null
      ? null
      : DateTime.parse(json['lastLogin'] as String),
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$UserProfileModelImplToJson(
  _$UserProfileModelImpl instance,
) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
  'role': _$UserRoleEnumMap[instance.role]!,
  'lastLogin': instance.lastLogin?.toIso8601String(),
  'isActive': instance.isActive,
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.analyst: 'analyst',
  UserRole.viewer: 'viewer',
};
