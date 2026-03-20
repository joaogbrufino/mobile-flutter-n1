import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../theme/app_colors.dart';
import 'feed_page.dart';
import 'profile_page.dart';

/// Navegação entre Feed e Perfil (transição interna suave).
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 280),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _index == 0
            ? const KeyedSubtree(
                key: ValueKey('feed'),
                child: FeedPage(),
              )
            : const KeyedSubtree(
                key: ValueKey('profile'),
                child: ProfilePage(),
              ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 64,
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.navy.withValues(alpha: 0.12),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: AppColors.black),
            selectedIcon: Icon(Icons.home, color: AppColors.navy),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.black),
            selectedIcon: Icon(Icons.person, color: AppColors.navy),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: AppColors.navy,
        foregroundColor: AppColors.white,
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.login,
            (_) => false,
          );
        },
        child: const Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
