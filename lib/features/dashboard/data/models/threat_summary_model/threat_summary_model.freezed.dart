// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threat_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ThreatSummaryModel _$ThreatSummaryModelFromJson(Map<String, dynamic> json) {
  return _ThreatSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ThreatSummaryModel {
  int get totalThreats => throw _privateConstructorUsedError;
  int get criticalCount => throw _privateConstructorUsedError;
  int get highCount => throw _privateConstructorUsedError;
  int get mediumCount => throw _privateConstructorUsedError;
  int get lowCount => throw _privateConstructorUsedError;
  List<ThreatCategoryData> get categories => throw _privateConstructorUsedError;
  List<ThreatTimelinePoint> get timelineData =>
      throw _privateConstructorUsedError;
  List<TopThreatData> get topThreats => throw _privateConstructorUsedError;

  /// Serializes this ThreatSummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreatSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreatSummaryModelCopyWith<ThreatSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreatSummaryModelCopyWith<$Res> {
  factory $ThreatSummaryModelCopyWith(
    ThreatSummaryModel value,
    $Res Function(ThreatSummaryModel) then,
  ) = _$ThreatSummaryModelCopyWithImpl<$Res, ThreatSummaryModel>;
  @useResult
  $Res call({
    int totalThreats,
    int criticalCount,
    int highCount,
    int mediumCount,
    int lowCount,
    List<ThreatCategoryData> categories,
    List<ThreatTimelinePoint> timelineData,
    List<TopThreatData> topThreats,
  });
}

/// @nodoc
class _$ThreatSummaryModelCopyWithImpl<$Res, $Val extends ThreatSummaryModel>
    implements $ThreatSummaryModelCopyWith<$Res> {
  _$ThreatSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreatSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalThreats = null,
    Object? criticalCount = null,
    Object? highCount = null,
    Object? mediumCount = null,
    Object? lowCount = null,
    Object? categories = null,
    Object? timelineData = null,
    Object? topThreats = null,
  }) {
    return _then(
      _value.copyWith(
            totalThreats: null == totalThreats
                ? _value.totalThreats
                : totalThreats // ignore: cast_nullable_to_non_nullable
                      as int,
            criticalCount: null == criticalCount
                ? _value.criticalCount
                : criticalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            highCount: null == highCount
                ? _value.highCount
                : highCount // ignore: cast_nullable_to_non_nullable
                      as int,
            mediumCount: null == mediumCount
                ? _value.mediumCount
                : mediumCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lowCount: null == lowCount
                ? _value.lowCount
                : lowCount // ignore: cast_nullable_to_non_nullable
                      as int,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<ThreatCategoryData>,
            timelineData: null == timelineData
                ? _value.timelineData
                : timelineData // ignore: cast_nullable_to_non_nullable
                      as List<ThreatTimelinePoint>,
            topThreats: null == topThreats
                ? _value.topThreats
                : topThreats // ignore: cast_nullable_to_non_nullable
                      as List<TopThreatData>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThreatSummaryModelImplCopyWith<$Res>
    implements $ThreatSummaryModelCopyWith<$Res> {
  factory _$$ThreatSummaryModelImplCopyWith(
    _$ThreatSummaryModelImpl value,
    $Res Function(_$ThreatSummaryModelImpl) then,
  ) = __$$ThreatSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalThreats,
    int criticalCount,
    int highCount,
    int mediumCount,
    int lowCount,
    List<ThreatCategoryData> categories,
    List<ThreatTimelinePoint> timelineData,
    List<TopThreatData> topThreats,
  });
}

/// @nodoc
class __$$ThreatSummaryModelImplCopyWithImpl<$Res>
    extends _$ThreatSummaryModelCopyWithImpl<$Res, _$ThreatSummaryModelImpl>
    implements _$$ThreatSummaryModelImplCopyWith<$Res> {
  __$$ThreatSummaryModelImplCopyWithImpl(
    _$ThreatSummaryModelImpl _value,
    $Res Function(_$ThreatSummaryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThreatSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalThreats = null,
    Object? criticalCount = null,
    Object? highCount = null,
    Object? mediumCount = null,
    Object? lowCount = null,
    Object? categories = null,
    Object? timelineData = null,
    Object? topThreats = null,
  }) {
    return _then(
      _$ThreatSummaryModelImpl(
        totalThreats: null == totalThreats
            ? _value.totalThreats
            : totalThreats // ignore: cast_nullable_to_non_nullable
                  as int,
        criticalCount: null == criticalCount
            ? _value.criticalCount
            : criticalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        highCount: null == highCount
            ? _value.highCount
            : highCount // ignore: cast_nullable_to_non_nullable
                  as int,
        mediumCount: null == mediumCount
            ? _value.mediumCount
            : mediumCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lowCount: null == lowCount
            ? _value.lowCount
            : lowCount // ignore: cast_nullable_to_non_nullable
                  as int,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<ThreatCategoryData>,
        timelineData: null == timelineData
            ? _value._timelineData
            : timelineData // ignore: cast_nullable_to_non_nullable
                  as List<ThreatTimelinePoint>,
        topThreats: null == topThreats
            ? _value._topThreats
            : topThreats // ignore: cast_nullable_to_non_nullable
                  as List<TopThreatData>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreatSummaryModelImpl implements _ThreatSummaryModel {
  const _$ThreatSummaryModelImpl({
    required this.totalThreats,
    required this.criticalCount,
    required this.highCount,
    required this.mediumCount,
    required this.lowCount,
    required final List<ThreatCategoryData> categories,
    required final List<ThreatTimelinePoint> timelineData,
    required final List<TopThreatData> topThreats,
  }) : _categories = categories,
       _timelineData = timelineData,
       _topThreats = topThreats;

  factory _$ThreatSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreatSummaryModelImplFromJson(json);

  @override
  final int totalThreats;
  @override
  final int criticalCount;
  @override
  final int highCount;
  @override
  final int mediumCount;
  @override
  final int lowCount;
  final List<ThreatCategoryData> _categories;
  @override
  List<ThreatCategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<ThreatTimelinePoint> _timelineData;
  @override
  List<ThreatTimelinePoint> get timelineData {
    if (_timelineData is EqualUnmodifiableListView) return _timelineData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timelineData);
  }

  final List<TopThreatData> _topThreats;
  @override
  List<TopThreatData> get topThreats {
    if (_topThreats is EqualUnmodifiableListView) return _topThreats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topThreats);
  }

  @override
  String toString() {
    return 'ThreatSummaryModel(totalThreats: $totalThreats, criticalCount: $criticalCount, highCount: $highCount, mediumCount: $mediumCount, lowCount: $lowCount, categories: $categories, timelineData: $timelineData, topThreats: $topThreats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreatSummaryModelImpl &&
            (identical(other.totalThreats, totalThreats) ||
                other.totalThreats == totalThreats) &&
            (identical(other.criticalCount, criticalCount) ||
                other.criticalCount == criticalCount) &&
            (identical(other.highCount, highCount) ||
                other.highCount == highCount) &&
            (identical(other.mediumCount, mediumCount) ||
                other.mediumCount == mediumCount) &&
            (identical(other.lowCount, lowCount) ||
                other.lowCount == lowCount) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(
              other._timelineData,
              _timelineData,
            ) &&
            const DeepCollectionEquality().equals(
              other._topThreats,
              _topThreats,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalThreats,
    criticalCount,
    highCount,
    mediumCount,
    lowCount,
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_timelineData),
    const DeepCollectionEquality().hash(_topThreats),
  );

  /// Create a copy of ThreatSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreatSummaryModelImplCopyWith<_$ThreatSummaryModelImpl> get copyWith =>
      __$$ThreatSummaryModelImplCopyWithImpl<_$ThreatSummaryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreatSummaryModelImplToJson(this);
  }
}

abstract class _ThreatSummaryModel implements ThreatSummaryModel {
  const factory _ThreatSummaryModel({
    required final int totalThreats,
    required final int criticalCount,
    required final int highCount,
    required final int mediumCount,
    required final int lowCount,
    required final List<ThreatCategoryData> categories,
    required final List<ThreatTimelinePoint> timelineData,
    required final List<TopThreatData> topThreats,
  }) = _$ThreatSummaryModelImpl;

  factory _ThreatSummaryModel.fromJson(Map<String, dynamic> json) =
      _$ThreatSummaryModelImpl.fromJson;

  @override
  int get totalThreats;
  @override
  int get criticalCount;
  @override
  int get highCount;
  @override
  int get mediumCount;
  @override
  int get lowCount;
  @override
  List<ThreatCategoryData> get categories;
  @override
  List<ThreatTimelinePoint> get timelineData;
  @override
  List<TopThreatData> get topThreats;

  /// Create a copy of ThreatSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreatSummaryModelImplCopyWith<_$ThreatSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThreatCategoryData _$ThreatCategoryDataFromJson(Map<String, dynamic> json) {
  return _ThreatCategoryData.fromJson(json);
}

/// @nodoc
mixin _$ThreatCategoryData {
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  int get iconCodePoint => throw _privateConstructorUsedError;

  /// Serializes this ThreatCategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreatCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreatCategoryDataCopyWith<ThreatCategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreatCategoryDataCopyWith<$Res> {
  factory $ThreatCategoryDataCopyWith(
    ThreatCategoryData value,
    $Res Function(ThreatCategoryData) then,
  ) = _$ThreatCategoryDataCopyWithImpl<$Res, ThreatCategoryData>;
  @useResult
  $Res call({String name, int count, int colorValue, int iconCodePoint});
}

/// @nodoc
class _$ThreatCategoryDataCopyWithImpl<$Res, $Val extends ThreatCategoryData>
    implements $ThreatCategoryDataCopyWith<$Res> {
  _$ThreatCategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreatCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? colorValue = null,
    Object? iconCodePoint = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            colorValue: null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                      as int,
            iconCodePoint: null == iconCodePoint
                ? _value.iconCodePoint
                : iconCodePoint // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThreatCategoryDataImplCopyWith<$Res>
    implements $ThreatCategoryDataCopyWith<$Res> {
  factory _$$ThreatCategoryDataImplCopyWith(
    _$ThreatCategoryDataImpl value,
    $Res Function(_$ThreatCategoryDataImpl) then,
  ) = __$$ThreatCategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int count, int colorValue, int iconCodePoint});
}

/// @nodoc
class __$$ThreatCategoryDataImplCopyWithImpl<$Res>
    extends _$ThreatCategoryDataCopyWithImpl<$Res, _$ThreatCategoryDataImpl>
    implements _$$ThreatCategoryDataImplCopyWith<$Res> {
  __$$ThreatCategoryDataImplCopyWithImpl(
    _$ThreatCategoryDataImpl _value,
    $Res Function(_$ThreatCategoryDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThreatCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? colorValue = null,
    Object? iconCodePoint = null,
  }) {
    return _then(
      _$ThreatCategoryDataImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        colorValue: null == colorValue
            ? _value.colorValue
            : colorValue // ignore: cast_nullable_to_non_nullable
                  as int,
        iconCodePoint: null == iconCodePoint
            ? _value.iconCodePoint
            : iconCodePoint // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreatCategoryDataImpl implements _ThreatCategoryData {
  const _$ThreatCategoryDataImpl({
    required this.name,
    required this.count,
    required this.colorValue,
    required this.iconCodePoint,
  });

  factory _$ThreatCategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreatCategoryDataImplFromJson(json);

  @override
  final String name;
  @override
  final int count;
  @override
  final int colorValue;
  @override
  final int iconCodePoint;

  @override
  String toString() {
    return 'ThreatCategoryData(name: $name, count: $count, colorValue: $colorValue, iconCodePoint: $iconCodePoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreatCategoryDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, count, colorValue, iconCodePoint);

  /// Create a copy of ThreatCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreatCategoryDataImplCopyWith<_$ThreatCategoryDataImpl> get copyWith =>
      __$$ThreatCategoryDataImplCopyWithImpl<_$ThreatCategoryDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreatCategoryDataImplToJson(this);
  }
}

abstract class _ThreatCategoryData implements ThreatCategoryData {
  const factory _ThreatCategoryData({
    required final String name,
    required final int count,
    required final int colorValue,
    required final int iconCodePoint,
  }) = _$ThreatCategoryDataImpl;

  factory _ThreatCategoryData.fromJson(Map<String, dynamic> json) =
      _$ThreatCategoryDataImpl.fromJson;

  @override
  String get name;
  @override
  int get count;
  @override
  int get colorValue;
  @override
  int get iconCodePoint;

  /// Create a copy of ThreatCategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreatCategoryDataImplCopyWith<_$ThreatCategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThreatTimelinePoint _$ThreatTimelinePointFromJson(Map<String, dynamic> json) {
  return _ThreatTimelinePoint.fromJson(json);
}

/// @nodoc
mixin _$ThreatTimelinePoint {
  DateTime get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this ThreatTimelinePoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreatTimelinePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreatTimelinePointCopyWith<ThreatTimelinePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreatTimelinePointCopyWith<$Res> {
  factory $ThreatTimelinePointCopyWith(
    ThreatTimelinePoint value,
    $Res Function(ThreatTimelinePoint) then,
  ) = _$ThreatTimelinePointCopyWithImpl<$Res, ThreatTimelinePoint>;
  @useResult
  $Res call({DateTime date, int count});
}

/// @nodoc
class _$ThreatTimelinePointCopyWithImpl<$Res, $Val extends ThreatTimelinePoint>
    implements $ThreatTimelinePointCopyWith<$Res> {
  _$ThreatTimelinePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreatTimelinePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? count = null}) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThreatTimelinePointImplCopyWith<$Res>
    implements $ThreatTimelinePointCopyWith<$Res> {
  factory _$$ThreatTimelinePointImplCopyWith(
    _$ThreatTimelinePointImpl value,
    $Res Function(_$ThreatTimelinePointImpl) then,
  ) = __$$ThreatTimelinePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int count});
}

/// @nodoc
class __$$ThreatTimelinePointImplCopyWithImpl<$Res>
    extends _$ThreatTimelinePointCopyWithImpl<$Res, _$ThreatTimelinePointImpl>
    implements _$$ThreatTimelinePointImplCopyWith<$Res> {
  __$$ThreatTimelinePointImplCopyWithImpl(
    _$ThreatTimelinePointImpl _value,
    $Res Function(_$ThreatTimelinePointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThreatTimelinePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? count = null}) {
    return _then(
      _$ThreatTimelinePointImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreatTimelinePointImpl implements _ThreatTimelinePoint {
  const _$ThreatTimelinePointImpl({required this.date, required this.count});

  factory _$ThreatTimelinePointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreatTimelinePointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final int count;

  @override
  String toString() {
    return 'ThreatTimelinePoint(date: $date, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreatTimelinePointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  /// Create a copy of ThreatTimelinePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreatTimelinePointImplCopyWith<_$ThreatTimelinePointImpl> get copyWith =>
      __$$ThreatTimelinePointImplCopyWithImpl<_$ThreatTimelinePointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreatTimelinePointImplToJson(this);
  }
}

abstract class _ThreatTimelinePoint implements ThreatTimelinePoint {
  const factory _ThreatTimelinePoint({
    required final DateTime date,
    required final int count,
  }) = _$ThreatTimelinePointImpl;

  factory _ThreatTimelinePoint.fromJson(Map<String, dynamic> json) =
      _$ThreatTimelinePointImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get count;

  /// Create a copy of ThreatTimelinePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreatTimelinePointImplCopyWith<_$ThreatTimelinePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopThreatData _$TopThreatDataFromJson(Map<String, dynamic> json) {
  return _TopThreatData.fromJson(json);
}

/// @nodoc
mixin _$TopThreatData {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // "high", "critical", etc.
  bool get isIncreasing => throw _privateConstructorUsedError;

  /// Serializes this TopThreatData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopThreatData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopThreatDataCopyWith<TopThreatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopThreatDataCopyWith<$Res> {
  factory $TopThreatDataCopyWith(
    TopThreatData value,
    $Res Function(TopThreatData) then,
  ) = _$TopThreatDataCopyWithImpl<$Res, TopThreatData>;
  @useResult
  $Res call({
    String name,
    String description,
    int count,
    String severity,
    bool isIncreasing,
  });
}

/// @nodoc
class _$TopThreatDataCopyWithImpl<$Res, $Val extends TopThreatData>
    implements $TopThreatDataCopyWith<$Res> {
  _$TopThreatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopThreatData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? count = null,
    Object? severity = null,
    Object? isIncreasing = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String,
            isIncreasing: null == isIncreasing
                ? _value.isIncreasing
                : isIncreasing // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopThreatDataImplCopyWith<$Res>
    implements $TopThreatDataCopyWith<$Res> {
  factory _$$TopThreatDataImplCopyWith(
    _$TopThreatDataImpl value,
    $Res Function(_$TopThreatDataImpl) then,
  ) = __$$TopThreatDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    int count,
    String severity,
    bool isIncreasing,
  });
}

/// @nodoc
class __$$TopThreatDataImplCopyWithImpl<$Res>
    extends _$TopThreatDataCopyWithImpl<$Res, _$TopThreatDataImpl>
    implements _$$TopThreatDataImplCopyWith<$Res> {
  __$$TopThreatDataImplCopyWithImpl(
    _$TopThreatDataImpl _value,
    $Res Function(_$TopThreatDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopThreatData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? count = null,
    Object? severity = null,
    Object? isIncreasing = null,
  }) {
    return _then(
      _$TopThreatDataImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String,
        isIncreasing: null == isIncreasing
            ? _value.isIncreasing
            : isIncreasing // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopThreatDataImpl implements _TopThreatData {
  const _$TopThreatDataImpl({
    required this.name,
    required this.description,
    required this.count,
    required this.severity,
    required this.isIncreasing,
  });

  factory _$TopThreatDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopThreatDataImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final int count;
  @override
  final String severity;
  // "high", "critical", etc.
  @override
  final bool isIncreasing;

  @override
  String toString() {
    return 'TopThreatData(name: $name, description: $description, count: $count, severity: $severity, isIncreasing: $isIncreasing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopThreatDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.isIncreasing, isIncreasing) ||
                other.isIncreasing == isIncreasing));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    count,
    severity,
    isIncreasing,
  );

  /// Create a copy of TopThreatData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopThreatDataImplCopyWith<_$TopThreatDataImpl> get copyWith =>
      __$$TopThreatDataImplCopyWithImpl<_$TopThreatDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopThreatDataImplToJson(this);
  }
}

abstract class _TopThreatData implements TopThreatData {
  const factory _TopThreatData({
    required final String name,
    required final String description,
    required final int count,
    required final String severity,
    required final bool isIncreasing,
  }) = _$TopThreatDataImpl;

  factory _TopThreatData.fromJson(Map<String, dynamic> json) =
      _$TopThreatDataImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  int get count;
  @override
  String get severity; // "high", "critical", etc.
  @override
  bool get isIncreasing;

  /// Create a copy of TopThreatData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopThreatDataImplCopyWith<_$TopThreatDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
