import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DateChip extends StatelessWidget {
  const DateChip({super.key, required this.isSelected, required this.date});

  final bool isSelected;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final jDate = Jiffy.parseFromDateTime(date);
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      padding: const EdgeInsets.all(5),
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
        border: Border.all(color: Theme.of(context).colorScheme.primaryContainer),
        borderRadius: BorderRadius.circular(defaultRadiusSm),
        gradient: isSelected
            ? isDark ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CPColors.grey400,
                  CPColors.grey700,
                ],
              ) : null
            : null,
        boxShadow: isSelected
            ? isDark ? darkShadow : lightShadow
            : null,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            jDate.date.toString(),
            style: CPTextStyle.caption(context),
          ),
          Text(
            jDate.EEEE.toUpperCase(),
            style: CPTextStyle.link(context),
          ),
        ],
      ),
    );
  }
}
