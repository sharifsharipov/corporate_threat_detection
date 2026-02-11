import 'package:corporate_threat_detection/features/auth/data/models/auth_model.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetEmail(String email);
  Future<LoginResponse?> getCurrentSession();
  Future<bool> isAuthenticated();
  Future<void> registerFcmToken(String token, String platform);
  Future<void> logout();
}
