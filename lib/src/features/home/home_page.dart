import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.child});

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int get _currentIndex =>
      _locationToTabIndex(GoRouterState.of(context).uri.toString());
  int _locationToTabIndex(String location) {
    final index = tabRoutes.indexWhere((route) => location.startsWith(route));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) async {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabRoutes[tabIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: SalomonBottomBar(
        items: tabs(context),
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}

final tabRoutes = [
  AppRoutes.movies,
  AppRoutes.tickets,
  AppRoutes.favorites,
  AppRoutes.profile
];

tabs(BuildContext context) => [
      SalomonBottomBarItem(
        selectedColor: Theme.of(context).colorScheme.primary,
        unselectedColor: CPColors.grey600,
        icon: const Icon(
          Icons.videocam_outlined,
          size: 20,
        ),
        title: const Text('MOVIES'),
      ),
      SalomonBottomBarItem(
        selectedColor: Theme.of(context).colorScheme.primary,
        unselectedColor: CPColors.grey600,
        icon: const Icon(
          Ionicons.ticket_outline,
          size: 20,
        ),
        title: const Text('TICKETS'),
      ),
      SalomonBottomBarItem(
        selectedColor: Theme.of(context).colorScheme.primary,
        unselectedColor: CPColors.grey600,
        icon: const Icon(
          Ionicons.heart_outline,
          size: 20,
        ),
        title: const Text('FAVOURITES'),
      ),
      SalomonBottomBarItem(
        selectedColor: Theme.of(context).colorScheme.primary,
        unselectedColor: CPColors.grey600,
        icon: const Icon(
          Ionicons.person_outline,
          size: 20,
        ),
        title: const Text('PROFILE'),
      ),
    ];
