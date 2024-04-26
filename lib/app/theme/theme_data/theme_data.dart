import 'package:flutter/material.dart';
import 'package:kalam_news_publication/app/theme/color/colors.dart';
import 'package:kalam_news_publication/app/theme/text_style/text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppThemeData{

  static ThemeData kNPThemeData({String? fontFamily}){

    return ThemeData(
      fontFamily : fontFamily,
      textTheme : KNPTextThemeLight().myTextStyle(fontFamily: fontFamily),
      primaryColor: KNPLightThemeColor().primary,
      scaffoldBackgroundColor: KNPLightThemeColor().whiteColor,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: KNPLightThemeColor().primary,
          onPrimary: KNPLightThemeColor().primaryColor,
          secondary: KNPLightThemeColor().secondary,
          onSecondary: KNPLightThemeColor().secondaryColor,
          error: KNPLightThemeColor().error,
          onError: KNPLightThemeColor().error,
          background: KNPLightThemeColor().primary,
          onBackground: KNPLightThemeColor().primary,
          surface: KNPLightThemeColor().lightGreyColor,
          onSurface: KNPLightThemeColor().darkGreyColor,
          inversePrimary: KNPLightThemeColor().whiteColor,
          inverseSurface: KNPLightThemeColor().blackColor,
          onInverseSurface: KNPLightThemeColor().textGrayColor,
          tertiary: KNPLightThemeColor().bottomBarColor
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KNPLightThemeColor().primary,
            foregroundColor: KNPLightThemeColor().primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.px),
            ),
            minimumSize: Size(312.px, 52.px),
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.px,color: KNPLightThemeColor().primary),
            borderRadius: BorderRadius.circular(32.px),
          ),
          minimumSize: Size(312.px, 52.px),
        )
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: KNPLightThemeColor().primary,
        circularTrackColor: KNPLightThemeColor().darkGreyColor,
      ),
    );

  }

}