import 'package:flutter/material.dart';

import '../../../ui/widgets/primary_button.dart';
import '../../../ui/widgets/primary_text.dart';
import '../../../ui/widgets/primary_text_field.dart';

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
