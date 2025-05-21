enum RouteKey { splash, home, search, post, notifications, profile }

sealed class AppRoute {
  final RouteKey key;

  const AppRoute(this.key);

  String get name => key.name;

  String get path => '/${key.name}';

  static const splash = _SplashRoute();
  static const home = _HomeRoute();
  static const search = _SearchRoute();
  static const post = _PostRoute();
  static const notifications = _NotificationsRoute();
  static const profile = _ProfileRoute();

  static List<AppRoute> get mainRoutes => [
    splash,
    home,
    search,
    post,
    notifications,
    profile,
  ];
}

class _SplashRoute extends AppRoute {
  const _SplashRoute() : super(RouteKey.splash);
}

class _HomeRoute extends AppRoute {
  const _HomeRoute() : super(RouteKey.home);
}

class _SearchRoute extends AppRoute {
  const _SearchRoute() : super(RouteKey.search);
}

class _PostRoute extends AppRoute {
  const _PostRoute() : super(RouteKey.post);
}

class _NotificationsRoute extends AppRoute {
  const _NotificationsRoute() : super(RouteKey.notifications);
}

class _ProfileRoute extends AppRoute {
  const _ProfileRoute() : super(RouteKey.profile);
}
