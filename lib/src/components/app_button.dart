import 'package:flutter/material.dart';

import 'package:cinema_plus/src/components/loader/app_loader_sm.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.isLoading = false,
    this.ontap,
    this.gradient,
    this.disabled = false,
    this.height = 48
  });

  final String title;
  final double height;
  final bool isLoading;
  final bool disabled;
  final Gradient? gradient;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading || disabled ? null : ontap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: disabled ? CPColors.grey500 : null,
          borderRadius: BorderRadius.circular(defaultRadius),
          gradient: disabled
              ? null
              : gradient ??
                  LinearGradient(
                    colors: [
                      CPColors.purple,
                      Theme.of(context).colorScheme.primary
                    ],
                  ),
        ),
        padding: defaultButtonPadding,
        child: isLoading
            ? const AppLoaderSM()
            : Text(
                title,
                style: CPTextStyle.button(
                  context,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
