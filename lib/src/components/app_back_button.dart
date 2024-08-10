import 'package:auto_route/auto_route.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => context.maybePop(),
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      label: Text(
        'Back',
        style: CPTextStyle.caption(color: CPColors.grey100),
      ),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: CPColors.grey100,
        size: 14,
      ),
    );
  }
}
