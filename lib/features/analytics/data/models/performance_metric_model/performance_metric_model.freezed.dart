// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_metric_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PerformanceMetricModel _$PerformanceMetricModelFromJson(
  Map<String, dynamic> json,
) {
  return _PerformanceMetricModel.fromJson(json);
}

/// @nodoc
mixin _$PerformanceMetricModel {
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get iconCodePoint => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  double get changePercentage => throw _privateConstructorUsedError;
  bool get isIncrease => throw _privateConstructorUsedError;

  /// Serializes this PerformanceMetricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceMetricModelCopyWith<PerformanceMetricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceMetricModelCopyWith<$Res> {
  factory $PerformanceMetricModelCopyWith(
    PerformanceMetricModel value,
    $Res Function(PerformanceMetricModel) then,
  ) = _$PerformanceMetricModelCopyWithImpl<$Res, PerformanceMetricModel>;
  @useResult
  $Res call({
    String title,
    String value,
    int iconCodePoint,
    int colorValue,
    double changePercentage,
    bool isIncrease,
  });
}

/// @nodoc
class _$PerformanceMetricModelCopyWithImpl<
  $Res,
  $Val extends PerformanceMetricModel
>
    implements $PerformanceMetricModelCopyWith<$Res> {
  _$PerformanceMetricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? iconCodePoint = null,
    Object? colorValue = null,
    Object? changePercentage = null,
    Object? isIncrease = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            iconCodePoint: null == iconCodePoint
                ? _value.iconCodePoint
                : iconCodePoint // ignore: cast_nullable_to_non_nullable
                      as int,
            colorValue: null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                      as int,
            changePercentage: null == changePercentage
                ? _value.changePercentage
                : changePercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            isIncrease: null == isIncrease
                ? _value.isIncrease
                : isIncrease // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PerformanceMetricModelImplCopyWith<$Res>
    implements $PerformanceMetricModelCopyWith<$Res> {
  factory _$$PerformanceMetricModelImplCopyWith(
    _$PerformanceMetricModelImpl value,
    $Res Function(_$PerformanceMetricModelImpl) then,
  ) = __$$PerformanceMetricModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String value,
    int iconCodePoint,
    int colorValue,
    double changePercentage,
    bool isIncrease,
  });
}

/// @nodoc
class __$$PerformanceMetricModelImplCopyWithImpl<$Res>
    extends
        _$PerformanceMetricModelCopyWithImpl<$Res, _$PerformanceMetricModelImpl>
    implements _$$PerformanceMetricModelImplCopyWith<$Res> {
  __$$PerformanceMetricModelImplCopyWithImpl(
    _$PerformanceMetricModelImpl _value,
    $Res Function(_$PerformanceMetricModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? iconCodePoint = null,
    Object? colorValue = null,
    Object? changePercentage = null,
    Object? isIncrease = null,
  }) {
    return _then(
      _$PerformanceMetricModelImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        iconCodePoint: null == iconCodePoint
            ? _value.iconCodePoint
            : iconCodePoint // ignore: cast_nullable_to_non_nullable
                  as int,
        colorValue: null == colorValue
            ? _value.colorValue
            : colorValue // ignore: cast_nullable_to_non_nullable
                  as int,
        changePercentage: null == changePercentage
            ? _value.changePercentage
            : changePercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        isIncrease: null == isIncrease
            ? _value.isIncrease
            : isIncrease // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceMetricModelImpl implements _PerformanceMetricModel {
  const _$PerformanceMetricModelImpl({
    required this.title,
    required this.value,
    required this.iconCodePoint,
    required this.colorValue,
    required this.changePercentage,
    this.isIncrease = true,
  });

  factory _$PerformanceMetricModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceMetricModelImplFromJson(json);

  @override
  final String title;
  @override
  final String value;
  @override
  final int iconCodePoint;
  @override
  final int colorValue;
  @override
  final double changePercentage;
  @override
  @JsonKey()
  final bool isIncrease;

  @override
  String toString() {
    return 'PerformanceMetricModel(title: $title, value: $value, iconCodePoint: $iconCodePoint, colorValue: $colorValue, changePercentage: $changePercentage, isIncrease: $isIncrease)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceMetricModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.changePercentage, changePercentage) ||
                other.changePercentage == changePercentage) &&
            (identical(other.isIncrease, isIncrease) ||
                other.isIncrease == isIncrease));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    value,
    iconCodePoint,
    colorValue,
    changePercentage,
    isIncrease,
  );

  /// Create a copy of PerformanceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceMetricModelImplCopyWith<_$PerformanceMetricModelImpl>
  get copyWith =>
      __$$PerformanceMetricModelImplCopyWithImpl<_$PerformanceMetricModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceMetricModelImplToJson(this);
  }
}

abstract class _PerformanceMetricModel implements PerformanceMetricModel {
  const factory _PerformanceMetricModel({
    required final String title,
    required final String value,
    required final int iconCodePoint,
    required final int colorValue,
    required final double changePercentage,
    final bool isIncrease,
  }) = _$PerformanceMetricModelImpl;

  factory _PerformanceMetricModel.fromJson(Map<String, dynamic> json) =
      _$PerformanceMetricModelImpl.fromJson;

  @override
  String get title;
  @override
  String get value;
  @override
  int get iconCodePoint;
  @override
  int get colorValue;
  @override
  double get changePercentage;
  @override
  bool get isIncrease;

  /// Create a copy of PerformanceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceMetricModelImplCopyWith<_$PerformanceMetricModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
