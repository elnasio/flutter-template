import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/widgets/primary_button.dart';
import '../../../ui/widgets/primary_text.dart';
import '../../../ui/widgets/primary_text_field.dart';
import '../../navigation/auth_notifier.dart';
import '../../services/inactivity/inactivity_service.dart';
import '../../services/session_service.dart';
import '../login/presentation/login_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  void _submitText() {
    final value = _controller.text.trim();
    if (value.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Kamu nulis: $value')));
      _controller.clear();
    }
  }

  @override
  void initState() {
    super.initState();

    InactivityService().initialize(() async {
      await SessionService().setLogin(false);
      authNotifier.update(false);
      if (mounted) {
        context.go(LoginRoute.login.path);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PrimaryText(
          text: 'Home',
          size: 20,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            PrimaryTextField(controller: _controller, hint: 'Tulis sesuatu...'),
            const SizedBox(height: 16),
            PrimaryButton(text: 'Submit', onPressed: _submitText),
          ],
        ),
      ),
    );
  }
}
