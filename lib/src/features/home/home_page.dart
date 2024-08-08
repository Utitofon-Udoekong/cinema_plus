import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.select((AuthCubit bloc) => bloc.state.user.uid);
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return AutoTabsScaffold(
      scaffoldKey: scaffoldKey,
      routes: [
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
    icon: Icon(
      Icons.videocam_outlined,
      size: 20,
    ),
    title: Text('MOVIES'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: Icon(
      Ionicons.ticket_outline,
      size: 20,
    ),
    title: Text('TICKETS'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: Icon(
      Ionicons.tv_outline,
      size: 20,
    ),
    title: Text('CINEMAS'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: Icon(
      Ionicons.heart_outline,
      size: 20,
    ),
    title: Text('FAVOURITES'),
  ),
  SalomonBottomBarItem(
    selectedColor: CPColors.pink,
    unselectedColor: CPColors.grey600,
    icon: Icon(
      Ionicons.person_outline,
      size: 20,
    ),
    title: Text('PROFILE'),
  ),
  // HomeScaffoldNavBarTabItem(
  //   initialLocation: '/explore',
  //   icon: Icon(Icons.tv_outlined),
  //   label: 'CINEMAS',
  // ),
];
