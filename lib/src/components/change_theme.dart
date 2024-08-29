import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = AdaptiveTheme.of(context).mode;
    return SwitchListTile.adaptive(
      value: themeMode.isLight,
      title: Text(themeMode.isLight ? 'Light theme' : 'Dark theme'),
      onChanged: (value) {
        if (value) {
          AdaptiveTheme.of(context).setLight();
        } else {
          AdaptiveTheme.of(context).setDark();
        }
      },
    );
  }
}
