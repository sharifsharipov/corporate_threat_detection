import 'package:corporate_threat_detection/features/auth/presentation/pages/login_page/login_body.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/login_page/login_mixin.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  @override
  Widget build(BuildContext context) => Scaffold(body: LoginBody(mixin: this));
}
