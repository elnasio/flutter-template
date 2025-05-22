import 'package:flutter/material.dart';

class BottomSheetMessage extends StatelessWidget {
  final String message;
  final IconData? icon;
  final String? imageAsset;
  final String buttonText;
  final VoidCallback onPressed;

  const BottomSheetMessage({
    super.key,
    required this.message,
    this.icon,
    this.imageAsset,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageAsset != null)
                Image.asset(imageAsset!, height: 80)
              else
                Icon(icon ?? Icons.info, size: 64, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
            ],
          ),
        ),
      ),
    );
  }
}
