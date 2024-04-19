import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/common/http/status_code_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class KNPMethods{

  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showSnackBar(
      {required String message,
        Duration? duration,
        bool isFloating = true,
        Color? backgroundColor,
        bool showCloseIcon = false}) {
       backgroundColor = Theme.of(Get.context!).colorScheme.primary;
    // Vibration.vibrate(duration: 500);
    if (isFloating) {
      /*var snackBar = SnackBar(
        elevation: .4,
        showCloseIcon: showCloseIcon,
        closeIconColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(C.radius)),
        content: Text(
          message,
          style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
                fontSize: 14.px,
              ),
        ),
        backgroundColor: backgroundColor,
        margin: EdgeInsets.symmetric(horizontal: C.margin, vertical: C.margin*6),
        behavior: SnackBarBehavior.floating,
        duration: duration ?? const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);*/
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          textColor: Theme.of(Get.context!).colorScheme.inversePrimary,
          fontSize: 12.px
      );
    } else {
      /*var snackBar = SnackBar(
        elevation: .4,
        showCloseIcon: showCloseIcon,
        closeIconColor: Col.inverseSecondary,
        content: Text(
          message,
          style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
                fontSize: 14.px,
              ),
        ),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);*/
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          textColor: Theme.of(Get.context!).colorScheme.inversePrimary,
          fontSize: 12.px
      );
    }
  }

  static void error() {
    // Vibration.vibrate(duration: 500);
    Fluttertoast.showToast(
        msg: 'Something went wrong!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        textColor: Theme.of(Get.context!).colorScheme.inversePrimary,
        fontSize: 12.px
    );
    // showSnackBar(message: 'Something went wrong!');
  }

  static void noInternet() {
    // showSnackBar(message: 'Please check your internet connection');
    Fluttertoast.showToast(
        msg: 'Please check your internet connection',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        textColor: Theme.of(Get.context!).colorScheme.inversePrimary,
        fontSize: 12.px
    );
  }

  ///  flutter pub add internet_connection_checker -- For Check Internet
  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  static Future<bool> checkResponse({required http.Response response, bool wantShowSuccessResponse = false, bool wantShowFailResponse = false, bool wantInternetFailResponse = false}) async {
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    if (await internetConnectionCheckerMethod()) {
      if (response.statusCode == StatusCodeConstant.OK) {
        if (wantShowSuccessResponse) {
          showSnackBar(message: responseMap[ApiConstantVar.message]);
        }
        return true;
      } else if (response.statusCode == StatusCodeConstant.BAD_REQUEST) {
        if (wantShowFailResponse) {
          showSnackBar(message: responseMap[ApiConstantVar.message]);
        }
        return false;
      } else if (response.statusCode == StatusCodeConstant.BAD_GATEWAY) {
        return false;
      } else if (response.statusCode == StatusCodeConstant.REQUEST_TIMEOUT) {
        return false;
      }else if (response.statusCode == StatusCodeConstant.CREATED) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  static MaterialColor getMaterialColor({required Color color}) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

}