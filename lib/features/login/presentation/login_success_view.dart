import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/app_route.dart';
import '../../../ui/widgets/primary_button.dart';
import '../../../ui/widgets/primary_text.dart';

class LoginSuccessView extends StatelessWidget {
  const LoginSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PrimaryText(
                text: 'Login berhasil!',
                size: 20,
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'Masuk ke Beranda',
                onPressed: () {
                  context.go(AppRoute.home.path);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
