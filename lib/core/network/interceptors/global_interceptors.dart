import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

List<Interceptor> buildGlobalInterceptors() {
  final interceptors = <Interceptor>[LogInterceptor(responseBody: true)];

  if (kDebugMode) {
    interceptors.add(ChuckerDioInterceptor());
  }

  return interceptors;
}
