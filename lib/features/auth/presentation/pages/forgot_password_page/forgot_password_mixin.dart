import 'package:corporate_threat_detection/features/auth/presentation/pages/forgot_password_page/forgot_password_page.dart';
import 'package:corporate_threat_detection/features/auth/domain/repository/auth_repository.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
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

      try {
        final authRepository = sl<AuthRepository>();
        await authRepository.resetPassword(emailController.text.trim());

        if (mounted) {
          setState(() => isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset link sent to your email.'),
            ),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          setState(() => isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString().replaceFirst('Exception: ', '')),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void navigateToLogin() {
    context.pop();
  }
}
