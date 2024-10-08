import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.read<AuthCubit>().reset();
          context.go(AppRoutes.movies);
        } else if (state.status.isFailure) {
          CPSnackbar.showError(
              context, state.errorMessage ?? 'Sign In Failure');
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
            Positioned.directional(
              top: (height / 2) - 80,
              start: 20,
              textDirection: TextDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cinema',
                     style: GoogleFonts.archivoBlack().copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                      height: 0.8,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.primary
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.modulate,
                    child: Text(
                      'Plus+',
                      style: GoogleFonts.archivoBlack().copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: CPColors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: defaultPadding,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius),
                      topRight: Radius.circular(defaultRadius),
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _EmailInput(),
                      const Gap(10),
                      _PasswordInput(),
                      const Gap(20),
                      _SignInButton(),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New at CinemaPlus?',
                            style: CPTextStyle.caption(context,
                                color: CPColors.grey600),
                          ),
                          const Gap(5),
                          GestureDetector(
                            onTap: () => context.push(AppRoutes.signUp),
                            child: ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.secondary,
                                    Theme.of(context).colorScheme.primary
                                  ],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.modulate,
                              child: Text(
                                'Create Account',
                                style: CPTextStyle.caption(context,
                                    color: CPColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AppTextField(
          key: const Key('loginForm_emailInput_textField'),
          hint: AppStrings.signIn['email']!,
          keyboardType: TextInputType.emailAddress,
          errorText: state.email.displayError != null ? 'invalid email' : null,
          textInputAction: TextInputAction.next,
          onChanged: (email) => context.read<AuthCubit>().emailChanged(email),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return AppTextField(
          key: const Key('loginForm_passwordInput_textField'),
          hint: AppStrings.signIn['password']!,
          errorText:
              state.password.displayError != null ? 'invalid password' : null,
          textInputAction: TextInputAction.done,
          obscureText: state.obscureText,
          suffix: IconButton(
            onPressed: () => context.read<AuthCubit>().obscureText(),
            padding: EdgeInsets.zero,
            icon: Icon(
              state.obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          onChanged: (password) =>
              context.read<AuthCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AppButton(
          title: AppStrings.signIn['btn']!,
          isLoading: state.status.isInProgress,
          ontap: state.isValid
              ? () => context.read<AuthCubit>().logInWithCredentials()
              : null,
        );
      },
    );
  }
}
