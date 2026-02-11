import 'package:corporate_threat_detection/constants/constants.dart';
import 'package:corporate_threat_detection/features/auth/data/data_source/auth_data_source.dart';
import 'package:corporate_threat_detection/features/auth/data/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class AuthDataSourceImpl implements AuthDataSource {
  final fb.FirebaseAuth firebaseAuth;
  final Dio dio;

  AuthDataSourceImpl(this.firebaseAuth, this.dio);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
      final firebaseUser = credential.user;
      if (firebaseUser == null) {
        throw Exception("User not found.");
      }
      return _buildLoginResponse(firebaseUser, fallbackEmail: request.email);
    } on fb.FirebaseAuthException catch (e) {
      throw Exception(_firebaseAuthErrorMessage(e));
    } catch (_) {
      throw Exception("Unable to sign in. Please try again.");
    }
  }

  @override
  Future<void> registerFcmToken(String token, String platform) async {
    try {
      await dio.post(
        Urls.fcmRegisterToken,
        data: {'fcm_token': token, 'platform': platform},
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<LoginResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = credential.user;
      if (firebaseUser == null) {
        throw Exception("User not found.");
      }

      final normalizedName = name.trim();
      if (normalizedName.isNotEmpty) {
        await firebaseUser.updateDisplayName(normalizedName);
        await firebaseUser.reload();
      }

      final currentUser = firebaseAuth.currentUser ?? firebaseUser;
      return _buildLoginResponse(currentUser, fallbackEmail: email);
    } on fb.FirebaseAuthException catch (e) {
      throw Exception(_firebaseAuthErrorMessage(e));
    } catch (_) {
      throw Exception("Unable to create account. Please try again.");
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on fb.FirebaseAuthException catch (e) {
      throw Exception(_firebaseAuthErrorMessage(e));
    } catch (_) {
      throw Exception("Unable to send reset email. Please try again.");
    }
  }

  @override
  Future<LoginResponse?> getCurrentSession() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return null;
    }
    return _buildLoginResponse(
      firebaseUser,
      fallbackEmail: firebaseUser.email ?? "",
    );
  }

  @override
  Future<bool> isAuthenticated() async => firebaseAuth.currentUser != null;

  Future<LoginResponse> _buildLoginResponse(
    fb.User firebaseUser, {
    required String fallbackEmail,
  }) async {
    final idToken = await firebaseUser.getIdToken(true);
    if (idToken == null || idToken.isEmpty) {
      throw Exception("Unable to get auth token.");
    }

    final email = firebaseUser.email ?? fallbackEmail;
    final displayName = (firebaseUser.displayName ?? "").trim();
    final name = displayName.isNotEmpty ? displayName : email.split("@").first;

    return LoginResponse(
      token: idToken,
      refreshToken: firebaseUser.refreshToken ?? "",
      user: User(id: firebaseUser.uid, email: email, name: name, role: "user"),
    );
  }

  String _firebaseAuthErrorMessage(fb.FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-email":
        return "Email format is invalid.";
      case "invalid-credential":
      case "wrong-password":
      case "user-not-found":
        return "Email or password is incorrect.";
      case "user-disabled":
        return "This account has been disabled.";
      case "email-already-in-use":
        return "This email is already in use.";
      case "weak-password":
        return "Password is too weak.";
      case "too-many-requests":
        return "Too many attempts. Please try again later.";
      default:
        return e.message ?? "Authentication error.";
    }
  }
}
