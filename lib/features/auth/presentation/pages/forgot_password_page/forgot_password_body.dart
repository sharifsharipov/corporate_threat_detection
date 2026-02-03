import 'package:corporate_threat_detection/features/auth/presentation/pages/forgot_password_page/forgot_password_mixin.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_button.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_layout.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  final ForgotPasswordMixin mixin;

  const ForgotPasswordBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Reset Password',
      subtitle: 'Enter your email to receive reset instructions',
      child: Form(
        key: mixin.formKey,
        child: Column(
          children: [
            AuthTextField(
              label: 'Email Address',
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              controller: mixin.emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            AuthButton(
              text: 'Send Reset Link',
              onPressed: mixin.handleResetPassword,
              isLoading: mixin.isLoading,
            ),

            const SizedBox(height: 24),

            // Back to Login Link
            TextButton.icon(
              onPressed: mixin.navigateToLogin,
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade600,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
