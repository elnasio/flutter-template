import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/login/presentation/login_route.dart';
import '../../navigation/app_route.dart';
import '../../navigation/auth_notifier.dart';
import '../../services/session_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleStartup();
  }

  void _handleStartup() async {
    final isLoggedIn = await SessionService().isLoggedIn();
    authNotifier.update(isLoggedIn);

    if (!mounted) return;

    if (isLoggedIn) {
      context.go(AppRoute.home.path);
    } else {
      context.go(LoginRoute.login.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
