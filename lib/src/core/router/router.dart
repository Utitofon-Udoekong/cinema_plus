import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/features/authentication/create_account_page.dart';
import 'package:cinema_plus/src/features/authentication/sign_in_page.dart';
import 'package:cinema_plus/src/features/booking/cinema/choose_seat_page.dart';
import 'package:flutter/material.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: CreateAccountRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: MoviesRoute.page),
            AutoRoute(page: CinemasRoute.page),
            AutoRoute(page: TicketsRoute.page),
            AutoRoute(page: FavoritesRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: MovieDetailsRoute.page),
        AutoRoute(page: CastDetailRoute.page),
        AutoRoute(page: ChooseSessionRoute.page),
        AutoRoute(page: ChooseSeatRoute.page),
      ];
}
