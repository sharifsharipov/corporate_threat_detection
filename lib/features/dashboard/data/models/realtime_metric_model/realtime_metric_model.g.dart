// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_metric_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RealtimeMetricModelImpl _$$RealtimeMetricModelImplFromJson(
  Map<String, dynamic> json,
) => _$RealtimeMetricModelImpl(
  label: json['label'] as String,
  value: (json['value'] as num).toDouble(),
  iconCodePoint: (json['iconCodePoint'] as num).toInt(),
  colorValue: (json['colorValue'] as num).toInt(),
  isIncreasing: json['isIncreasing'] as bool? ?? true,
  changeAmount: (json['changeAmount'] as num?)?.toDouble() ?? 0,
  backgroundColorValue:
      (json['backgroundColorValue'] as num?)?.toInt() ?? 0xFFFFFFFF,
);

Map<String, dynamic> _$$RealtimeMetricModelImplToJson(
  _$RealtimeMetricModelImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
  'iconCodePoint': instance.iconCodePoint,
  'colorValue': instance.colorValue,
  'isIncreasing': instance.isIncreasing,
  'changeAmount': instance.changeAmount,
  'backgroundColorValue': instance.backgroundColorValue,
};
