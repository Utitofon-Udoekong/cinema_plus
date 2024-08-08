import 'package:flutter/material.dart';

class CPColor extends Color {
  const CPColor._(super.value);
}

class CPColors {
  static const purple = CPColor._(0xFFAF38D4);
  static const pink = CPColor._(0xFFFF3266);
  static const white = CPColor._(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const grey900 = CPColor._(0XFF141420);
  static const grey800 = CPColor._(0XFF242333);
  static const grey700 = CPColor._(0XFF35364B);
  static const grey600 = CPColor._(0XFF474654);
  static const grey500 = CPColor._(0XFF4D4D57);
  static const grey400 = CPColor._(0XFF71717B);
  static const grey100 = CPColor._(0xFFFAFBFB);

  static const error = CPColor._(0xFFFF5252);
  static const onError = Color(0xFFFFFFFF);
}

const _primaryLight = CPColors.pink;
const _onPrimaryLight = CPColors.white;
const _secondaryLight = CPColors.purple;
const _onSecondaryLight = CPColors.white;
const _surfaceLight = CPColors.grey100;
const _onSurfaceLight = CPColors.grey900;

const _primaryDark = CPColors.pink;
const _onPrimaryDark = CPColors.white;
const _secondaryDark = CPColors.purple;
const _onSecondaryDark = CPColors.white;
const _surfaceDark = CPColors.grey900;
const _onSurfaceDark = CPColors.white;

class CPColorSchemeData {
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: _primaryLight,
    onPrimary: _onPrimaryLight,
    secondary: _secondaryLight,
    onSecondary: _onSecondaryLight,
    surface: _surfaceLight,
    onSurface: _onSurfaceLight,
    error: CPColors.error,
    onError: CPColors.onError,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: _primaryDark,
    onPrimary: _onPrimaryDark,
    secondary: _secondaryDark,
    onSecondary: _onSecondaryDark,
    surface: _surfaceDark,
    onSurface: _onSurfaceDark,
    error: CPColors.error,
    onError: CPColors.onError,
    brightness: Brightness.dark,
  );
}
