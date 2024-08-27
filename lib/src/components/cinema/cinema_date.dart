import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CinemaDate extends StatelessWidget {
  const CinemaDate({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final jDate = Jiffy.parseFromDateTime(date);
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      decoration: BoxDecoration(
          boxShadow: isDark
              ? [
                  BoxShadow(
                    color: CPColors.black.withOpacity(0.7),
                    offset: const Offset(-1, -1),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: CPColors.black.withOpacity(0.7),
                    offset: const Offset(1, -1),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: CPColors.black.withOpacity(0.7),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                  ),
                ]
              : null),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(defaultRadiusSm),
                topRight: Radius.circular(defaultRadiusSm),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CPColors.purple,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  jDate.date.toString(),
                  style: CPTextStyle.caption(context, color: CPColors.grey100),
                ),
                Text(
                  jDate.EEEE,
                  style: CPTextStyle.link(context, color: CPColors.grey100),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(defaultRadiusSm),
                bottomRight: Radius.circular(defaultRadiusSm),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CPColors.grey600,
                  CPColors.grey800,
                ],
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              jDate.Hm,
              style: CPTextStyle.caption(context, color: CPColors.grey100),
            ),
          ),
        ],
      ),
    );
  }
}
