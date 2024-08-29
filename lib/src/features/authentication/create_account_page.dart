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

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final password =
        context.select((AuthCubit bloc) => bloc.state.password.value);
    RegExp alphaRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])');
    RegExp numberRegex = RegExp(r'[0-9]');
    RegExp specialRegex = RegExp(r'[@$!%*?&]');
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.go(AppRoutes.movies);
        } else if (state.status.isFailure) {
          CPSnackbar.showError(
              context, state.errorMessage ?? 'Sign Up Failure');
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
                        fontWeight: FontWeight.w900, fontSize: 32, height: 0.8),
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
                          color: CPColors.white),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contains a lowercase and uppercase letter',
                              style: CPTextStyle.link(context,
                                  color: alphaRegex.hasMatch(password)
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            Text(
                              'Contains a number',
                              style: CPTextStyle.link(context,
                                  color: numberRegex.hasMatch(password)
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            Text(
                              'Contains a special character',
                              style: CPTextStyle.link(context,
                                  color: specialRegex.hasMatch(password)
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            Text(
                              'is atleast 8 characters',
                              style: CPTextStyle.link(context,
                                  color: password.length >= 8
                                      ? Colors.green
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      _ConfirmPasswordInput(),
                      const Gap(20),
                      _SignUpButton(),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: CPTextStyle.caption(context,
                                color: CPColors.grey600),
                          ),
                          const Gap(5),
                          GestureDetector(
                            onTap: () => context.push(AppRoutes.signIn),
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
                                'Sign In',
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
          hint: AppStrings.createAccount['email']!,
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
          hint: AppStrings.createAccount['password']!,
          errorText:
              state.password.displayError != null ? 'invalid password' : null,
          textInputAction: TextInputAction.next,
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

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword ||
          previous.obscureText != current.obscureText,
      builder: (context, state) {
        return AppTextField(
            key: const Key('signUpForm_confirmedPasswordInput_textField'),
            hint: AppStrings.createAccount['confirmPassword']!,
            errorText: state.confirmedPassword.displayError != null
                ? 'passwords do not match'
                : null,
            textInputAction: TextInputAction.done,
            obscureText: state.obscureText,
            suffix: IconButton(
              onPressed: () => context.read<AuthCubit>().obscureText(),
              padding: EdgeInsets.zero,
              icon: Icon(
                state.obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            onChanged: (confirmPassword) => context
                .read<AuthCubit>()
                .confirmedPasswordChanged(confirmPassword));
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return AppButton(
          title: AppStrings.createAccount['btn']!,
          isLoading: state.status.isInProgress,
          ontap:
              state.isValid ? () => context.read<AuthCubit>().signUp() : null,
        );
      },
    );
  }
}
