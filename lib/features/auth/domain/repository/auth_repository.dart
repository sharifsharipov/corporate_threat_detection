import 'package:corporate_threat_detection/features/auth/data/models/auth_model.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> resetPassword(String email);
  Future<bool> isAuthenticated();
  Future<void> registerFcmToken(String fcmToken);
  Future<void> logout();
}
