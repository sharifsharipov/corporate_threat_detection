// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DetectionMethod _$DetectionMethodFromJson(Map<String, dynamic> json) {
  return _DetectionMethod.fromJson(json);
}

/// @nodoc
mixin _$DetectionMethod {
  String get methodId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // signature, anomaly, behavior, rule
  String get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DetectionMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectionMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionMethodCopyWith<DetectionMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionMethodCopyWith<$Res> {
  factory $DetectionMethodCopyWith(
    DetectionMethod value,
    $Res Function(DetectionMethod) then,
  ) = _$DetectionMethodCopyWithImpl<$Res, DetectionMethod>;
  @useResult
  $Res call({
    String methodId,
    String name,
    String type,
    String description,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$DetectionMethodCopyWithImpl<$Res, $Val extends DetectionMethod>
    implements $DetectionMethodCopyWith<$Res> {
  _$DetectionMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodId = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            methodId: null == methodId
                ? _value.methodId
                : methodId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetectionMethodImplCopyWith<$Res>
    implements $DetectionMethodCopyWith<$Res> {
  factory _$$DetectionMethodImplCopyWith(
    _$DetectionMethodImpl value,
    $Res Function(_$DetectionMethodImpl) then,
  ) = __$$DetectionMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String methodId,
    String name,
    String type,
    String description,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$DetectionMethodImplCopyWithImpl<$Res>
    extends _$DetectionMethodCopyWithImpl<$Res, _$DetectionMethodImpl>
    implements _$$DetectionMethodImplCopyWith<$Res> {
  __$$DetectionMethodImplCopyWithImpl(
    _$DetectionMethodImpl _value,
    $Res Function(_$DetectionMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetectionMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? methodId = null,
    Object? name = null,
    Object? type = null,
    Object? description = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$DetectionMethodImpl(
        methodId: null == methodId
            ? _value.methodId
            : methodId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectionMethodImpl implements _DetectionMethod {
  const _$DetectionMethodImpl({
    required this.methodId,
    required this.name,
    required this.type,
    required this.description,
    this.createdAt,
  });

  factory _$DetectionMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectionMethodImplFromJson(json);

  @override
  final String methodId;
  @override
  final String name;
  @override
  final String type;
  // signature, anomaly, behavior, rule
  @override
  final String description;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DetectionMethod(methodId: $methodId, name: $name, type: $type, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionMethodImpl &&
            (identical(other.methodId, methodId) ||
                other.methodId == methodId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, methodId, name, type, description, createdAt);

  /// Create a copy of DetectionMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionMethodImplCopyWith<_$DetectionMethodImpl> get copyWith =>
      __$$DetectionMethodImplCopyWithImpl<_$DetectionMethodImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectionMethodImplToJson(this);
  }
}

abstract class _DetectionMethod implements DetectionMethod {
  const factory _DetectionMethod({
    required final String methodId,
    required final String name,
    required final String type,
    required final String description,
    final DateTime? createdAt,
  }) = _$DetectionMethodImpl;

  factory _DetectionMethod.fromJson(Map<String, dynamic> json) =
      _$DetectionMethodImpl.fromJson;

  @override
  String get methodId;
  @override
  String get name;
  @override
  String get type; // signature, anomaly, behavior, rule
  @override
  String get description;
  @override
  DateTime? get createdAt;

  /// Create a copy of DetectionMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionMethodImplCopyWith<_$DetectionMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
