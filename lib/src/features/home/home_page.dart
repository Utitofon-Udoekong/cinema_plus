import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';
import 'package:cinema_plus/src/components/movies/film_loading.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return AutoTabsScaffold(
      scaffoldKey: scaffoldKey,
      routes: const [
        MoviesRoute(),
        TicketsRoute(),
        CinemasRoute(),
        FavoritesRoute(),
        ProfileRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          items: tabs,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}

final tabs = [
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: const Icon(
      Icons.videocam_outlined,
      size: 20,
    ),
    title: const Text('MOVIES'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: const Icon(
      Ionicons.ticket_outline,
      size: 20,
    ),
    title: const Text('TICKETS'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: const Icon(
      Ionicons.tv_outline,
      size: 20,
    ),
    title: const Text('CINEMAS'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: const Icon(
      Ionicons.heart_outline,
      size: 20,
    ),
    title: const Text('FAVOURITES'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: const Icon(
      Ionicons.person_outline,
      size: 20,
    ),
    title: const Text('PROFILE'),
  ),
  // HomeScaffoldNavBarTabItem(
  //   initialLocation: '/explore',
  //   icon: Icon(Icons.tv_outlined),
  //   label: 'CINEMAS',
  // ),
];
