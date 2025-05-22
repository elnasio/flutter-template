import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_flutter/navigation/splash_route.dart';

import '../di/network_di.dart';
import '../features/home/home_screen.dart';
import '../features/login/presentation/login_route.dart';
import '../features/notifications/notifications_screen.dart';
import '../features/post/post_screen.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '../features/profile/presentation/bloc/profile_event.dart';
import '../features/profile/profile_screen.dart';
import '../features/search/search_screen.dart';
import '../ui/widgets/scaffold_with_bottom_nav.dart';
import 'app_route.dart';
import 'auth_notifier.dart';

final router = GoRouter(
  initialLocation: AppRoute.splash.path,
  refreshListenable: authNotifier,
  observers: [
    ChuckerFlutter.navigatorObserver,
  ],
  routes: [
    ShellRoute(
      builder: (context, state, child) => ScaffoldWithBottomNav(child: child),
      routes: [
        GoRoute(
          path: AppRoute.home.path,
          name: AppRoute.home.name,
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoute.search.path,
          name: AppRoute.search.name,
          builder: (_, __) => const SearchScreen(),
        ),
        GoRoute(
          path: AppRoute.post.path,
          name: AppRoute.post.name,
          builder: (_, __) => const PostScreen(),
        ),
        GoRoute(
          path: AppRoute.notifications.path,
          name: AppRoute.notifications.name,
          builder: (_, __) => const NotificationsScreen(),
        ),
        GoRoute(
          path: AppRoute.profile.path,
          name: AppRoute.profile.name,
          builder: (_, __) => BlocProvider(
            create: (_) => sl<ProfileBloc>()..add(LoadProfile()),
            child: const ProfileScreen(),
          ),
        ),
      ],
    ),
    LoginRoute.login.toRoute(),
    GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
  ],
);
