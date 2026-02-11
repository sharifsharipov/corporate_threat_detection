import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature_model.freezed.dart';
part 'signature_model.g.dart';

@freezed
class SignatureModel with _$SignatureModel {
  const factory SignatureModel({
    required String id,
    required String name,
    required String pattern, // e.g. Regex or hash
    required String threatType, // e.g. "Malware", "Phishing"
    required DateTime addedDate,
    required bool isActive,
  }) = _SignatureModel;

  factory SignatureModel.fromJson(Map<String, dynamic> json) =>
      _$SignatureModelFromJson(json);
}
