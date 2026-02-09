// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traffic_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TrafficLogModel _$TrafficLogModelFromJson(Map<String, dynamic> json) {
  return _TrafficLogModel.fromJson(json);
}

/// @nodoc
mixin _$TrafficLogModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get sourceIp => throw _privateConstructorUsedError;
  String get destinationIp => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  int get bytesTransferred => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this TrafficLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrafficLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrafficLogModelCopyWith<TrafficLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrafficLogModelCopyWith<$Res> {
  factory $TrafficLogModelCopyWith(
    TrafficLogModel value,
    $Res Function(TrafficLogModel) then,
  ) = _$TrafficLogModelCopyWithImpl<$Res, TrafficLogModel>;
  @useResult
  $Res call({
    String id,
    DateTime timestamp,
    String sourceIp,
    String destinationIp,
    int port,
    String protocol,
    int bytesTransferred,
    String status,
  });
}

/// @nodoc
class _$TrafficLogModelCopyWithImpl<$Res, $Val extends TrafficLogModel>
    implements $TrafficLogModelCopyWith<$Res> {
  _$TrafficLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrafficLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? sourceIp = null,
    Object? destinationIp = null,
    Object? port = null,
    Object? protocol = null,
    Object? bytesTransferred = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            sourceIp: null == sourceIp
                ? _value.sourceIp
                : sourceIp // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationIp: null == destinationIp
                ? _value.destinationIp
                : destinationIp // ignore: cast_nullable_to_non_nullable
                      as String,
            port: null == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as int,
            protocol: null == protocol
                ? _value.protocol
                : protocol // ignore: cast_nullable_to_non_nullable
                      as String,
            bytesTransferred: null == bytesTransferred
                ? _value.bytesTransferred
                : bytesTransferred // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrafficLogModelImplCopyWith<$Res>
    implements $TrafficLogModelCopyWith<$Res> {
  factory _$$TrafficLogModelImplCopyWith(
    _$TrafficLogModelImpl value,
    $Res Function(_$TrafficLogModelImpl) then,
  ) = __$$TrafficLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime timestamp,
    String sourceIp,
    String destinationIp,
    int port,
    String protocol,
    int bytesTransferred,
    String status,
  });
}

/// @nodoc
class __$$TrafficLogModelImplCopyWithImpl<$Res>
    extends _$TrafficLogModelCopyWithImpl<$Res, _$TrafficLogModelImpl>
    implements _$$TrafficLogModelImplCopyWith<$Res> {
  __$$TrafficLogModelImplCopyWithImpl(
    _$TrafficLogModelImpl _value,
    $Res Function(_$TrafficLogModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrafficLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? sourceIp = null,
    Object? destinationIp = null,
    Object? port = null,
    Object? protocol = null,
    Object? bytesTransferred = null,
    Object? status = null,
  }) {
    return _then(
      _$TrafficLogModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sourceIp: null == sourceIp
            ? _value.sourceIp
            : sourceIp // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationIp: null == destinationIp
            ? _value.destinationIp
            : destinationIp // ignore: cast_nullable_to_non_nullable
                  as String,
        port: null == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as int,
        protocol: null == protocol
            ? _value.protocol
            : protocol // ignore: cast_nullable_to_non_nullable
                  as String,
        bytesTransferred: null == bytesTransferred
            ? _value.bytesTransferred
            : bytesTransferred // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrafficLogModelImpl implements _TrafficLogModel {
  const _$TrafficLogModelImpl({
    required this.id,
    required this.timestamp,
    required this.sourceIp,
    required this.destinationIp,
    required this.port,
    required this.protocol,
    required this.bytesTransferred,
    required this.status,
  });

  factory _$TrafficLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrafficLogModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final String sourceIp;
  @override
  final String destinationIp;
  @override
  final int port;
  @override
  final String protocol;
  @override
  final int bytesTransferred;
  @override
  final String status;

  @override
  String toString() {
    return 'TrafficLogModel(id: $id, timestamp: $timestamp, sourceIp: $sourceIp, destinationIp: $destinationIp, port: $port, protocol: $protocol, bytesTransferred: $bytesTransferred, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrafficLogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sourceIp, sourceIp) ||
                other.sourceIp == sourceIp) &&
            (identical(other.destinationIp, destinationIp) ||
                other.destinationIp == destinationIp) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.bytesTransferred, bytesTransferred) ||
                other.bytesTransferred == bytesTransferred) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    timestamp,
    sourceIp,
    destinationIp,
    port,
    protocol,
    bytesTransferred,
    status,
  );

  /// Create a copy of TrafficLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrafficLogModelImplCopyWith<_$TrafficLogModelImpl> get copyWith =>
      __$$TrafficLogModelImplCopyWithImpl<_$TrafficLogModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TrafficLogModelImplToJson(this);
  }
}

abstract class _TrafficLogModel implements TrafficLogModel {
  const factory _TrafficLogModel({
    required final String id,
    required final DateTime timestamp,
    required final String sourceIp,
    required final String destinationIp,
    required final int port,
    required final String protocol,
    required final int bytesTransferred,
    required final String status,
  }) = _$TrafficLogModelImpl;

  factory _TrafficLogModel.fromJson(Map<String, dynamic> json) =
      _$TrafficLogModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  String get sourceIp;
  @override
  String get destinationIp;
  @override
  int get port;
  @override
  String get protocol;
  @override
  int get bytesTransferred;
  @override
  String get status;

  /// Create a copy of TrafficLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrafficLogModelImplCopyWith<_$TrafficLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
