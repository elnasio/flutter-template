import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/bottom_nav_items.dart';

class BottomNavBarWidget extends StatelessWidget {
  final String currentPath;

  const BottomNavBarWidget({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    final current = BottomNavItemExtension.fromPath(currentPath);

    return BottomNavigationBar(
      currentIndex: BottomNavItem.values.indexOf(current),
      onTap: (index) {
        final item = BottomNavItem.values[index];
        if (item.path != currentPath) {
          context.go(item.path);
        }
      },
      items: BottomNavItem.values.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
        );
      }).toList(),
      type: BottomNavigationBarType.fixed,
    );
  }
}
