// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytic_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalyticReportModel _$AnalyticReportModelFromJson(Map<String, dynamic> json) {
  return _AnalyticReportModel.fromJson(json);
}

/// @nodoc
mixin _$AnalyticReportModel {
  String get id => throw _privateConstructorUsedError;
  String get reportName => throw _privateConstructorUsedError;
  String get reportType => throw _privateConstructorUsedError;
  DateTime get generatedDate => throw _privateConstructorUsedError;
  String get fileSize => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;

  /// Serializes this AnalyticReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticReportModelCopyWith<AnalyticReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticReportModelCopyWith<$Res> {
  factory $AnalyticReportModelCopyWith(
    AnalyticReportModel value,
    $Res Function(AnalyticReportModel) then,
  ) = _$AnalyticReportModelCopyWithImpl<$Res, AnalyticReportModel>;
  @useResult
  $Res call({
    String id,
    String reportName,
    String reportType,
    DateTime generatedDate,
    String fileSize,
    String format,
    String downloadUrl,
  });
}

/// @nodoc
class _$AnalyticReportModelCopyWithImpl<$Res, $Val extends AnalyticReportModel>
    implements $AnalyticReportModelCopyWith<$Res> {
  _$AnalyticReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reportName = null,
    Object? reportType = null,
    Object? generatedDate = null,
    Object? fileSize = null,
    Object? format = null,
    Object? downloadUrl = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            reportName: null == reportName
                ? _value.reportName
                : reportName // ignore: cast_nullable_to_non_nullable
                      as String,
            reportType: null == reportType
                ? _value.reportType
                : reportType // ignore: cast_nullable_to_non_nullable
                      as String,
            generatedDate: null == generatedDate
                ? _value.generatedDate
                : generatedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            fileSize: null == fileSize
                ? _value.fileSize
                : fileSize // ignore: cast_nullable_to_non_nullable
                      as String,
            format: null == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as String,
            downloadUrl: null == downloadUrl
                ? _value.downloadUrl
                : downloadUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalyticReportModelImplCopyWith<$Res>
    implements $AnalyticReportModelCopyWith<$Res> {
  factory _$$AnalyticReportModelImplCopyWith(
    _$AnalyticReportModelImpl value,
    $Res Function(_$AnalyticReportModelImpl) then,
  ) = __$$AnalyticReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String reportName,
    String reportType,
    DateTime generatedDate,
    String fileSize,
    String format,
    String downloadUrl,
  });
}

/// @nodoc
class __$$AnalyticReportModelImplCopyWithImpl<$Res>
    extends _$AnalyticReportModelCopyWithImpl<$Res, _$AnalyticReportModelImpl>
    implements _$$AnalyticReportModelImplCopyWith<$Res> {
  __$$AnalyticReportModelImplCopyWithImpl(
    _$AnalyticReportModelImpl _value,
    $Res Function(_$AnalyticReportModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reportName = null,
    Object? reportType = null,
    Object? generatedDate = null,
    Object? fileSize = null,
    Object? format = null,
    Object? downloadUrl = null,
  }) {
    return _then(
      _$AnalyticReportModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        reportName: null == reportName
            ? _value.reportName
            : reportName // ignore: cast_nullable_to_non_nullable
                  as String,
        reportType: null == reportType
            ? _value.reportType
            : reportType // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedDate: null == generatedDate
            ? _value.generatedDate
            : generatedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        fileSize: null == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as String,
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String,
        downloadUrl: null == downloadUrl
            ? _value.downloadUrl
            : downloadUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticReportModelImpl implements _AnalyticReportModel {
  const _$AnalyticReportModelImpl({
    required this.id,
    required this.reportName,
    required this.reportType,
    required this.generatedDate,
    required this.fileSize,
    required this.format,
    required this.downloadUrl,
  });

  factory _$AnalyticReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticReportModelImplFromJson(json);

  @override
  final String id;
  @override
  final String reportName;
  @override
  final String reportType;
  @override
  final DateTime generatedDate;
  @override
  final String fileSize;
  @override
  final String format;
  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'AnalyticReportModel(id: $id, reportName: $reportName, reportType: $reportType, generatedDate: $generatedDate, fileSize: $fileSize, format: $format, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reportName, reportName) ||
                other.reportName == reportName) &&
            (identical(other.reportType, reportType) ||
                other.reportType == reportType) &&
            (identical(other.generatedDate, generatedDate) ||
                other.generatedDate == generatedDate) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    reportName,
    reportType,
    generatedDate,
    fileSize,
    format,
    downloadUrl,
  );

  /// Create a copy of AnalyticReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticReportModelImplCopyWith<_$AnalyticReportModelImpl> get copyWith =>
      __$$AnalyticReportModelImplCopyWithImpl<_$AnalyticReportModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticReportModelImplToJson(this);
  }
}

abstract class _AnalyticReportModel implements AnalyticReportModel {
  const factory _AnalyticReportModel({
    required final String id,
    required final String reportName,
    required final String reportType,
    required final DateTime generatedDate,
    required final String fileSize,
    required final String format,
    required final String downloadUrl,
  }) = _$AnalyticReportModelImpl;

  factory _AnalyticReportModel.fromJson(Map<String, dynamic> json) =
      _$AnalyticReportModelImpl.fromJson;

  @override
  String get id;
  @override
  String get reportName;
  @override
  String get reportType;
  @override
  DateTime get generatedDate;
  @override
  String get fileSize;
  @override
  String get format;
  @override
  String get downloadUrl;

  /// Create a copy of AnalyticReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticReportModelImplCopyWith<_$AnalyticReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
