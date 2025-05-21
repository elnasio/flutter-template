import 'package:new_flutter/di/profile_di.dart';

import 'network_di.dart';

Future<void> init() async {
  initNetwork();
  initProfileModule();
}
