import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';

class V {
  static String? isEmailValid({required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return PageConstVar.pleaseEnterEmail.tr;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return PageConstVar.pleaseEnterValidEmail.tr;
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
    }
    else if (countryCodeValue) {
      if(countyCode == null || countyCode.isEmpty) {
        return "Please enter country code";
      }
    }
    else {
      return null;
    }
  }

  static String? isPasswordValid({required String? value, String? password = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return PageConstVar.pleaseEnterPassword.tr;
    } else if (value.trim().length < 6) {
      return PageConstVar.passwordLengthGreaterThan6.tr;
    } else if (value.trim().length > 12) {
      return PageConstVar.passwordLengthLessThan12.tr;
    } else if (!RegExp("^(?=.*[a-z])").hasMatch(value)) {
      return PageConstVar.passwordContainAtLeastOneLowercase.tr;
    } else if (!RegExp("^(?=.*[A-Z])").hasMatch(value)) {
      return PageConstVar.passwordContainAtLeastOneUppercase.tr;
    } else if (!RegExp("^(?=.*[@#\$%^&+=]).*\$").hasMatch(value)) {
      return PageConstVar.passwordContainAtLeastOneSpecialCharacter.tr;
    } else if (!RegExp("^(?=.*[0-9])").hasMatch(value)) {
      return PageConstVar.passwordContainAtLeastOneNumericCharacter.tr;
    } else if ((password?.trim().toString() != "Not")) {
      if (password?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return PageConstVar.pleaseEnterCorrectPassword.tr;
      }
    } else {
      return null;
    }
  }

  static String? isConfirmPasswordValid({required String? value, String? password = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return PageConstVar.pleaseEnterConfirmPassword.tr;
    } else if (password?.trim().toString() != "Not") {
      if (password?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return PageConstVar.confirmPasswordNotMatch.tr;
      }
    } else {
      return null;
    }
  }

  static String? isAccountNumberValid({required String? value, String? accountNumber = "Not"}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter re-account number".tr;
    } else if (accountNumber?.trim().toString() != "Not") {
      if (accountNumber?.trim().toString() == value.trim().toString()) {
        return null;
      } else {
        return "Account number not match".tr;
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



  static String? isValidateAadhar({required String? value}) {

    // Regular expression for Aadhar card number (12 digits)
    RegExp aadharRegExp = RegExp(r'^\d{12}$');

    if (value == null  || value.isEmpty) {
      return PageConstVar.pleaseEnterAadharNumber.tr;
    } else if (!aadharRegExp.hasMatch(value)) {
      return PageConstVar.pleaseEnterValidAadharNumber.tr;
    }else {
      return null;
    }
  }

  static String? isValidatePAN({required String? value}) {

    // Regular expression for PAN card number (AAAAA1234A format)
    RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

    if (value == null ||value.isEmpty) {
      return 'Please enter PAN card number';
    } else if (!panRegExp.hasMatch(value)) {
      return 'Invalid PAN card number';
    }else {
      return null;
    }
  }

  static String? isIfscCodeValid({required String? value})
  {
    RegExp ifscRegExp = RegExp(r'^[A-Z]{4}[0][A-Z0-9]{6}$');

    if (value == null ||value.isEmpty) {
      return 'Please enter IFSC code';
    } else if (!ifscRegExp.hasMatch(value)) {
      return 'Invalid IFSC Code';
    }else {
      return null;
    }

  }

}
