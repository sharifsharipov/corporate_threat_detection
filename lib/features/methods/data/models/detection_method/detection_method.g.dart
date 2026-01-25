// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectionMethodImpl _$$DetectionMethodImplFromJson(
  Map<String, dynamic> json,
) => _$DetectionMethodImpl(
  methodId: json['methodId'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$DetectionMethodImplToJson(
  _$DetectionMethodImpl instance,
) => <String, dynamic>{
  'methodId': instance.methodId,
  'name': instance.name,
  'type': instance.type,
  'description': instance.description,
  'createdAt': instance.createdAt?.toIso8601String(),
};
