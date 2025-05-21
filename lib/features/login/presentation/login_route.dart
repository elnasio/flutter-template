import 'package:go_router/go_router.dart';

import 'login_screen.dart';

enum LoginRouteKey { login }

sealed class LoginRoute {
  final LoginRouteKey key;

  const LoginRoute(this.key);

  String get name => key.name;

  String get path => '/${key.name}';

  static const login = _LoginScreenRoute();

  GoRoute toRoute() => login._toRoute();
}

class _LoginScreenRoute extends LoginRoute {
  const _LoginScreenRoute() : super(LoginRouteKey.login);

  GoRoute _toRoute() =>
      GoRoute(path: path, name: name, builder: (_, __) => const LoginScreen());
}
