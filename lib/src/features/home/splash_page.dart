import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      // listenWhen: (p,c) => c.user != AppUser.empty(),
      listener: (context, state) {
        if (state.user == AppUser.empty()) {
          Future.delayed(const Duration(milliseconds: 500), () {
            context.go(AppRoutes.signIn);
          });
        } else {
          context.go(AppRoutes.movies);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.background,
                color: Theme.of(context).colorScheme.surface,
                colorBlendMode: BlendMode.color,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
