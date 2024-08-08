import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/constants/app_images.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthCubit bloc) => bloc.state.user);
    if (user == AppUser.empty()) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.router.push(const SignInRoute());
      });
    } else {
      context.router.push(const HomeRoute());
    }
    return Scaffold(
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
    );
  }
}
