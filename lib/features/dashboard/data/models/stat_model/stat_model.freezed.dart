// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StatModel _$StatModelFromJson(Map<String, dynamic> json) {
  return _StatModel.fromJson(json);
}

/// @nodoc
mixin _$StatModel {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get iconCodePoint => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  int get backgroundColorValue => throw _privateConstructorUsedError;

  /// Serializes this StatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatModelCopyWith<StatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatModelCopyWith<$Res> {
  factory $StatModelCopyWith(StatModel value, $Res Function(StatModel) then) =
      _$StatModelCopyWithImpl<$Res, StatModel>;
  @useResult
  $Res call({
    String label,
    String value,
    int iconCodePoint,
    int colorValue,
    int backgroundColorValue,
  });
}

/// @nodoc
class _$StatModelCopyWithImpl<$Res, $Val extends StatModel>
    implements $StatModelCopyWith<$Res> {
  _$StatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? iconCodePoint = null,
    Object? colorValue = null,
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
                      as String,
            iconCodePoint: null == iconCodePoint
                ? _value.iconCodePoint
                : iconCodePoint // ignore: cast_nullable_to_non_nullable
                      as int,
            colorValue: null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$StatModelImplCopyWith<$Res>
    implements $StatModelCopyWith<$Res> {
  factory _$$StatModelImplCopyWith(
    _$StatModelImpl value,
    $Res Function(_$StatModelImpl) then,
  ) = __$$StatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    String value,
    int iconCodePoint,
    int colorValue,
    int backgroundColorValue,
  });
}

/// @nodoc
class __$$StatModelImplCopyWithImpl<$Res>
    extends _$StatModelCopyWithImpl<$Res, _$StatModelImpl>
    implements _$$StatModelImplCopyWith<$Res> {
  __$$StatModelImplCopyWithImpl(
    _$StatModelImpl _value,
    $Res Function(_$StatModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? iconCodePoint = null,
    Object? colorValue = null,
    Object? backgroundColorValue = null,
  }) {
    return _then(
      _$StatModelImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
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
class _$StatModelImpl implements _StatModel {
  const _$StatModelImpl({
    required this.label,
    required this.value,
    required this.iconCodePoint,
    required this.colorValue,
    this.backgroundColorValue = 0xFFFFFFFF,
  });

  factory _$StatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatModelImplFromJson(json);

  @override
  final String label;
  @override
  final String value;
  @override
  final int iconCodePoint;
  @override
  final int colorValue;
  @override
  @JsonKey()
  final int backgroundColorValue;

  @override
  String toString() {
    return 'StatModel(label: $label, value: $value, iconCodePoint: $iconCodePoint, colorValue: $colorValue, backgroundColorValue: $backgroundColorValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconCodePoint, iconCodePoint) ||
                other.iconCodePoint == iconCodePoint) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
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
    backgroundColorValue,
  );

  /// Create a copy of StatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatModelImplCopyWith<_$StatModelImpl> get copyWith =>
      __$$StatModelImplCopyWithImpl<_$StatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatModelImplToJson(this);
  }
}

abstract class _StatModel implements StatModel {
  const factory _StatModel({
    required final String label,
    required final String value,
    required final int iconCodePoint,
    required final int colorValue,
    final int backgroundColorValue,
  }) = _$StatModelImpl;

  factory _StatModel.fromJson(Map<String, dynamic> json) =
      _$StatModelImpl.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  int get iconCodePoint;
  @override
  int get colorValue;
  @override
  int get backgroundColorValue;

  /// Create a copy of StatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatModelImplCopyWith<_$StatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
