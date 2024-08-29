import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.onChanged,
    this.errorText,
    this.keyboardType,
    this.prefixIcon,
    this.controller,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.suffix,
    this.obscureText = false,
  });

  final String hint;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: AppFormBorder.initial(),
        filled: true,
        fillColor: isDark ? CPColors.grey800 : CPColors.grey200,
        disabledBorder: AppFormBorder.disabled(),
        errorBorder: AppFormBorder.error(),
        focusedErrorBorder: AppFormBorder.error(),
        focusedBorder: AppFormBorder.focused(context),
        hintText: hint,
        errorText: errorText,
        hintStyle: CPTextStyle.subTitle(context, color: CPColors.grey600),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      style: CPTextStyle.subTitle(
        context,
      ),
      cursorColor: Theme.of(context).colorScheme.primary,
      onChanged: onChanged,
      textInputAction: textInputAction,
    );
  }
}
