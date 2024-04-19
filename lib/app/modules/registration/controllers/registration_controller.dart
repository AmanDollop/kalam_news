import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class RegistrationController extends GetxController {

  final count = 0.obs;

  final referralCodeController = TextEditingController();
  FocusNode referralCodeFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
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

  void clickOnVerifyButtonView() {
    KNPMethods.unFocsKeyBoard();
    Get.toNamed(Routes.REGISTRATION_VERIFICATION,arguments: [referralCodeController.text.trim()]);
  }
}
