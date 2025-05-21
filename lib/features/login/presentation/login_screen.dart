import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/app_route.dart';
import '../../../ui/widgets/primary_text.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PrimaryText(
          text: 'Login',
          size: 20,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(AppRoute.home.path);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: LoginForm()),
          ),
        ),
      ),
    );
  }
}
