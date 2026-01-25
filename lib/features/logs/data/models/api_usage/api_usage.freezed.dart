// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_usage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiUsage _$ApiUsageFromJson(Map<String, dynamic> json) {
  return _ApiUsage.fromJson(json);
}

/// @nodoc
mixin _$ApiUsage {
  String get deviceId => throw _privateConstructorUsedError;
  String get apiName => throw _privateConstructorUsedError;
  String? get endpoint => throw _privateConstructorUsedError;
  int get requestCount => throw _privateConstructorUsedError;
  double get avgResponseTime => throw _privateConstructorUsedError;
  double get errorRate => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ApiUsage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiUsageCopyWith<ApiUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiUsageCopyWith<$Res> {
  factory $ApiUsageCopyWith(ApiUsage value, $Res Function(ApiUsage) then) =
      _$ApiUsageCopyWithImpl<$Res, ApiUsage>;
  @useResult
  $Res call({
    String deviceId,
    String apiName,
    String? endpoint,
    int requestCount,
    double avgResponseTime,
    double errorRate,
    DateTime timestamp,
  });
}

/// @nodoc
class _$ApiUsageCopyWithImpl<$Res, $Val extends ApiUsage>
    implements $ApiUsageCopyWith<$Res> {
  _$ApiUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? apiName = null,
    Object? endpoint = freezed,
    Object? requestCount = null,
    Object? avgResponseTime = null,
    Object? errorRate = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            apiName: null == apiName
                ? _value.apiName
                : apiName // ignore: cast_nullable_to_non_nullable
                      as String,
            endpoint: freezed == endpoint
                ? _value.endpoint
                : endpoint // ignore: cast_nullable_to_non_nullable
                      as String?,
            requestCount: null == requestCount
                ? _value.requestCount
                : requestCount // ignore: cast_nullable_to_non_nullable
                      as int,
            avgResponseTime: null == avgResponseTime
                ? _value.avgResponseTime
                : avgResponseTime // ignore: cast_nullable_to_non_nullable
                      as double,
            errorRate: null == errorRate
                ? _value.errorRate
                : errorRate // ignore: cast_nullable_to_non_nullable
                      as double,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiUsageImplCopyWith<$Res>
    implements $ApiUsageCopyWith<$Res> {
  factory _$$ApiUsageImplCopyWith(
    _$ApiUsageImpl value,
    $Res Function(_$ApiUsageImpl) then,
  ) = __$$ApiUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String deviceId,
    String apiName,
    String? endpoint,
    int requestCount,
    double avgResponseTime,
    double errorRate,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$ApiUsageImplCopyWithImpl<$Res>
    extends _$ApiUsageCopyWithImpl<$Res, _$ApiUsageImpl>
    implements _$$ApiUsageImplCopyWith<$Res> {
  __$$ApiUsageImplCopyWithImpl(
    _$ApiUsageImpl _value,
    $Res Function(_$ApiUsageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? apiName = null,
    Object? endpoint = freezed,
    Object? requestCount = null,
    Object? avgResponseTime = null,
    Object? errorRate = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$ApiUsageImpl(
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        apiName: null == apiName
            ? _value.apiName
            : apiName // ignore: cast_nullable_to_non_nullable
                  as String,
        endpoint: freezed == endpoint
            ? _value.endpoint
            : endpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestCount: null == requestCount
            ? _value.requestCount
            : requestCount // ignore: cast_nullable_to_non_nullable
                  as int,
        avgResponseTime: null == avgResponseTime
            ? _value.avgResponseTime
            : avgResponseTime // ignore: cast_nullable_to_non_nullable
                  as double,
        errorRate: null == errorRate
            ? _value.errorRate
            : errorRate // ignore: cast_nullable_to_non_nullable
                  as double,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiUsageImpl implements _ApiUsage {
  const _$ApiUsageImpl({
    required this.deviceId,
    required this.apiName,
    this.endpoint,
    required this.requestCount,
    required this.avgResponseTime,
    required this.errorRate,
    required this.timestamp,
  });

  factory _$ApiUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiUsageImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String apiName;
  @override
  final String? endpoint;
  @override
  final int requestCount;
  @override
  final double avgResponseTime;
  @override
  final double errorRate;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ApiUsage(deviceId: $deviceId, apiName: $apiName, endpoint: $endpoint, requestCount: $requestCount, avgResponseTime: $avgResponseTime, errorRate: $errorRate, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiUsageImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.apiName, apiName) || other.apiName == apiName) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.requestCount, requestCount) ||
                other.requestCount == requestCount) &&
            (identical(other.avgResponseTime, avgResponseTime) ||
                other.avgResponseTime == avgResponseTime) &&
            (identical(other.errorRate, errorRate) ||
                other.errorRate == errorRate) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    deviceId,
    apiName,
    endpoint,
    requestCount,
    avgResponseTime,
    errorRate,
    timestamp,
  );

  /// Create a copy of ApiUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiUsageImplCopyWith<_$ApiUsageImpl> get copyWith =>
      __$$ApiUsageImplCopyWithImpl<_$ApiUsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiUsageImplToJson(this);
  }
}

abstract class _ApiUsage implements ApiUsage {
  const factory _ApiUsage({
    required final String deviceId,
    required final String apiName,
    final String? endpoint,
    required final int requestCount,
    required final double avgResponseTime,
    required final double errorRate,
    required final DateTime timestamp,
  }) = _$ApiUsageImpl;

  factory _ApiUsage.fromJson(Map<String, dynamic> json) =
      _$ApiUsageImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get apiName;
  @override
  String? get endpoint;
  @override
  int get requestCount;
  @override
  double get avgResponseTime;
  @override
  double get errorRate;
  @override
  DateTime get timestamp;

  /// Create a copy of ApiUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiUsageImplCopyWith<_$ApiUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
