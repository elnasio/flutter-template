import 'package:flutter/material.dart';
import '../../../ui/widgets/primary_text.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dummyNotifications = [
      'Notifikasi 1: Update fitur baru',
      'Notifikasi 2: Pesan masuk',
      'Notifikasi 3: Promo terbatas',
    ];

    return Scaffold(
      appBar: AppBar(title: const PrimaryText(text: 'Notifications', size: 20, weight: FontWeight.bold)),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: dummyNotifications.length,
        itemBuilder: (context, index) {
          return PrimaryText(
            text: dummyNotifications[index],
            size: 16,
            weight: FontWeight.w400,
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
