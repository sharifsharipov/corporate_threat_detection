// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_metric_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceMetricModelImpl _$$PerformanceMetricModelImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceMetricModelImpl(
  title: json['title'] as String,
  value: json['value'] as String,
  iconCodePoint: (json['iconCodePoint'] as num).toInt(),
  colorValue: (json['colorValue'] as num).toInt(),
  changePercentage: (json['changePercentage'] as num).toDouble(),
  isIncrease: json['isIncrease'] as bool? ?? true,
);

Map<String, dynamic> _$$PerformanceMetricModelImplToJson(
  _$PerformanceMetricModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'value': instance.value,
  'iconCodePoint': instance.iconCodePoint,
  'colorValue': instance.colorValue,
  'changePercentage': instance.changePercentage,
  'isIncrease': instance.isIncrease,
};
