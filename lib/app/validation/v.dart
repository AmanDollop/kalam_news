import 'package:get/get_utils/src/extensions/internacionalization.dart';

class V {
  static String? isEmailValid({required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter email";
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  static String? isNameValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter name";
    } else if (!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(value)) {
      return "Please enter valid name";
    } else if (value.trim().length > 20) {
      return "Name length less than twenty";
    } else {
      return null;
    }
  }

  static String? isNumberValid({required String? value,bool countryCodeValue = false, String? countyCode,}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter number";
    } else if (value.trim().length < 10 || value.trim().length > 12) {
      return "Please enter valid number";
    } else if (countryCodeValue) {
      if(countyCode == null || countyCode.isEmpty) {
        return "Please enter country code";
      }
    } else {
      return null;
    }
  }

  static String? isPasswordValid({required String? value, String? password = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter password";
    } else if (value.trim().length < 6) {
      return "Password length greater than six";
    } else if (value.trim().length > 12) {
      return "Password length less than twelve";
    } else if (!RegExp("^(?=.*[a-z])").hasMatch(value)) {
      return "Password contain at least one lowercase";
    } else if (!RegExp("^(?=.*[A-Z])").hasMatch(value)) {
      return "Password contain at least one uppercase";
    } else if (!RegExp("^(?=.*[@#\$%^&+=]).*\$").hasMatch(value)) {
      return "Password contain at least one special character";
    } else if (!RegExp("^(?=.*[0-9])").hasMatch(value)) {
      return "Password contain at least one numeric character";
    } else if ((password?.trim().toString() != "Not")) {
      if (password?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return "Please enter correct password";
      }
    } else {
      return null;
    }
  }

  static String? isConfirmPasswordValid(
      {required String? value, String? password = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter confirm password".tr;
    } else if ((password?.trim().toString() != "Not")) {
      if (password?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return "Confirm password not match".tr;
      }
    } else {
      return null;
    }
  }

  static String? isValid({required String? value, required String title, Function? isValid}) {
    if (value == null || value.trim().toString().isEmpty) {
      isValid?.call(true);
      return title;
    } else {
      isValid?.call(false);
      return null;
    }
  }

  static String isPanCardValid(String value) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please Enter Pan Card Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Pan Card Number';
    }
    return "";
  }

  static String isIFSCValid(String value) {
    String pattern = '^[A-Z]{4}0[A-Z0-9]{6}\$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please Enter IFSC';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter valid IFSC';
    }
    return "";
  }

}
