import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';

import '../env/env_keys.dart';

Future<HttpClientAdapter> createPinnedAdapter() async {
  const env = String.fromEnvironment(
    EnvKeys.environment,
    defaultValue: EnvKeys.defaultValue,
  );

  if (env != 'release') {
    return DefaultHttpClientAdapter();
  }

  final sslCert = await rootBundle.load('assets/cert/cert.pem');
  SecurityContext context = SecurityContext(withTrustedRoots: true);
  context.setTrustedCertificatesBytes(sslCert.buffer.asUint8List());

  final HttpClient client = HttpClient(context: context);
  client.badCertificateCallback = (cert, host, port) {
    return false;
  };

  return IOHttpClientAdapter(createHttpClient: () => client);
}
