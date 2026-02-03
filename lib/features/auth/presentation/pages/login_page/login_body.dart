import 'package:corporate_threat_detection/core/themes/colors/app_colors.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/login_page/login_mixin.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_button.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_layout.dart';
import 'package:corporate_threat_detection/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  final LoginMixin mixin;

  const LoginBody({super.key, required this.mixin});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Welcome Back',
      subtitle: 'Sign in to access your dashboard',
      child: Form(
        key: mixin.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: mixin.passwordController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Remember Me & Forgot Password
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: mixin.rememberMe,
                    onChanged: mixin.toggleRememberMe,
                    activeColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Remember me',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const Spacer(),
                TextButton(
                  onPressed: mixin.navigateToForgotPassword,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.buttonColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            AuthButton(
              text: 'Sign In',
              onPressed: mixin.handleLogin,
              isLoading: mixin.isLoading,
            ),

            const SizedBox(height: 24),

            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                TextButton(
                  onPressed: mixin.navigateToRegister,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.buttonColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Sign Up',
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
