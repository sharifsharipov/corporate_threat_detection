import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String token,
    required String refreshToken,
    required User user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required String role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class TokenRegistrationRequest with _$TokenRegistrationRequest {
  const factory TokenRegistrationRequest({
    required String fcmToken,
    required String platform, // android, ios
  }) = _TokenRegistrationRequest;

  factory TokenRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRegistrationRequestFromJson(json);
}
