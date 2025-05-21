import 'package:flutter/material.dart';

import 'app_route.dart';

enum BottomNavItem { home, search, post, notifications, profile }

extension BottomNavItemExtension on BottomNavItem {
  IconData get icon {
    switch (this) {
      case BottomNavItem.home:
        return Icons.home;
      case BottomNavItem.search:
        return Icons.search;
      case BottomNavItem.post:
        return Icons.add_box;
      case BottomNavItem.notifications:
        return Icons.notifications;
      case BottomNavItem.profile:
        return Icons.person;
    }
  }

  String get label => name[0].toUpperCase() + name.substring(1);

  String get path {
    switch (this) {
      case BottomNavItem.home:
        return AppRoute.home.path;
      case BottomNavItem.search:
        return AppRoute.search.path;
      case BottomNavItem.post:
        return AppRoute.post.path;
      case BottomNavItem.notifications:
        return AppRoute.notifications.path;
      case BottomNavItem.profile:
        return AppRoute.profile.path;
    }
  }

  static BottomNavItem fromPath(String path) {
    return BottomNavItem.values.firstWhere(
      (e) => e.path == path,
      orElse: () {
        return BottomNavItem.home;
      },
    );
  }
}
