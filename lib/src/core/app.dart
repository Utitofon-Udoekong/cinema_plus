import 'package:cinema_plus/src/core/injections.dart';
import 'package:cinema_plus/src/core/router/router.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/style/theme/cp_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AuthCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Cinema Plus',
        debugShowCheckedModeBanner: false,
        darkTheme: CPThemeData().darkThemeData,
        theme: CPThemeData().lightThemeData,
        themeMode: ThemeMode.dark,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
