import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/widgets/primary_button.dart';
import '../../../ui/widgets/primary_text_field.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _submit(BuildContext context) {
    context.read<LoginBloc>().add(
      LoginSubmitted(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            PrimaryTextField(
              controller: emailController,
              hint: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            PrimaryTextField(
              controller: passwordController,
              hint: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Login',
              isLoading: state is LoginLoading,
              onPressed: () => _submit(context),
            ),
          ],
        );
      },
    );
  }
}
