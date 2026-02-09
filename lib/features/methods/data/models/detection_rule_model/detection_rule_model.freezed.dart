// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DetectionRuleModel _$DetectionRuleModelFromJson(Map<String, dynamic> json) {
  return _DetectionRuleModel.fromJson(json);
}

/// @nodoc
mixin _$DetectionRuleModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get condition =>
      throw _privateConstructorUsedError; // e.g. "traffic > 100MB"
  String get action => throw _privateConstructorUsedError; // e.g. "block_ip"
  bool get isEnabled => throw _privateConstructorUsedError;
  DateTime? get lastTriggered => throw _privateConstructorUsedError;

  /// Serializes this DetectionRuleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectionRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionRuleModelCopyWith<DetectionRuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionRuleModelCopyWith<$Res> {
  factory $DetectionRuleModelCopyWith(
    DetectionRuleModel value,
    $Res Function(DetectionRuleModel) then,
  ) = _$DetectionRuleModelCopyWithImpl<$Res, DetectionRuleModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String condition,
    String action,
    bool isEnabled,
    DateTime? lastTriggered,
  });
}

/// @nodoc
class _$DetectionRuleModelCopyWithImpl<$Res, $Val extends DetectionRuleModel>
    implements $DetectionRuleModelCopyWith<$Res> {
  _$DetectionRuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? condition = null,
    Object? action = null,
    Object? isEnabled = null,
    Object? lastTriggered = freezed,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            isEnabled: null == isEnabled
                ? _value.isEnabled
                : isEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastTriggered: freezed == lastTriggered
                ? _value.lastTriggered
                : lastTriggered // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetectionRuleModelImplCopyWith<$Res>
    implements $DetectionRuleModelCopyWith<$Res> {
  factory _$$DetectionRuleModelImplCopyWith(
    _$DetectionRuleModelImpl value,
    $Res Function(_$DetectionRuleModelImpl) then,
  ) = __$$DetectionRuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String condition,
    String action,
    bool isEnabled,
    DateTime? lastTriggered,
  });
}

/// @nodoc
class __$$DetectionRuleModelImplCopyWithImpl<$Res>
    extends _$DetectionRuleModelCopyWithImpl<$Res, _$DetectionRuleModelImpl>
    implements _$$DetectionRuleModelImplCopyWith<$Res> {
  __$$DetectionRuleModelImplCopyWithImpl(
    _$DetectionRuleModelImpl _value,
    $Res Function(_$DetectionRuleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetectionRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? condition = null,
    Object? action = null,
    Object? isEnabled = null,
    Object? lastTriggered = freezed,
  }) {
    return _then(
      _$DetectionRuleModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        isEnabled: null == isEnabled
            ? _value.isEnabled
            : isEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastTriggered: freezed == lastTriggered
            ? _value.lastTriggered
            : lastTriggered // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectionRuleModelImpl implements _DetectionRuleModel {
  const _$DetectionRuleModelImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.condition,
    required this.action,
    required this.isEnabled,
    this.lastTriggered,
  });

  factory _$DetectionRuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectionRuleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String condition;
  // e.g. "traffic > 100MB"
  @override
  final String action;
  // e.g. "block_ip"
  @override
  final bool isEnabled;
  @override
  final DateTime? lastTriggered;

  @override
  String toString() {
    return 'DetectionRuleModel(id: $id, name: $name, description: $description, condition: $condition, action: $action, isEnabled: $isEnabled, lastTriggered: $lastTriggered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionRuleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.lastTriggered, lastTriggered) ||
                other.lastTriggered == lastTriggered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    condition,
    action,
    isEnabled,
    lastTriggered,
  );

  /// Create a copy of DetectionRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionRuleModelImplCopyWith<_$DetectionRuleModelImpl> get copyWith =>
      __$$DetectionRuleModelImplCopyWithImpl<_$DetectionRuleModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectionRuleModelImplToJson(this);
  }
}

abstract class _DetectionRuleModel implements DetectionRuleModel {
  const factory _DetectionRuleModel({
    required final String id,
    required final String name,
    required final String description,
    required final String condition,
    required final String action,
    required final bool isEnabled,
    final DateTime? lastTriggered,
  }) = _$DetectionRuleModelImpl;

  factory _DetectionRuleModel.fromJson(Map<String, dynamic> json) =
      _$DetectionRuleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get condition; // e.g. "traffic > 100MB"
  @override
  String get action; // e.g. "block_ip"
  @override
  bool get isEnabled;
  @override
  DateTime? get lastTriggered;

  /// Create a copy of DetectionRuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionRuleModelImplCopyWith<_$DetectionRuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
