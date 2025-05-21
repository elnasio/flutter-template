import 'package:get_it/get_it.dart';

import '../features/profile/data/datasources/profile_remote_datasource.dart';
import '../features/profile/data/repositories/profile_repository_impl.dart';
import '../features/profile/domain/repositories/profile_repository.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';

final sl = GetIt.instance;

void initProfileModule() {
  // datasource
  sl.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl(sl()),
  );

  // repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDatasource: sl()),
  );

  // bloc
  sl.registerFactory(() => ProfileBloc(sl()));
}
