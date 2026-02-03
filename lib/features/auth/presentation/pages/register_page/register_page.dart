import 'package:corporate_threat_detection/features/auth/presentation/pages/register_page/register_body.dart';
import 'package:corporate_threat_detection/features/auth/presentation/pages/register_page/register_mixin.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterMixin {
  @override
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: RegisterBody(mixin: this));
}
