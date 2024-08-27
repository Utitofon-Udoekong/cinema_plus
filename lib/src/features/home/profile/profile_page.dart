import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/components/components.dart' show PageHeader;
import 'package:cinema_plus/src/constants/constants.dart' show AppRoutes;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = AdaptiveTheme.of(context).mode;
    return Scaffold(
      appBar: const PageHeader(title: 'Profile', showBack: false,),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Payment methods'),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () => context.push(AppRoutes.paymentMethods),
                  ),
                  SwitchListTile.adaptive(
                    value: themeMode.isSystem,
                    title: const Text('Use system settings'),
                    onChanged: (value) => AdaptiveTheme.of(context).setSystem(),
                  ),
                  SwitchListTile.adaptive(
                    value: themeMode.isLight,
                    title: Text(themeMode.isLight ? 'Light theme' : themeMode.isSystem ? 'System theme' : 'Dark theme'),
                    onChanged: (value) {
                      if (value) {
                        print("set light");
                        AdaptiveTheme.of(context).setLight();
                      } else {
                        AdaptiveTheme.of(context).setDark();
                        print("set dark");
                      }
                    },
                  ),
                ],
              ),
            ),
            // AppBu
          ],
        ),
      ),
    );
  }
}
