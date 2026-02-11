// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NetworkDeviceModel _$NetworkDeviceModelFromJson(Map<String, dynamic> json) {
  return _NetworkDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$NetworkDeviceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  String get macAddress => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // e.g., "Server", "Workstation", "IoT"
  DeviceStatus get status => throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;
  String get osVersion => throw _privateConstructorUsedError;

  /// Serializes this NetworkDeviceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NetworkDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkDeviceModelCopyWith<NetworkDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkDeviceModelCopyWith<$Res> {
  factory $NetworkDeviceModelCopyWith(
    NetworkDeviceModel value,
    $Res Function(NetworkDeviceModel) then,
  ) = _$NetworkDeviceModelCopyWithImpl<$Res, NetworkDeviceModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String ipAddress,
    String macAddress,
    String type,
    DeviceStatus status,
    DateTime lastSeen,
    String osVersion,
  });
}

/// @nodoc
class _$NetworkDeviceModelCopyWithImpl<$Res, $Val extends NetworkDeviceModel>
    implements $NetworkDeviceModelCopyWith<$Res> {
  _$NetworkDeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ipAddress = null,
    Object? macAddress = null,
    Object? type = null,
    Object? status = null,
    Object? lastSeen = null,
    Object? osVersion = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            ipAddress: null == ipAddress
                ? _value.ipAddress
                : ipAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            macAddress: null == macAddress
                ? _value.macAddress
                : macAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DeviceStatus,
            lastSeen: null == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            osVersion: null == osVersion
                ? _value.osVersion
                : osVersion // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkDeviceModelImplCopyWith<$Res>
    implements $NetworkDeviceModelCopyWith<$Res> {
  factory _$$NetworkDeviceModelImplCopyWith(
    _$NetworkDeviceModelImpl value,
    $Res Function(_$NetworkDeviceModelImpl) then,
  ) = __$$NetworkDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String ipAddress,
    String macAddress,
    String type,
    DeviceStatus status,
    DateTime lastSeen,
    String osVersion,
  });
}

/// @nodoc
class __$$NetworkDeviceModelImplCopyWithImpl<$Res>
    extends _$NetworkDeviceModelCopyWithImpl<$Res, _$NetworkDeviceModelImpl>
    implements _$$NetworkDeviceModelImplCopyWith<$Res> {
  __$$NetworkDeviceModelImplCopyWithImpl(
    _$NetworkDeviceModelImpl _value,
    $Res Function(_$NetworkDeviceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NetworkDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ipAddress = null,
    Object? macAddress = null,
    Object? type = null,
    Object? status = null,
    Object? lastSeen = null,
    Object? osVersion = null,
  }) {
    return _then(
      _$NetworkDeviceModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        ipAddress: null == ipAddress
            ? _value.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        macAddress: null == macAddress
            ? _value.macAddress
            : macAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DeviceStatus,
        lastSeen: null == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        osVersion: null == osVersion
            ? _value.osVersion
            : osVersion // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkDeviceModelImpl implements _NetworkDeviceModel {
  const _$NetworkDeviceModelImpl({
    required this.id,
    required this.name,
    required this.ipAddress,
    required this.macAddress,
    required this.type,
    required this.status,
    required this.lastSeen,
    required this.osVersion,
  });

  factory _$NetworkDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkDeviceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String ipAddress;
  @override
  final String macAddress;
  @override
  final String type;
  // e.g., "Server", "Workstation", "IoT"
  @override
  final DeviceStatus status;
  @override
  final DateTime lastSeen;
  @override
  final String osVersion;

  @override
  String toString() {
    return 'NetworkDeviceModel(id: $id, name: $name, ipAddress: $ipAddress, macAddress: $macAddress, type: $type, status: $status, lastSeen: $lastSeen, osVersion: $osVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkDeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    ipAddress,
    macAddress,
    type,
    status,
    lastSeen,
    osVersion,
  );

  /// Create a copy of NetworkDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkDeviceModelImplCopyWith<_$NetworkDeviceModelImpl> get copyWith =>
      __$$NetworkDeviceModelImplCopyWithImpl<_$NetworkDeviceModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkDeviceModelImplToJson(this);
  }
}

abstract class _NetworkDeviceModel implements NetworkDeviceModel {
  const factory _NetworkDeviceModel({
    required final String id,
    required final String name,
    required final String ipAddress,
    required final String macAddress,
    required final String type,
    required final DeviceStatus status,
    required final DateTime lastSeen,
    required final String osVersion,
  }) = _$NetworkDeviceModelImpl;

  factory _NetworkDeviceModel.fromJson(Map<String, dynamic> json) =
      _$NetworkDeviceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get ipAddress;
  @override
  String get macAddress;
  @override
  String get type; // e.g., "Server", "Workstation", "IoT"
  @override
  DeviceStatus get status;
  @override
  DateTime get lastSeen;
  @override
  String get osVersion;

  /// Create a copy of NetworkDeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkDeviceModelImplCopyWith<_$NetworkDeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
