// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SystemLogModel _$SystemLogModelFromJson(Map<String, dynamic> json) {
  return _SystemLogModel.fromJson(json);
}

/// @nodoc
mixin _$SystemLogModel {
  DateTime get timestamp => throw _privateConstructorUsedError;
  LogLevel get level => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  /// Serializes this SystemLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemLogModelCopyWith<SystemLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemLogModelCopyWith<$Res> {
  factory $SystemLogModelCopyWith(
    SystemLogModel value,
    $Res Function(SystemLogModel) then,
  ) = _$SystemLogModelCopyWithImpl<$Res, SystemLogModel>;
  @useResult
  $Res call({
    DateTime timestamp,
    LogLevel level,
    String message,
    String source,
  });
}

/// @nodoc
class _$SystemLogModelCopyWithImpl<$Res, $Val extends SystemLogModel>
    implements $SystemLogModelCopyWith<$Res> {
  _$SystemLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? level = null,
    Object? message = null,
    Object? source = null,
  }) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as LogLevel,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SystemLogModelImplCopyWith<$Res>
    implements $SystemLogModelCopyWith<$Res> {
  factory _$$SystemLogModelImplCopyWith(
    _$SystemLogModelImpl value,
    $Res Function(_$SystemLogModelImpl) then,
  ) = __$$SystemLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime timestamp,
    LogLevel level,
    String message,
    String source,
  });
}

/// @nodoc
class __$$SystemLogModelImplCopyWithImpl<$Res>
    extends _$SystemLogModelCopyWithImpl<$Res, _$SystemLogModelImpl>
    implements _$$SystemLogModelImplCopyWith<$Res> {
  __$$SystemLogModelImplCopyWithImpl(
    _$SystemLogModelImpl _value,
    $Res Function(_$SystemLogModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? level = null,
    Object? message = null,
    Object? source = null,
  }) {
    return _then(
      _$SystemLogModelImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as LogLevel,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemLogModelImpl implements _SystemLogModel {
  const _$SystemLogModelImpl({
    required this.timestamp,
    required this.level,
    required this.message,
    required this.source,
  });

  factory _$SystemLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemLogModelImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final LogLevel level;
  @override
  final String message;
  @override
  final String source;

  @override
  String toString() {
    return 'SystemLogModel(timestamp: $timestamp, level: $level, message: $message, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemLogModelImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, level, message, source);

  /// Create a copy of SystemLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemLogModelImplCopyWith<_$SystemLogModelImpl> get copyWith =>
      __$$SystemLogModelImplCopyWithImpl<_$SystemLogModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemLogModelImplToJson(this);
  }
}

abstract class _SystemLogModel implements SystemLogModel {
  const factory _SystemLogModel({
    required final DateTime timestamp,
    required final LogLevel level,
    required final String message,
    required final String source,
  }) = _$SystemLogModelImpl;

  factory _SystemLogModel.fromJson(Map<String, dynamic> json) =
      _$SystemLogModelImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  LogLevel get level;
  @override
  String get message;
  @override
  String get source;

  /// Create a copy of SystemLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemLogModelImplCopyWith<_$SystemLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
