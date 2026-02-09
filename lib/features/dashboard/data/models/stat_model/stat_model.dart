import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_model.freezed.dart';
part 'stat_model.g.dart';

@freezed
class StatModel with _$StatModel {
  const factory StatModel({
    required String label,
    required String value,
    required int iconCodePoint,
    required int colorValue,
    @Default(0xFFFFFFFF) int backgroundColorValue,
  }) = _StatModel;

  factory StatModel.fromJson(Map<String, dynamic> json) =>
      _$StatModelFromJson(json);
}
