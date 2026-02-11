import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:corporate_threat_detection/core/database/local_data_source.dart';
import 'package:corporate_threat_detection/features/auth/data/data_source/auth_data_source.dart';
import 'package:corporate_threat_detection/features/auth/data/models/auth_model.dart';
import 'package:corporate_threat_detection/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  final LocalSource localSource;

  AuthRepositoryImpl(this.dataSource, this.localSource);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await dataSource.login(request);
    await _persistSession(response);
    await _registerFcmTokenSafely();
    return response;
  }

  @override
  Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await dataSource.register(
      name: name,
      email: email,
      password: password,
    );
    await _persistSession(response);
    await _registerFcmTokenSafely();
    return response;
  }

  @override
  Future<void> resetPassword(String email) async {
    await dataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isAuthenticated() async {
    final isSignedIn = await dataSource.isAuthenticated();
    if (!isSignedIn) {
      await localSource.clear();
      return false;
    }

    final session = await dataSource.getCurrentSession();
    if (session == null) {
      await localSource.clear();
      return false;
    }

    await _persistSession(session);
    return true;
  }

  Future<void> _persistSession(LoginResponse response) async {
    await localSource.setAccessToken(response.token);
    await localSource.setRefreshToken(response.refreshToken);
    await localSource.setUserId(int.tryParse(response.user.id) ?? 0);
    await localSource.setEmail(response.user.email);
    await localSource.setFirstName(response.user.name);
  }

  Future<void> _registerFcmTokenSafely() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        await registerFcmToken(fcmToken);
      }
    } catch (e) {
      debugPrint("Failed to register FCM token: $e");
    }
  }

  @override
  Future<void> registerFcmToken(String fcmToken) async {
    String platform = 'unknown';
    if (!kIsWeb) {
      platform = Platform.isAndroid ? 'android' : 'ios';
    } else {
      platform = 'web';
    }
    await dataSource.registerFcmToken(fcmToken, platform);
  }

  @override
  Future<void> logout() async {
    await dataSource.logout();
    await localSource.clear();
  }
}
