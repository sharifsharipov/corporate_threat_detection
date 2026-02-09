// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatModelImpl _$$StatModelImplFromJson(Map<String, dynamic> json) =>
    _$StatModelImpl(
      label: json['label'] as String,
      value: json['value'] as String,
      iconCodePoint: (json['iconCodePoint'] as num).toInt(),
      colorValue: (json['colorValue'] as num).toInt(),
      backgroundColorValue:
          (json['backgroundColorValue'] as num?)?.toInt() ?? 0xFFFFFFFF,
    );

Map<String, dynamic> _$$StatModelImplToJson(_$StatModelImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'iconCodePoint': instance.iconCodePoint,
      'colorValue': instance.colorValue,
      'backgroundColorValue': instance.backgroundColorValue,
    };
