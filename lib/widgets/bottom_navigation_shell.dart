import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_colors.dart';

class BottomNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationShell({Key? key, required this.navigationShell})
    : super(key: key);

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => _onTap(context, index),
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.cream,
        indicatorColor: AppColors.terracotta.withOpacity(0.2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: AppColors.terracotta),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined),
            selectedIcon: Icon(
              Icons.leaderboard_rounded,
              color: AppColors.terracotta,
            ),
            label: 'Peringkat',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: AppColors.terracotta,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
