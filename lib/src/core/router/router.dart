import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/authentication/create_account_page.dart';
import 'package:cinema_plus/src/features/authentication/sign_in_page.dart';
import 'package:cinema_plus/src/features/booking/cinema/choose_seat_page.dart';
import 'package:cinema_plus/src/features/booking/cinema/choose_session_page.dart';
import 'package:cinema_plus/src/features/home/favorites/favorites_page.dart';
import 'package:cinema_plus/src/features/home/home_page.dart';
import 'package:cinema_plus/src/features/home/movies/movies_page.dart';
import 'package:cinema_plus/src/features/home/profile/profile_page.dart';
import 'package:cinema_plus/src/features/home/splash_page.dart';
import 'package:cinema_plus/src/features/home/tickets/tickets_page.dart';
import 'package:cinema_plus/src/features/movie_details/details/cast_detail_page.dart';
import 'package:cinema_plus/src/features/movie_details/details/movie_details_page.dart';
import 'package:cinema_plus/src/features/payment/add_card_page.dart';
import 'package:cinema_plus/src/features/payment/booking_confirmed_page.dart';
import 'package:cinema_plus/src/features/payment/payment_methods_page.dart';
import 'package:cinema_plus/src/features/payment/payment_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      builder: (context, state) => const CreateAccountPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.movies,
          pageBuilder: (context, state) => const NoTransitionPage(child: MoviesPage()),
        ),
        GoRoute(
          path: AppRoutes.tickets,
          pageBuilder: (context, state) => const NoTransitionPage(child: TicketsPage()),
        ),
        GoRoute(
          path: AppRoutes.favorites,
          pageBuilder: (context, state) => const NoTransitionPage(child: FavoritesPage()),
        ),
        GoRoute(
          path: AppRoutes.profile,
          pageBuilder: (context, state) => const NoTransitionPage(child: ProfilePage()),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.movieDetail,
      builder: (context, state) => const MovieDetailsPage(),
    ),
    GoRoute(
      path: AppRoutes.castDetail,
      builder: (context, state) => const CastDetailPage(),
    ),
    GoRoute(
      path: AppRoutes.chooseSession,
      builder: (context, state) => const ChooseSessionPage(),
    ),
    GoRoute(
      path: AppRoutes.chooseSeat,
      builder: (context, state) => const ChooseSeatPage(),
    ),
    GoRoute(
      path: AppRoutes.payment,
      builder: (context, state) => const PaymentPage(),
    ),
    GoRoute(
      path: AppRoutes.bookingConfirmed,
      builder: (context, state) => const BookingConfirmedPage(),
    ),
    GoRoute(
      path: AppRoutes.addCard,
      builder: (context, state) => const AddCardPage(),
    ),
    GoRoute(
      path: AppRoutes.paymentMethods,
      builder: (context, state) => const PaymentMethodsPage(),
    ),
  ],
  debugLogDiagnostics: true,
);
