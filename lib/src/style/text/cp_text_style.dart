import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';

enum CPTextStyleEnum { headline, subTitle, body, caption, button, link }

class CPTextStyle {
  static TextStyle from(CPTextStyleEnum style,
      {Color? color,
      double? size,
      FontWeight? weight,
      TextOverflow? overflow,
      TextDecoration? decoration}) {
    switch (style) {
      case CPTextStyleEnum.headline:
        return TextStyle(
          fontSize: size ?? 24.0,
          fontWeight: weight ?? FontWeight.w600,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case CPTextStyleEnum.body:
        return TextStyle(
          fontSize: size ?? 18.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case CPTextStyleEnum.subTitle:
        return TextStyle(
          fontSize: size ?? 16.0,
          fontWeight: weight ?? FontWeight.w500,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case CPTextStyleEnum.caption:
        return TextStyle(
          fontSize: size ?? 14.0,
          fontWeight: weight ?? FontWeight.w500,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case CPTextStyleEnum.button:
        return TextStyle(
          fontSize: size ?? 14.0,
          fontWeight: weight ?? FontWeight.w700,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
      case CPTextStyleEnum.link:
        return TextStyle(
          fontSize: size ?? 12.0,
          fontWeight: weight ?? FontWeight.w400,
          color: color,
          overflow: overflow,
          decoration: decoration,
        );
    }
  }

  static TextStyle headline(BuildContext context, {
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      from(
        CPTextStyleEnum.headline,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        size: size,
        weight: weight,
        overflow: overflow,
        decoration: decoration,
      );
  static TextStyle body(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    TextOverflow? overflow,
    double? size,
    TextDecoration? decoration,
  }) =>
      from(
        CPTextStyleEnum.body,
        color: color ?? Theme.of(context).colorScheme.onSurface,
        weight: weight,
        overflow: overflow,
        size: size,
        decoration: decoration,
      );
  static TextStyle subTitle(BuildContext context, {
    Color? color,
    FontWeight? weight,
    TextOverflow? overflow,
    double? size,
    TextDecoration? decoration,
  }) =>
      from(CPTextStyleEnum.subTitle,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          weight: weight,
          size: size,
          overflow: overflow,
          decoration: decoration);
  static TextStyle caption(BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? size,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      from(CPTextStyleEnum.caption,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          size: size,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle button(BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? size,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      from(CPTextStyleEnum.button,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          size: size,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
  static TextStyle link(BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? size,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      from(CPTextStyleEnum.link,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          size: size,
          weight: weight,
          overflow: overflow,
          decoration: decoration);
}
