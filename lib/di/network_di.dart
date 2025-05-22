import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../core/network/dio_client.dart';
import '../core/data/repositories_impl/network_info_impl.dart';
import '../core/domain/repositories/network_info.dart';

final sl = GetIt.instance;

void initNetwork() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);

  // ✅ Additional: list of dependency NetworkInfo
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
