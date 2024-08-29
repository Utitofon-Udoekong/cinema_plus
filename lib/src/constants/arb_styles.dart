import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';

const double defaultRadius = 30;
const double defaultRadiusMd = 15;
const double defaultRadiusSm = 10;
const noBorder = Border.fromBorderSide(BorderSide.none);
const defaultPadding = EdgeInsets.all(15);
const defaultButtonPadding = EdgeInsets.symmetric(vertical: 12);
const lightShadow = [
  BoxShadow(
    color: CPColors.grey200,
    offset: Offset(-1, 0),
    blurRadius: 5,
  ),
  BoxShadow(
    color: CPColors.grey300,
    offset: Offset(1, 0),
    blurRadius: 5,
  ),
];
const darkShadow = [
  BoxShadow(
    color: CPColors.grey400,
    offset: Offset(-1, 0),
    blurRadius: 8,
  ),
  BoxShadow(
    color: CPColors.black,
    offset: Offset(1, 0),
    blurRadius: 8,
  ),
];

class AppFormBorder {
  static initial() => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      );
  static focused(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      );
  static error() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: CPColors.error,
        ),
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      );
  static disabled() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: CPColors.grey600,
        ),
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      );
}
