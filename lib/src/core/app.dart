import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cinema_plus/src/core/injections.dart';
import 'package:cinema_plus/src/core/router/router.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/style/theme/cp_theme.dart';

class AppBuilder extends StatelessWidget {
  AppBuilder({super.key});

  final _appRouter = locator<AppRouter>();

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
      ],
      child: MaterialApp.router(
        title: 'Cinema Plus',
        debugShowCheckedModeBanner: false,
        darkTheme: CPThemeData.darkThemeData(
          GoogleFonts.poppinsTextTheme(),
        ),
        theme: CPThemeData.lightThemeData(
          GoogleFonts.poppinsTextTheme(),
        ),
        themeMode: ThemeMode.dark,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
