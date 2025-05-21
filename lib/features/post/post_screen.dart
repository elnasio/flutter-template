import 'package:flutter/material.dart';
import '../../../ui/widgets/primary_text.dart';
import '../../../ui/widgets/primary_text_field.dart';
import '../../../ui/widgets/primary_button.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final captionController = TextEditingController();
  bool posted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const PrimaryText(text: 'Post', size: 20, weight: FontWeight.bold)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            PrimaryTextField(
              controller: captionController,
              hint: 'Tulis caption...',
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Kirim Postingan',
              onPressed: () {
                setState(() {
                  posted = true;
                });
              },
            ),
            const SizedBox(height: 24),
            if (posted)
              PrimaryText(
                text: '✅ Postingan berhasil dikirim!',
                size: 16,
                weight: FontWeight.w500,
              ),
          ],
        ),
      ),
    );
  }
}
