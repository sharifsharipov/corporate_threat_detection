import 'package:freezed_annotation/freezed_annotation.dart';

part 'detection_rule_model.freezed.dart';
part 'detection_rule_model.g.dart';

@freezed
class DetectionRuleModel with _$DetectionRuleModel {
  const factory DetectionRuleModel({
    required String id,
    required String name,
    required String description,
    required String condition, // e.g. "traffic > 100MB"
    required String action, // e.g. "block_ip"
    required bool isEnabled,
    DateTime? lastTriggered,
  }) = _DetectionRuleModel;

  factory DetectionRuleModel.fromJson(Map<String, dynamic> json) =>
      _$DetectionRuleModelFromJson(json);
}
