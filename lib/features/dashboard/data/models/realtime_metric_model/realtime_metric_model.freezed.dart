// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_metric_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RealtimeMetricModel _$RealtimeMetricModelFromJson(Map<String, dynamic> json) {
  return _RealtimeMetricModel.fromJson(json);
}

/// @nodoc
mixin _$RealtimeMetricModel {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  int get iconCodePoint => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  bool get isIncreasing => throw _privateConstructorUsedError;
  double get changeAmount => throw _privateConstructorUsedError;
  int get backgroundColorValue => throw _privateConstructorUsedError;

  /// Serializes this RealtimeMetricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RealtimeMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RealtimeMetricModelCopyWith<RealtimeMetricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealtimeMetricModelCopyWith<$Res> {
  factory $RealtimeMetricModelCopyWith(
    RealtimeMetricModel value,
    $Res Function(RealtimeMetricModel) then,
  ) = _$RealtimeMetricModelCopyWithImpl<$Res, RealtimeMetricModel>;
  @useResult
  $Res call({
    String label,
    double value,
    int iconCodePoint,
    int colorValue,
    bool isIncreasing,
    double changeAmount,
    int backgroundColorValue,
  });
}

/// @nodoc
class _$RealtimeMetricModelCopyWithImpl<$Res, $Val extends RealtimeMetricModel>
    implements $RealtimeMetricModelCopyWith<$Res> {
  _$RealtimeMetricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealtimeMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? iconCodePoint = null,
    Object? colorValue = null,
    Object? isIncreasing = null,
    Object? changeAmount = null,
    Object? backgroundColorValue = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            iconCodePoint: null == iconCodePoint
                ? _value.iconCodePoint
                : iconCodePoint // ignore: cast_nullable_to_non_nullable
                      as int,
            colorValue: null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                      as int,
            isIncreasing: null == isIncreasing
                ? _value.isIncreasing
                : isIncreasing // ignore: cast_nullable_to_non_nullable
                      as bool,
            changeAmount: null == changeAmount
                ? _value.changeAmount
                : changeAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            backgroundColorValue: null == backgroundColorValue
                ? _value.backgroundColorValue
                : backgroundColorValue // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RealtimeMetricModelImplCopyWith<$Res>
    implements $RealtimeMetricModelCopyWith<$Res> {
  factory _$$RealtimeMetricModelImplCopyWith(
    _$RealtimeMetricModelImpl value,
    $Res Function(_$RealtimeMetricModelImpl) then,
  ) = __$$RealtimeMetricModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    double value,
    int iconCodePoint,
    int colorValue,
    bool isIncreasing,
    double changeAmount,
    int backgroundColorValue,
  });
}

/// @nodoc
class __$$RealtimeMetricModelImplCopyWithImpl<$Res>
    extends _$RealtimeMetricModelCopyWithImpl<$Res, _$RealtimeMetricModelImpl>
    implements _$$RealtimeMetricModelImplCopyWith<$Res> {
  __$$RealtimeMetricModelImplCopyWithImpl(
    _$RealtimeMetricModelImpl _value,
    $Res Function(_$RealtimeMetricModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealtimeMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? iconCodePoint = null,
    Object? colorValue = null,
    Object? isIncreasing = null,
    Object? changeAmount = null,
    Object? backgroundColorValue = null,
  }) {
    return _then(
      _$RealtimeMetricModelImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        iconCodePoint: null == iconCodePoint
            ? _value.iconCodePoint
            : iconCodePoint // ignore: cast_nullable_to_non_nullable
                  as int,
        colorValue: null == colorValue
            ? _value.colorValue
            : colorValue // ignore: cast_nullable_to_non_nullable
                  as int,
        isIncreasing: null == isIncreasing
            ? _value.isIncreasing
            : isIncreasing // ignore: cast_nullable_to_non_nullable
                  as bool,
        changeAmount: null == changeAmount
            ? _value.changeAmount
            : changeAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        backgroundColorValue: null == backgroundColorValue
            ? _value.backgroundColorValue
            : backgroundColorValue // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RealtimeMetricModelImpl implements _RealtimeMetricModel {
  const _$RealtimeMetricModelImpl({
    required this.label,
    required this.value,
    required this.iconCodePoint,
    required this.colorValue,
    this.isIncreasing = true,
    this.changeAmount = 0,
    this.backgroundColorValue = 0xFFFFFFFF,
  });

  factory _$RealtimeMetricModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealtimeMetricModelImplFromJson(json);

  @override
  final String label;
  @override
  final double value;
  @override
  final int iconCodePoint;
  @override
  final int colorValue;
  @override
  @JsonKey()
  final bool isIncreasing;
  @override
  @JsonKey()
  final double changeAmount;
  @override
  @JsonKey()
  final int backgroundColorValue;

  @override
  String toString() {
    return 'RealtimeMetricModel(label: $label, value: $value, iconCodePoint: $iconCodePoint, colorValue: $colorValue, isIncreasing: $isIncreasing, changeAmount: $changeAmount, backgroundColorValue: $backgroundColorValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealtimeMetricModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.isIncreasing, isIncreasing) ||
                other.isIncreasing == isIncreasing) &&
            (identical(other.changeAmount, changeAmount) ||
                other.changeAmount == changeAmount) &&
            (identical(other.backgroundColorValue, backgroundColorValue) ||
                other.backgroundColorValue == backgroundColorValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    value,
    iconCodePoint,
    colorValue,
    isIncreasing,
    changeAmount,
    backgroundColorValue,
  );

  /// Create a copy of RealtimeMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealtimeMetricModelImplCopyWith<_$RealtimeMetricModelImpl> get copyWith =>
      __$$RealtimeMetricModelImplCopyWithImpl<_$RealtimeMetricModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RealtimeMetricModelImplToJson(this);
  }
}

abstract class _RealtimeMetricModel implements RealtimeMetricModel {
  const factory _RealtimeMetricModel({
    required final String label,
    required final double value,
    required final int iconCodePoint,
    required final int colorValue,
    final bool isIncreasing,
    final double changeAmount,
    final int backgroundColorValue,
  }) = _$RealtimeMetricModelImpl;

  factory _RealtimeMetricModel.fromJson(Map<String, dynamic> json) =
      _$RealtimeMetricModelImpl.fromJson;

  @override
  String get label;
  @override
  double get value;
  @override
  int get iconCodePoint;
  @override
  int get colorValue;
  @override
  bool get isIncreasing;
  @override
  double get changeAmount;
  @override
  int get backgroundColorValue;

  /// Create a copy of RealtimeMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealtimeMetricModelImplCopyWith<_$RealtimeMetricModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
