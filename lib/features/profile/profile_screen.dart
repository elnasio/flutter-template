import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_flutter/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:new_flutter/features/profile/presentation/bloc/profile_state.dart';

import '../../core/domain/repositories/network_info.dart';
import '../../di/network_di.dart';
import '../../navigation/auth_notifier.dart';
import '../../services/session_service.dart';
import '../../ui/widgets/bottom_sheet_message.dart';
import '../../ui/widgets/primary_button.dart';
import '../../ui/widgets/primary_text.dart';
import '../login/presentation/login_route.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _checkConnectivity() async {
    final isConnected = await sl<NetworkInfo>().isConnected;

    if (!isConnected && mounted) {
      showErrorSheet(context, "Tidak ada koneksi internet");
    }
  }

  @override
  void initState() {
    super.initState();

    _checkConnectivity();
  }

  void showSuccessSheet(BuildContext context, String msg) => showModalBottomSheet(
        context: context,
        builder: (_) => BottomSheetMessage(
          message: msg,
          icon: Icons.check_circle_outline,
          buttonText: 'OK',
          onPressed: () => Navigator.pop(context),
        ),
      );

  void showErrorSheet(BuildContext context, String msg) => showModalBottomSheet(
        context: context,
        builder: (_) => BottomSheetMessage(
          message: msg,
          icon: Icons.error_outline,
          buttonText: 'Tutup',
          onPressed: () => Navigator.pop(context),
        ),
      );

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
      appBar: AppBar(title: const PrimaryText(text: 'Profile')),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showErrorSheet(context, state.message);
            });
            return const SizedBox.shrink();
          }

          if (state is ProfileLoaded) {
            final profile = state.profile;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: 'Name: ${profile.name}', size: 18),
                  const SizedBox(height: 8),
                  PrimaryText(text: 'Email: ${profile.email}', size: 18),
                  const Spacer(),
                  PrimaryButton(
                    text: 'Logout',
                    onPressed: () => _logout(context),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
