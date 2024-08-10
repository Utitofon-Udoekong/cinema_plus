import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';

const double defaultRadius = 30;
const double defaultRadiusMd = 15;
const double defaultRadiusSm = 10;
const defaultPadding = EdgeInsets.all(10);
const defaultButtonPadding = EdgeInsets.symmetric(vertical: 12);

class AppFormBorder {
  static initial() => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      );
  static focused() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: CPColors.pink,
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

