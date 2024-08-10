import 'package:cinema_plus/src/components/loader/app_loader_sm.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.isLoading,
    this.ontap, this.gradient,
  });

  final String title;
  final bool isLoading;
  final Gradient? gradient;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : ontap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          gradient: gradient ?? const LinearGradient(
            colors: [CPColors.purple, CPColors.pink],
          ),
        ),
        padding: defaultButtonPadding,
        child: isLoading
            ? const AppLoaderSM()
            : Text(
                title,
                style: CPTextStyle.button(
                  color: CPColors.white,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
