import 'package:flutter/material.dart';

abstract class KNPColors{

  /* --------------------------Primary Colors Collection--------------------------*/
  Color get primary;

  Color get primaryColor;

  /* --------------------------Secondary Colors Collection--------------------------*/
  Color get secondary;

  Color get secondaryColor;

  /* --------------------------Error / DisabledColor/ IndicatorColor Colors Collection--------------------------*/
  Color get errorColor;

  Color get error;

  /* --------------------------Success Colors Collection--------------------------*/

  Color get success;

  Color get onSuccess;

  /* --------------------------Text Colors Collection--------------------------*/
  Color get text;

  Color get onText;

  Color get textGrayColor;

  /* --------------------------NormalColors Colors Collection--------------------------*/

  Color get darkGreyColor;

  Color get lightGreyColor;

  Color get whiteColor;

  Color get blackColor;

  Color get bottomBarColor;

}

class KNPLightThemeColor extends KNPColors{

  @override
  Color get error => const Color(0xffDA1414);

  @override
  Color get errorColor => throw UnimplementedError();

  @override
  Color get onSuccess => throw UnimplementedError();

  @override
  Color get onText => throw UnimplementedError();

  @override
  Color get primary => const Color(0xff2563EB);

  @override
  Color get primaryColor => const Color(0xff94A3B8);

  @override
  Color get secondary => const Color(0xff262626);

  @override
  Color get secondaryColor => const Color(0xffD1D1D1);

  @override
  Color get success => throw UnimplementedError();

  @override
  Color get text => const Color(0xff262626);

  @override
  Color get textGrayColor => const Color(0xff858585);

  @override
  Color get darkGreyColor => const Color(0xffB0B0B0);

  @override
  Color get lightGreyColor => const Color(0xffF6F6F6);

  @override
  Color get blackColor => const Color(0xff000000);

  @override
  Color get whiteColor => const Color(0xffFFFFFF);

  @override
  Color get bottomBarColor => const Color(0xff0F172A);

}