import 'dart:convert';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class GlobalInterceptors extends Interceptor {
  final _deviceInfo = DeviceInfoPlugin();
  static const _secret = 'mySecret123';
  final bool enabled;

  GlobalInterceptors({this.enabled = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (enabled) {
      final sysParam = await _generateSysParam();
      options.headers['X-SYS-PARAM'] = sysParam;
    }
    handler.next(options);
  }

  Future<String> _generateSysParam() async {
    String deviceId = await _getDeviceId();
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    final raw = '$deviceId|$timestamp|$_secret';
    final hash = sha256.convert(utf8.encode(raw)).toString();

    return '$deviceId|$timestamp|$hash';
  }

  Future<String> _getDeviceId() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final info = await _deviceInfo.androidInfo;
      return info.id;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final info = await _deviceInfo.iosInfo;
      return info.identifierForVendor ?? 'unknown';
    }
    return 'unsupported';
  }
}

List<Interceptor> buildGlobalInterceptors() {
  final interceptors = <Interceptor>[
    LogInterceptor(responseBody: true),
    GlobalInterceptors(enabled: false),
  ];

  if (kDebugMode) {
    interceptors.add(ChuckerDioInterceptor());
  }

  return interceptors;
}
