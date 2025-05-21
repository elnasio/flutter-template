import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../env/env_keys.dart';

class ApiConfig {
  static final String baseUrl = dotenv.env[EnvKeys.baseUrl] ?? '';
}
