// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Threat _$ThreatFromJson(Map<String, dynamic> json) {
  return _Threat.fromJson(json);
}

/// @nodoc
mixin _$Threat {
  String get threatId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get riskLevel => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get detectionMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get detectedAt => throw _privateConstructorUsedError;

  /// Serializes this Threat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Threat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreatCopyWith<Threat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreatCopyWith<$Res> {
  factory $ThreatCopyWith(Threat value, $Res Function(Threat) then) =
      _$ThreatCopyWithImpl<$Res, Threat>;
  @useResult
  $Res call({
    String threatId,
    String deviceId,
    String type,
    String riskLevel,
    String description,
    String detectionMethod,
    String status,
    DateTime detectedAt,
  });
}

/// @nodoc
class _$ThreatCopyWithImpl<$Res, $Val extends Threat>
    implements $ThreatCopyWith<$Res> {
  _$ThreatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Threat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? threatId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? riskLevel = null,
    Object? description = null,
    Object? detectionMethod = null,
    Object? status = null,
    Object? detectedAt = null,
  }) {
    return _then(
      _value.copyWith(
            threatId: null == threatId
                ? _value.threatId
                : threatId // ignore: cast_nullable_to_non_nullable
                      as String,
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            detectionMethod: null == detectionMethod
                ? _value.detectionMethod
                : detectionMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            detectedAt: null == detectedAt
                ? _value.detectedAt
                : detectedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThreatImplCopyWith<$Res> implements $ThreatCopyWith<$Res> {
  factory _$$ThreatImplCopyWith(
    _$ThreatImpl value,
    $Res Function(_$ThreatImpl) then,
  ) = __$$ThreatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String threatId,
    String deviceId,
    String type,
    String riskLevel,
    String description,
    String detectionMethod,
    String status,
    DateTime detectedAt,
  });
}

/// @nodoc
class __$$ThreatImplCopyWithImpl<$Res>
    extends _$ThreatCopyWithImpl<$Res, _$ThreatImpl>
    implements _$$ThreatImplCopyWith<$Res> {
  __$$ThreatImplCopyWithImpl(
    _$ThreatImpl _value,
    $Res Function(_$ThreatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Threat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? threatId = null,
    Object? deviceId = null,
    Object? type = null,
    Object? riskLevel = null,
    Object? description = null,
    Object? detectionMethod = null,
    Object? status = null,
    Object? detectedAt = null,
  }) {
    return _then(
      _$ThreatImpl(
        threatId: null == threatId
            ? _value.threatId
            : threatId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        detectionMethod: null == detectionMethod
            ? _value.detectionMethod
            : detectionMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        detectedAt: null == detectedAt
            ? _value.detectedAt
            : detectedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreatImpl implements _Threat {
  const _$ThreatImpl({
    required this.threatId,
    required this.deviceId,
    required this.type,
    required this.riskLevel,
    required this.description,
    required this.detectionMethod,
    required this.status,
    required this.detectedAt,
  });

  factory _$ThreatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreatImplFromJson(json);

  @override
  final String threatId;
  @override
  final String deviceId;
  @override
  final String type;
  @override
  final String riskLevel;
  @override
  final String description;
  @override
  final String detectionMethod;
  @override
  final String status;
  @override
  final DateTime detectedAt;

  @override
  String toString() {
    return 'Threat(threatId: $threatId, deviceId: $deviceId, type: $type, riskLevel: $riskLevel, description: $description, detectionMethod: $detectionMethod, status: $status, detectedAt: $detectedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreatImpl &&
            (identical(other.threatId, threatId) ||
                other.threatId == threatId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.detectionMethod, detectionMethod) ||
                other.detectionMethod == detectionMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detectedAt, detectedAt) ||
                other.detectedAt == detectedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    threatId,
    deviceId,
    type,
    riskLevel,
    description,
    detectionMethod,
    status,
    detectedAt,
  );

  /// Create a copy of Threat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreatImplCopyWith<_$ThreatImpl> get copyWith =>
      __$$ThreatImplCopyWithImpl<_$ThreatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreatImplToJson(this);
  }
}

abstract class _Threat implements Threat {
  const factory _Threat({
    required final String threatId,
    required final String deviceId,
    required final String type,
    required final String riskLevel,
    required final String description,
    required final String detectionMethod,
    required final String status,
    required final DateTime detectedAt,
  }) = _$ThreatImpl;

  factory _Threat.fromJson(Map<String, dynamic> json) = _$ThreatImpl.fromJson;

  @override
  String get threatId;
  @override
  String get deviceId;
  @override
  String get type;
  @override
  String get riskLevel;
  @override
  String get description;
  @override
  String get detectionMethod;
  @override
  String get status;
  @override
  DateTime get detectedAt;

  /// Create a copy of Threat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreatImplCopyWith<_$ThreatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
