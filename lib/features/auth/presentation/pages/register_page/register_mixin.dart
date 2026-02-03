import 'package:corporate_threat_detection/features/auth/presentation/pages/register_page/register_page.dart';
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

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => isLoading = false);
        // Show success and navigate to login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Please login.'),
          ),
        );
        context.pop(); // Go back to login
      }
    }
  }

  void navigateToLogin() {
    context.pop(); // Go back to login
  }
}
