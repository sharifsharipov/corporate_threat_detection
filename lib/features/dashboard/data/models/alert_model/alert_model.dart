import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_model.freezed.dart';
part 'alert_model.g.dart';

enum AlertSeverity { low, medium, high, critical }

@freezed
class AlertModel with _$AlertModel {
  const factory AlertModel({
    required String title,
    required DateTime timestamp,
    required AlertSeverity severity,
    required bool isRead,
  }) = _AlertModel;

  factory AlertModel.fromJson(Map<String, dynamic> json) =>
      _$AlertModelFromJson(json);
}
