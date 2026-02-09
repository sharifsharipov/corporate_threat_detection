// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SignatureModel _$SignatureModelFromJson(Map<String, dynamic> json) {
  return _SignatureModel.fromJson(json);
}

/// @nodoc
mixin _$SignatureModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get pattern =>
      throw _privateConstructorUsedError; // e.g. Regex or hash
  String get threatType =>
      throw _privateConstructorUsedError; // e.g. "Malware", "Phishing"
  DateTime get addedDate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this SignatureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignatureModelCopyWith<SignatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignatureModelCopyWith<$Res> {
  factory $SignatureModelCopyWith(
    SignatureModel value,
    $Res Function(SignatureModel) then,
  ) = _$SignatureModelCopyWithImpl<$Res, SignatureModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String pattern,
    String threatType,
    DateTime addedDate,
    bool isActive,
  });
}

/// @nodoc
class _$SignatureModelCopyWithImpl<$Res, $Val extends SignatureModel>
    implements $SignatureModelCopyWith<$Res> {
  _$SignatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignatureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pattern = null,
    Object? threatType = null,
    Object? addedDate = null,
    Object? isActive = null,
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
            pattern: null == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String,
            threatType: null == threatType
                ? _value.threatType
                : threatType // ignore: cast_nullable_to_non_nullable
                      as String,
            addedDate: null == addedDate
                ? _value.addedDate
                : addedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignatureModelImplCopyWith<$Res>
    implements $SignatureModelCopyWith<$Res> {
  factory _$$SignatureModelImplCopyWith(
    _$SignatureModelImpl value,
    $Res Function(_$SignatureModelImpl) then,
  ) = __$$SignatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String pattern,
    String threatType,
    DateTime addedDate,
    bool isActive,
  });
}

/// @nodoc
class __$$SignatureModelImplCopyWithImpl<$Res>
    extends _$SignatureModelCopyWithImpl<$Res, _$SignatureModelImpl>
    implements _$$SignatureModelImplCopyWith<$Res> {
  __$$SignatureModelImplCopyWithImpl(
    _$SignatureModelImpl _value,
    $Res Function(_$SignatureModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignatureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? pattern = null,
    Object? threatType = null,
    Object? addedDate = null,
    Object? isActive = null,
  }) {
    return _then(
      _$SignatureModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        pattern: null == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String,
        threatType: null == threatType
            ? _value.threatType
            : threatType // ignore: cast_nullable_to_non_nullable
                  as String,
        addedDate: null == addedDate
            ? _value.addedDate
            : addedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SignatureModelImpl implements _SignatureModel {
  const _$SignatureModelImpl({
    required this.id,
    required this.name,
    required this.pattern,
    required this.threatType,
    required this.addedDate,
    required this.isActive,
  });

  factory _$SignatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignatureModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String pattern;
  // e.g. Regex or hash
  @override
  final String threatType;
  // e.g. "Malware", "Phishing"
  @override
  final DateTime addedDate;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'SignatureModel(id: $id, name: $name, pattern: $pattern, threatType: $threatType, addedDate: $addedDate, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignatureModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.threatType, threatType) ||
                other.threatType == threatType) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    pattern,
    threatType,
    addedDate,
    isActive,
  );

  /// Create a copy of SignatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignatureModelImplCopyWith<_$SignatureModelImpl> get copyWith =>
      __$$SignatureModelImplCopyWithImpl<_$SignatureModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SignatureModelImplToJson(this);
  }
}

abstract class _SignatureModel implements SignatureModel {
  const factory _SignatureModel({
    required final String id,
    required final String name,
    required final String pattern,
    required final String threatType,
    required final DateTime addedDate,
    required final bool isActive,
  }) = _$SignatureModelImpl;

  factory _SignatureModel.fromJson(Map<String, dynamic> json) =
      _$SignatureModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get pattern; // e.g. Regex or hash
  @override
  String get threatType; // e.g. "Malware", "Phishing"
  @override
  DateTime get addedDate;
  @override
  bool get isActive;

  /// Create a copy of SignatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignatureModelImplCopyWith<_$SignatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
