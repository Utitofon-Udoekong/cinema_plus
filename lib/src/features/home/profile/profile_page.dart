import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart' show PageHeader, AppButton;
import 'package:cinema_plus/src/constants/constants.dart' show AppRoutes, defaultPadding;
import 'package:cinema_plus/src/features/home/profile/cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = AdaptiveTheme.of(context).mode;
    return Scaffold(
      appBar: const PageHeader(
        title: 'Profile',
        showBack: false,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (p, c) => c.success == 'Logged out',
        listener: (context, state) {
          context.go(AppRoutes.signIn);
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.account_circle, size: 30),
                        title: Text(
                            context.read<ProfileCubit>().currentUser.email),
                        subtitle: Text(
                            'ID: ${context.read<ProfileCubit>().currentUser.userId}'),
                      ),
                      ListTile(
                        title: const Text('Payment methods'),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                        onTap: () => context.push(AppRoutes.paymentMethods),
                      ),
                      // SwitchListTile.adaptive(
                      //   value: themeMode.isSystem,
                      //   title: const Text('Use system settings'),
                      //   onChanged: (value) =>
                      //       AdaptiveTheme.of(context).setSystem(),
                      // ),
                      SwitchListTile.adaptive(
                        value: themeMode.isLight,
                        title: Text(themeMode.isLight
                            ? 'Light theme'
                            : 'Dark theme'),
                        onChanged: (value) {
                          if (value) {
                            AdaptiveTheme.of(context).setLight();
                          } else {
                            AdaptiveTheme.of(context).setDark();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: defaultPadding,
                  child: AppButton(
                    title: 'LOGOUT',
                    isLoading: state.isLoading,
                    ontap: () {
                      context.read<ProfileCubit>().logout();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
