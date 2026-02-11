// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectionRuleModelImpl _$$DetectionRuleModelImplFromJson(
  Map<String, dynamic> json,
) => _$DetectionRuleModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  condition: json['condition'] as String,
  action: json['action'] as String,
  isEnabled: json['isEnabled'] as bool,
  lastTriggered: json['lastTriggered'] == null
      ? null
      : DateTime.parse(json['lastTriggered'] as String),
);

Map<String, dynamic> _$$DetectionRuleModelImplToJson(
  _$DetectionRuleModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'condition': instance.condition,
  'action': instance.action,
  'isEnabled': instance.isEnabled,
  'lastTriggered': instance.lastTriggered?.toIso8601String(),
};
