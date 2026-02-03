import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/register_page/register_mixin.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_button.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_layout.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  final RegisterMixin mixin;

  const RegisterBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Create Account',
      subtitle: 'Join to secure your infrastructure',
      child: Form(
        key: mixin.formKey,
        child: Column(
          children: [
            AuthTextField(
              label: 'Full Name',
              hint: 'Enter your full name',
              prefixIcon: Icons.person_outline,
              controller: mixin.nameController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AuthTextField(
              label: 'Email Address',
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              controller: mixin.emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
            const SizedBox(height: 16),
            AuthTextField(
              label: 'Password',
              hint: 'Create a password',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: mixin.passwordController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AuthTextField(
              label: 'Confirm Password',
              hint: 'Confirm your password',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: mixin.confirmPasswordController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != mixin.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            AuthButton(
              text: 'Sign Up',
              onPressed: mixin.handleRegister,
              isLoading: mixin.isLoading,
            ),

            const SizedBox(height: 24),

            // Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                TextButton(
                  onPressed: mixin.navigateToLogin,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.buttonColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
