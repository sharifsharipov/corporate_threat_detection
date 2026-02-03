import 'package:corporate_threat_detection/features/auth/presentation/pages/forgot_password_page/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin ForgotPasswordMixin on State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> handleResetPassword() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => isLoading = false);
        // Show success and navigate to login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password reset link sent to your email.'),
          ),
        );
        context.pop(); // Go back to login
      }
    }
  }

  void navigateToLogin() {
    context.pop();
  }
}
