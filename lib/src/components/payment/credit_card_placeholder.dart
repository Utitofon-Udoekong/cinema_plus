import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class CreditCardPlaceholder extends StatelessWidget {
  const CreditCardPlaceholder({
    super.key,
    this.cardType,
    required this.focusEXP,
    required this.focusCVV,
    required this.focusCardNumber,
    required this.focusCardName,
  });

  final IconData? cardType;
  final bool focusEXP;
  final bool focusCVV;
  final bool focusCardNumber;
  final bool focusCardName;
  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      height: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? null : CPColors.grey200,
        // border: Border.all(color: CPColors.grey500),
        borderRadius: BorderRadius.circular(defaultRadiusMd),
        gradient: isDark
            ? const LinearGradient(colors: [
                CPColors.grey700,
                CPColors.grey800,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
        boxShadow: isDark
            ? [
                BoxShadow(
                    color: CPColors.black.withOpacity(0.7),
                    offset: const Offset(0, 0),
                    spreadRadius: 5,
                    blurRadius: 8)
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _CardPill(
                width: 50,
                height: 40,
              ),
              Icon(
                cardType ?? Ionicons.card,
                color: CPColors.grey400,
              )
            ],
          ),
          // CARD NUMBER
          _ActiveShader(
            focus: focusCardNumber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  4,
                  (index) => const _CardPill(
                        width: 60,
                      )),
            ),
          ),
          // CARD NAME
          _ActiveShader(
            focus: focusCardName,
            child: const _CardPill(
              width: double.infinity,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // EXP
              _ActiveShader(
                focus: focusEXP,
                child: const Row(
                  children: [
                    _CardPill(
                      width: 50,
                    ),
                    Gap(5),
                    _CardPill(
                      width: 70,
                    ),
                  ],
                ),
              ),
              // CVV
              _ActiveShader(
                focus: focusCVV,
                child: const Row(
                  children: [
                    _CardPill(
                      width: 30,
                    ),
                    Gap(5),
                    _CardPill(
                      width: 30,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ActiveShader extends StatelessWidget {
  const _ActiveShader({super.key, required this.child, required this.focus});

  final Widget child;
  final bool focus;

  @override
  Widget build(BuildContext context) {
    return focus
        ? Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            foregroundDecoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(defaultRadiusSm),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
            alignment: Alignment.center,
            child: child,
          )
        : child;
  }
}

class _CardPill extends StatelessWidget {
  final double? width;
  final double? height;

  const _CardPill({super.key, this.width = 20, this.height = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadiusSm),
          color: CPColors.grey400.withOpacity(0.8)),
    );
  }
}
