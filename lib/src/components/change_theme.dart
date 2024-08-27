import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
                  value: AdaptiveTheme.of(context).mode.isLight,
                  onChanged: (value) {
                    if (value) {
                      print("set light");
                      AdaptiveTheme.of(context).setLight();
                    } else {
                      AdaptiveTheme.of(context).setDark();
                      print("set dark");
                    }
                  },
                );
  }
}