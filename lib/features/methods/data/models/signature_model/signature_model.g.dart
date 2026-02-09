// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignatureModelImpl _$$SignatureModelImplFromJson(Map<String, dynamic> json) =>
    _$SignatureModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      pattern: json['pattern'] as String,
      threatType: json['threatType'] as String,
      addedDate: DateTime.parse(json['addedDate'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$SignatureModelImplToJson(
  _$SignatureModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'pattern': instance.pattern,
  'threatType': instance.threatType,
  'addedDate': instance.addedDate.toIso8601String(),
  'isActive': instance.isActive,
};
