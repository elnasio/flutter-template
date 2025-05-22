import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';

class InactivityService {
  static final _instance = InactivityService._internal();

  factory InactivityService() => _instance;

  InactivityService._internal();

  Timer? _inactivityTimer;
  Duration timeout = const Duration(seconds: 10);

  void initialize(VoidCallback onTimeout) {
    _resetTimer(onTimeout);
    GestureBinding.instance.pointerRouter.addGlobalRoute((event) {
      _resetTimer(onTimeout);
    });
  }

  void _resetTimer(VoidCallback onTimeout) {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(timeout, onTimeout);
  }

  void dispose() {
    _inactivityTimer?.cancel();
  }
}
