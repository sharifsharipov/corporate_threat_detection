import 'package:corporate_threat_detection/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:corporate_threat_detection/features/auth/domain/repository/auth_repository.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin RegisterMixin on State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> handleRegister() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final authRepository = sl<AuthRepository>();
        await authRepository.register(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (mounted) {
          setState(() => isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully.')),
          );
          context.go(Routes.dashboardOverview);
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
    context.pop(); // Go back to login
  }
}
