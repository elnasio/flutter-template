import 'package:dio/dio.dart';
import 'package:new_flutter/core/network/ssl_pinning_adapter.dart';

import 'api_config.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(BaseOptions(baseUrl: ApiConfig.baseUrl)) {
    _setup();
  }

  Future<void> _setup() async {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.httpClientAdapter = await createPinnedAdapter();
  }
}
