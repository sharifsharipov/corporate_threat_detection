// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traffic_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TrafficLog _$TrafficLogFromJson(Map<String, dynamic> json) {
  return _TrafficLog.fromJson(json);
}

/// @nodoc
mixin _$TrafficLog {
  String get deviceId => throw _privateConstructorUsedError;
  String get sourceIp => throw _privateConstructorUsedError;
  String get destinationIp => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  int get packetSize => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get apiUsed => throw _privateConstructorUsedError;

  /// Serializes this TrafficLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrafficLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrafficLogCopyWith<TrafficLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrafficLogCopyWith<$Res> {
  factory $TrafficLogCopyWith(
    TrafficLog value,
    $Res Function(TrafficLog) then,
  ) = _$TrafficLogCopyWithImpl<$Res, TrafficLog>;
  @useResult
  $Res call({
    String deviceId,
    String sourceIp,
    String destinationIp,
    String protocol,
    int port,
    int packetSize,
    DateTime timestamp,
    String? apiUsed,
  });
}

/// @nodoc
class _$TrafficLogCopyWithImpl<$Res, $Val extends TrafficLog>
    implements $TrafficLogCopyWith<$Res> {
  _$TrafficLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrafficLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? sourceIp = null,
    Object? destinationIp = null,
    Object? protocol = null,
    Object? port = null,
    Object? packetSize = null,
    Object? timestamp = null,
    Object? apiUsed = freezed,
  }) {
    return _then(
      _value.copyWith(
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceIp: null == sourceIp
                ? _value.sourceIp
                : sourceIp // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationIp: null == destinationIp
                ? _value.destinationIp
                : destinationIp // ignore: cast_nullable_to_non_nullable
                      as String,
            protocol: null == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                      as String,
            port: null == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as int,
            packetSize: null == packetSize
                ? _value.packetSize
                : packetSize // ignore: cast_nullable_to_non_nullable
                      as int,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            apiUsed: freezed == apiUsed
                ? _value.apiUsed
                : apiUsed // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrafficLogImplCopyWith<$Res>
    implements $TrafficLogCopyWith<$Res> {
  factory _$$TrafficLogImplCopyWith(
    _$TrafficLogImpl value,
    $Res Function(_$TrafficLogImpl) then,
  ) = __$$TrafficLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String deviceId,
    String sourceIp,
    String destinationIp,
    String protocol,
    int port,
    int packetSize,
    DateTime timestamp,
    String? apiUsed,
  });
}

/// @nodoc
class __$$TrafficLogImplCopyWithImpl<$Res>
    extends _$TrafficLogCopyWithImpl<$Res, _$TrafficLogImpl>
    implements _$$TrafficLogImplCopyWith<$Res> {
  __$$TrafficLogImplCopyWithImpl(
    _$TrafficLogImpl _value,
    $Res Function(_$TrafficLogImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrafficLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? sourceIp = null,
    Object? destinationIp = null,
    Object? protocol = null,
    Object? port = null,
    Object? packetSize = null,
    Object? timestamp = null,
    Object? apiUsed = freezed,
  }) {
    return _then(
      _$TrafficLogImpl(
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceIp: null == sourceIp
            ? _value.sourceIp
            : sourceIp // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationIp: null == destinationIp
            ? _value.destinationIp
            : destinationIp // ignore: cast_nullable_to_non_nullable
                  as String,
        protocol: null == protocol
            ? _value.protocol
            : protocol // ignore: cast_nullable_to_non_nullable
                  as String,
        port: null == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as int,
        packetSize: null == packetSize
            ? _value.packetSize
            : packetSize // ignore: cast_nullable_to_non_nullable
                  as int,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        apiUsed: freezed == apiUsed
            ? _value.apiUsed
            : apiUsed // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrafficLogImpl implements _TrafficLog {
  const _$TrafficLogImpl({
    required this.deviceId,
    required this.sourceIp,
    required this.destinationIp,
    required this.protocol,
    required this.port,
    required this.packetSize,
    required this.timestamp,
    this.apiUsed,
  });

  factory _$TrafficLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrafficLogImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String sourceIp;
  @override
  final String destinationIp;
  @override
  final String protocol;
  @override
  final int port;
  @override
  final int packetSize;
  @override
  final DateTime timestamp;
  @override
  final String? apiUsed;

  @override
  String toString() {
    return 'TrafficLog(deviceId: $deviceId, sourceIp: $sourceIp, destinationIp: $destinationIp, protocol: $protocol, port: $port, packetSize: $packetSize, timestamp: $timestamp, apiUsed: $apiUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrafficLogImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.sourceIp, sourceIp) ||
                other.sourceIp == sourceIp) &&
            (identical(other.destinationIp, destinationIp) ||
                other.destinationIp == destinationIp) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.packetSize, packetSize) ||
                other.packetSize == packetSize) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.apiUsed, apiUsed) || other.apiUsed == apiUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    deviceId,
    sourceIp,
    destinationIp,
    protocol,
    port,
    packetSize,
    timestamp,
    apiUsed,
  );

  /// Create a copy of TrafficLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrafficLogImplCopyWith<_$TrafficLogImpl> get copyWith =>
      __$$TrafficLogImplCopyWithImpl<_$TrafficLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrafficLogImplToJson(this);
  }
}

abstract class _TrafficLog implements TrafficLog {
  const factory _TrafficLog({
    required final String deviceId,
    required final String sourceIp,
    required final String destinationIp,
    required final String protocol,
    required final int port,
    required final int packetSize,
    required final DateTime timestamp,
    final String? apiUsed,
  }) = _$TrafficLogImpl;

  factory _TrafficLog.fromJson(Map<String, dynamic> json) =
      _$TrafficLogImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get sourceIp;
  @override
  String get destinationIp;
  @override
  String get protocol;
  @override
  int get port;
  @override
  int get packetSize;
  @override
  DateTime get timestamp;
  @override
  String? get apiUsed;

  /// Create a copy of TrafficLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrafficLogImplCopyWith<_$TrafficLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
