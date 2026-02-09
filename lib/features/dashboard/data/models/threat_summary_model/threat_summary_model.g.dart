// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'threat_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreatSummaryModelImpl _$$ThreatSummaryModelImplFromJson(
  Map<String, dynamic> json,
) => _$ThreatSummaryModelImpl(
  totalThreats: (json['totalThreats'] as num).toInt(),
  criticalCount: (json['criticalCount'] as num).toInt(),
  highCount: (json['highCount'] as num).toInt(),
  mediumCount: (json['mediumCount'] as num).toInt(),
  lowCount: (json['lowCount'] as num).toInt(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => ThreatCategoryData.fromJson(e as Map<String, dynamic>))
      .toList(),
  timelineData: (json['timelineData'] as List<dynamic>)
      .map((e) => ThreatTimelinePoint.fromJson(e as Map<String, dynamic>))
      .toList(),
  topThreats: (json['topThreats'] as List<dynamic>)
      .map((e) => TopThreatData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ThreatSummaryModelImplToJson(
  _$ThreatSummaryModelImpl instance,
) => <String, dynamic>{
  'totalThreats': instance.totalThreats,
  'criticalCount': instance.criticalCount,
  'highCount': instance.highCount,
  'mediumCount': instance.mediumCount,
  'lowCount': instance.lowCount,
  'categories': instance.categories,
  'timelineData': instance.timelineData,
  'topThreats': instance.topThreats,
};

_$ThreatCategoryDataImpl _$$ThreatCategoryDataImplFromJson(
  Map<String, dynamic> json,
) => _$ThreatCategoryDataImpl(
  name: json['name'] as String,
  count: (json['count'] as num).toInt(),
  colorValue: (json['colorValue'] as num).toInt(),
  iconCodePoint: (json['iconCodePoint'] as num).toInt(),
);

Map<String, dynamic> _$$ThreatCategoryDataImplToJson(
  _$ThreatCategoryDataImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'count': instance.count,
  'colorValue': instance.colorValue,
  'iconCodePoint': instance.iconCodePoint,
};

_$ThreatTimelinePointImpl _$$ThreatTimelinePointImplFromJson(
  Map<String, dynamic> json,
) => _$ThreatTimelinePointImpl(
  date: DateTime.parse(json['date'] as String),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$$ThreatTimelinePointImplToJson(
  _$ThreatTimelinePointImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'count': instance.count,
};

_$TopThreatDataImpl _$$TopThreatDataImplFromJson(Map<String, dynamic> json) =>
    _$TopThreatDataImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      count: (json['count'] as num).toInt(),
      severity: json['severity'] as String,
      isIncreasing: json['isIncreasing'] as bool,
    );

Map<String, dynamic> _$$TopThreatDataImplToJson(_$TopThreatDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'count': instance.count,
      'severity': instance.severity,
      'isIncreasing': instance.isIncreasing,
    };
