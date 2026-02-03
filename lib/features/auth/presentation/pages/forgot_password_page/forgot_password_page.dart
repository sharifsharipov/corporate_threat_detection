import 'package:corporate_threat_detection/features/auth/presentation/pages/forgot_password_page/forgot_password_body.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/forgot_password_page/forgot_password_mixin.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with ForgotPasswordMixin {
  @override
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: ForgotPasswordBody(mixin: this));
}
