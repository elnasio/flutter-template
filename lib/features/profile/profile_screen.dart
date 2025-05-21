import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/widgets/primary_button.dart';
import '../../../ui/widgets/primary_text.dart';
import '../../navigation/auth_notifier.dart';
import '../../services/session_service.dart';
import '../login/presentation/login_route.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    await SessionService().setLogin(false);
    authNotifier.update(false);
    if (context.mounted) {
      context.go(LoginRoute.login.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PrimaryText(
          text: 'Profile',
          size: 20,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const PrimaryText(
              text: 'Mories Deo',
              size: 18,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            const PrimaryText(text: 'moriesdeo574@gmail.com', size: 14),
            const SizedBox(height: 24),
            PrimaryButton(text: 'Logout', onPressed: () => _logout(context)),
          ],
        ),
      ),
    );
  }
}
