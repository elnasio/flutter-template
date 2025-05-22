import 'package:dio/dio.dart';
import 'package:new_flutter/core/network/ssl_pinning_adapter.dart';

import 'api_config.dart';
import 'interceptors/global_interceptors.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    _setup();
  }

  Future<void> _setup() async {
    dio.interceptors.addAll(buildGlobalInterceptors());

    final adapter = await createPinnedAdapter();
    dio.httpClientAdapter = adapter;
  }
}
