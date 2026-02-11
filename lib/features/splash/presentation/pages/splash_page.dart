import 'dart:async';

import 'package:corporate_threat_detection/features/auth/domain/repository/auth_repository.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:corporate_threat_detection/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkNavigator();
  }

  Future<void> _checkNavigator() async {
    final startedAt = DateTime.now();
    bool isAuthenticated = false;
    try {
      final authRepository = sl<AuthRepository>();
      isAuthenticated = await authRepository.isAuthenticated();
    } catch (_) {
      isAuthenticated = false;
    }

    final elapsed = DateTime.now().difference(startedAt);
    const minimumSplashDuration = Duration(milliseconds: 600);
    if (elapsed < minimumSplashDuration) {
      await Future.delayed(minimumSplashDuration - elapsed);
    }

    if (!mounted) return;

    if (isAuthenticated) {
      context.go(Routes.dashboardOverview);
    } else {
      context.go(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Replace with your logo/branding
      ),
    );
  }
}
