import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_log_model.freezed.dart';
part 'system_log_model.g.dart';

enum LogLevel { error, warning, info, debug }

@freezed
class SystemLogModel with _$SystemLogModel {
  const factory SystemLogModel({
    required DateTime timestamp,
    required LogLevel level,
    required String message,
    required String source,
  }) = _SystemLogModel;

  factory SystemLogModel.fromJson(Map<String, dynamic> json) =>
      _$SystemLogModelFromJson(json);
}
