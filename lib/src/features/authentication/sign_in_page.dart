import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/components/app_button.dart';
import 'package:cinema_plus/src/components/app_text_field.dart';
import 'package:cinema_plus/src/constants/app_images.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/features/authentication/cubit/auth_cubit.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          print("----------------success----------------");
          context.router.push(const HomeRoute());
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign In Failure')),
            );
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
                  const Text(
                    'Cinema',
                    style: TextStyle(
                        color: CPColors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        height: 0),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [CPColors.purple, CPColors.pink],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.modulate,
                    child: const Text(
                      'Plus+',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 32,
                          height: 0),
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
                            style: CPTextStyle.caption(color: CPColors.grey600),
                          ),
                          const Gap(5),
                          GestureDetector(
                            onTap: () =>
                                context.router.push(const CreateAccountRoute()),
                            child: ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    colors: [CPColors.purple, CPColors.pink],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.modulate,
                                child: Text('Create Account',
                                    style: CPTextStyle.caption(
                                        color: Colors.white))),
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
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return AppTextField(
          key: const Key('loginForm_passwordInput_textField'),
          hint: AppStrings.signIn['password']!,
          errorText:
              state.password.displayError != null ? 'invalid password' : null,
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
