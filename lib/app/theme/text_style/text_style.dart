import 'package:flutter/material.dart';
import 'package:kalam_news_publication/app/theme/color/Colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KNPTextTheme {

  static TextStyle displayLarge(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 26.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle displayMedium(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 24.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle displaySmall(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineLarge(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 20.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineMedium(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 18.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineSmall(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelLarge(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelMedium(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelSmall(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 12.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleLarge(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleMedium(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 12.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleSmall(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 10.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyLarge(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyMedium(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodySmall(Color color, {String? fontFamily}) {
    return TextStyle(
      fontSize: 12.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }
}

class KNPTextThemeLight{

  TextTheme myTextStyle({String? fontFamily}) {

    return TextTheme(

      ///TODO FontSize => 20, FontWeight => W700
      displayLarge: KNPTextTheme.headlineLarge(
        KNPLightThemeColor().text,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 18, FontWeight => W700
      displayMedium: KNPTextTheme.headlineMedium(
        KNPLightThemeColor().text,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 16, FontWeight => W700
      displaySmall: KNPTextTheme.headlineSmall(
        KNPLightThemeColor().text,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 20, FontWeight => W700
      headlineLarge: KNPTextTheme.headlineLarge(
        KNPLightThemeColor().whiteColor,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 18, FontWeight => W700
      headlineMedium: KNPTextTheme.headlineMedium(
        KNPLightThemeColor().whiteColor,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 16, FontWeight => W700
      headlineSmall: KNPTextTheme.headlineSmall(
        KNPLightThemeColor().whiteColor,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 16, FontWeight => W500
      bodyLarge: KNPTextTheme.bodyLarge(
        KNPLightThemeColor().text,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 14, FontWeight => W500
      bodyMedium: KNPTextTheme.bodyMedium(
        KNPLightThemeColor().text,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 12, FontWeight => W500
      bodySmall: KNPTextTheme.bodySmall(
        KNPLightThemeColor().text,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 14, FontWeight => W500
      titleLarge: KNPTextTheme.titleLarge(
        KNPLightThemeColor().textGrayColor,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 12, FontWeight => W500
      titleMedium: KNPTextTheme.titleMedium(
        KNPLightThemeColor().textGrayColor,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 10, FontWeight => W500
      titleSmall: KNPTextTheme.titleSmall(
        KNPLightThemeColor().textGrayColor,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 16, FontWeight => W700
      labelLarge: KNPTextTheme.labelLarge(
        KNPLightThemeColor().primary,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 14, FontWeight => W700
      labelMedium: KNPTextTheme.labelMedium(
        KNPLightThemeColor().primary,
        fontFamily: fontFamily
      ),

      ///TODO FontSize => 12, FontWeight => W700
      labelSmall: KNPTextTheme.labelSmall(
        KNPLightThemeColor().primary,
        fontFamily: fontFamily
      ),

    );
  }
}