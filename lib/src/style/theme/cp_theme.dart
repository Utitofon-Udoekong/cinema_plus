import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';

class CPThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData _themeData(
    ColorScheme colorScheme,
    Color focusColor,
    Brightness brightness, [
    TextTheme? textTheme,
    BottomSheetThemeData? bottomSheetTheme,
    AppBarTheme? appBarTheme,
    VisualDensity? visualDensity,
  ]) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      brightness: brightness,
      textTheme: textTheme,
      bottomSheetTheme: bottomSheetTheme,
      appBarTheme: appBarTheme,
      visualDensity: visualDensity,
    );
  }

  static ThemeData lightThemeData([
    TextTheme? textTheme,
    BottomSheetThemeData? bottomSheetTheme,
    AppBarTheme? appBarTheme,
    VisualDensity? visualDensity,
  ]) =>
      _themeData(
        CPColorSchemeData.lightColorScheme,
        _lightFocusColor,
        Brightness.light,
        textTheme,
        bottomSheetTheme,
        appBarTheme,
        visualDensity,
      );

  static ThemeData darkThemeData([
    TextTheme? textTheme,
    BottomSheetThemeData? bottomSheetTheme,
    AppBarTheme? appBarTheme,
    VisualDensity? visualDensity,
  ]) => _themeData(
    CPColorSchemeData.darkColorScheme,
    _darkFocusColor,
    Brightness.dark,
    textTheme,
    bottomSheetTheme,
    appBarTheme,
    visualDensity,
  );
}
