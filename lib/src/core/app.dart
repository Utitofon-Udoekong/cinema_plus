// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cinema_plus/src/core/injections.dart';
import 'package:cinema_plus/src/core/router/router.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/features/home/favorites/cubit/favourite_cubit.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/features/home/profile/cubit/profile_cubit.dart';
import 'package:cinema_plus/src/features/home/tickets/cubit/ticket_cubit.dart';
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';
import 'package:cinema_plus/src/features/search/cubit/search_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:cinema_plus/src/style/theme/cp_theme.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({
    super.key,
    this.savedThemeMode,
  });

  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<MovieCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<BookingCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<PaymentCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<TicketCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<FavouriteCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<SearchCubit>(),
        ),
      ],
      child: AdaptiveTheme(
          light: CPThemeData.lightThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          dark: CPThemeData.darkThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder: (theme, darkTheme) {
            return MaterialApp.router(
              title: 'Cinema Plus',
              debugShowCheckedModeBanner: false,
              darkTheme: darkTheme,
              theme: theme,
              themeMode: ThemeMode.system,
              routerConfig: appRouter,
            );
          }),
    );
  }
}
