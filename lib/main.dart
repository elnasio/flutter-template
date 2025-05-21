import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/env/env_keys.dart';
import 'di/injection.dart';
import 'features/login/bloc/login_bloc.dart';
import 'navigation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment(
    EnvKeys.environment,
    defaultValue: EnvKeys.defaultValue,
  );
  final fileName = '.env.$env';

  try {
    await dotenv.load(fileName: fileName);
    print('✅ Loaded $fileName');
  } catch (e) {
    print('❌ Gagal load $fileName: $e, fallback ke .env');
    await dotenv.load(); // fallback ke .env biasa
  }

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
