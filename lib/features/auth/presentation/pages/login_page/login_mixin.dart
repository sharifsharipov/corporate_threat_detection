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

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => isLoading = false);
        // Navigate to dashboard
        context.go(Routes.dashboardOverview);
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
