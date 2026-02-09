// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anomaly_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnomalyModel _$AnomalyModelFromJson(Map<String, dynamic> json) {
  return _AnomalyModel.fromJson(json);
}

/// @nodoc
mixin _$AnomalyModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get confidenceScore => throw _privateConstructorUsedError;
  String get detectedByModel =>
      throw _privateConstructorUsedError; // e.g. "Isolation Forest"
  String get status => throw _privateConstructorUsedError;

  /// Serializes this AnomalyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnomalyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnomalyModelCopyWith<AnomalyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnomalyModelCopyWith<$Res> {
  factory $AnomalyModelCopyWith(
    AnomalyModel value,
    $Res Function(AnomalyModel) then,
  ) = _$AnomalyModelCopyWithImpl<$Res, AnomalyModel>;
  @useResult
  $Res call({
    String id,
    DateTime timestamp,
    String description,
    double confidenceScore,
    String detectedByModel,
    String status,
  });
}

/// @nodoc
class _$AnomalyModelCopyWithImpl<$Res, $Val extends AnomalyModel>
    implements $AnomalyModelCopyWith<$Res> {
  _$AnomalyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnomalyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? description = null,
    Object? confidenceScore = null,
    Object? detectedByModel = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            confidenceScore: null == confidenceScore
                ? _value.confidenceScore
                : confidenceScore // ignore: cast_nullable_to_non_nullable
                      as double,
            detectedByModel: null == detectedByModel
                ? _value.detectedByModel
                : detectedByModel // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$AnomalyModelImplCopyWith<$Res>
    implements $AnomalyModelCopyWith<$Res> {
  factory _$$AnomalyModelImplCopyWith(
    _$AnomalyModelImpl value,
    $Res Function(_$AnomalyModelImpl) then,
  ) = __$$AnomalyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime timestamp,
    String description,
    double confidenceScore,
    String detectedByModel,
    String status,
  });
}

/// @nodoc
class __$$AnomalyModelImplCopyWithImpl<$Res>
    extends _$AnomalyModelCopyWithImpl<$Res, _$AnomalyModelImpl>
    implements _$$AnomalyModelImplCopyWith<$Res> {
  __$$AnomalyModelImplCopyWithImpl(
    _$AnomalyModelImpl _value,
    $Res Function(_$AnomalyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnomalyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? description = null,
    Object? confidenceScore = null,
    Object? detectedByModel = null,
    Object? status = null,
  }) {
    return _then(
      _$AnomalyModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        confidenceScore: null == confidenceScore
            ? _value.confidenceScore
            : confidenceScore // ignore: cast_nullable_to_non_nullable
                  as double,
        detectedByModel: null == detectedByModel
            ? _value.detectedByModel
            : detectedByModel // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$AnomalyModelImpl implements _AnomalyModel {
  const _$AnomalyModelImpl({
    required this.id,
    required this.timestamp,
    required this.description,
    required this.confidenceScore,
    required this.detectedByModel,
    required this.status,
  });

  factory _$AnomalyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnomalyModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final String description;
  @override
  final double confidenceScore;
  @override
  final String detectedByModel;
  // e.g. "Isolation Forest"
  @override
  final String status;

  @override
  String toString() {
    return 'AnomalyModel(id: $id, timestamp: $timestamp, description: $description, confidenceScore: $confidenceScore, detectedByModel: $detectedByModel, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnomalyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.detectedByModel, detectedByModel) ||
                other.detectedByModel == detectedByModel) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    timestamp,
    description,
    confidenceScore,
    detectedByModel,
    status,
  );

  /// Create a copy of AnomalyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnomalyModelImplCopyWith<_$AnomalyModelImpl> get copyWith =>
      __$$AnomalyModelImplCopyWithImpl<_$AnomalyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnomalyModelImplToJson(this);
  }
}

abstract class _AnomalyModel implements AnomalyModel {
  const factory _AnomalyModel({
    required final String id,
    required final DateTime timestamp,
    required final String description,
    required final double confidenceScore,
    required final String detectedByModel,
    required final String status,
  }) = _$AnomalyModelImpl;

  factory _AnomalyModel.fromJson(Map<String, dynamic> json) =
      _$AnomalyModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  String get description;
  @override
  double get confidenceScore;
  @override
  String get detectedByModel; // e.g. "Isolation Forest"
  @override
  String get status;

  /// Create a copy of AnomalyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnomalyModelImplCopyWith<_$AnomalyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
