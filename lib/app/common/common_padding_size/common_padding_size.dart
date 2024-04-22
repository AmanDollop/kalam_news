import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonPaddingAndSize {

  static double size20() => 20.px;
  static double size16() => 16.px;
  static double size14() => 14.px;
  static double size12() => 12.px;
  static double size10() => 10.px;

  static EdgeInsets commonScaffoldBodyPadding() => EdgeInsets.symmetric(horizontal: size12(), vertical: size16()+size10());

}
