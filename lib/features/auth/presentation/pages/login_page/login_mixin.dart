import 'package:corporate_threat_detection/features/auth/data/models/auth_model.dart';
import 'package:corporate_threat_detection/features/auth/domain/repository/auth_repository.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin LoginMixin on State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleRememberMe(bool? value) {
    setState(() {
      rememberMe = value ?? false;
    });
  }

  Future<void> handleLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final request = LoginRequest(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Access the repository from the service locator
        final authRepository = sl<AuthRepository>();

        // Login and register FCM token (handled in repo)
        await authRepository.login(request);

        if (mounted) {
          setState(() => isLoading = false);
          // Navigate to dashboard
          context.go(Routes.dashboardOverview);
        }
      } catch (e) {
        if (mounted) {
          setState(() => isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void navigateToRegister() {
    context.push(Routes.register);
  }

  void navigateToForgotPassword() {
    context.push(Routes.forgotPassword);
  }
}
