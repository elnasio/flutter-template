import 'package:flutter/material.dart';

class AuthStateNotifier extends ChangeNotifier {
  bool isLoggedIn = false;

  void update(bool value) {
    isLoggedIn = value;
    notifyListeners();
  }
}

// ✅ Global instance
final authNotifier = AuthStateNotifier();
