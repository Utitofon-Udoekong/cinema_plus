import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.onChanged,
    this.errorText,
    this.keyboardType,
  });

  final String hint;
  final String? errorText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: AppFormBorder.initial(),
          filled: true,
          fillColor: CPColors.grey800,
          disabledBorder: AppFormBorder.disabled(),
          errorBorder: AppFormBorder.error(),
          focusedErrorBorder: AppFormBorder.error(),
          focusedBorder: AppFormBorder.focused(),
          hintText: hint,
          errorText: errorText,
          hintStyle: CPTextStyle.body(context, color: CPColors.grey600),
          contentPadding:
              EdgeInsets.zero + const EdgeInsets.symmetric(horizontal: 20)),
      keyboardType: keyboardType,
      cursorColor: CPColors.pink,
      onChanged: onChanged,
    );
  }
}
