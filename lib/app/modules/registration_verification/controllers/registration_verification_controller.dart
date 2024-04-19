import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class RegistrationVerificationController extends GetxController {

  final count = 0.obs;

  final referralCodeController = TextEditingController();
  FocusNode referralCodeFocusNode = FocusNode();

  final selectRadioValue = '' .obs;

  @override
  void onInit() {
    super.onInit();
    referralCodeController.text = Get.arguments[0];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void clickOnProceedButtonView() {
    if(selectRadioValue.value == ""){
      KNPMethods.showSnackBar(message: 'Please select which way do you want to go?');
    }
    else{
      Get.toNamed(Routes.PERSONAL_DETAILS,arguments: [selectRadioValue.value,referralCodeController.text.trim().toString()]);
    }
  }
}
