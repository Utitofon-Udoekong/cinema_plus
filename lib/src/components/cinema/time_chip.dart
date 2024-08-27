import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';

class TimeChip extends StatelessWidget {
  const TimeChip({super.key, required this.isSelected, required this.time});

  final bool isSelected;
  final String time;

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      padding: const EdgeInsets.all(8),
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
      child: Text(
        time,
        style: CPTextStyle.caption(context),
      ),
    );
  }
}
