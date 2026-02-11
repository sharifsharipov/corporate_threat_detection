// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingModelImpl _$$AppSettingModelImplFromJson(
  Map<String, dynamic> json,
) => _$AppSettingModelImpl(
  key: json['key'] as String,
  value: json['value'],
  type: json['type'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$AppSettingModelImplToJson(
  _$AppSettingModelImpl instance,
) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
  'type': instance.type,
  'description': instance.description,
};
