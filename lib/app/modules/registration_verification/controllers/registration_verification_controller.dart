import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class RegistrationVerificationController extends GetxController {

  final count = 0.obs;

  final referralCodeController = TextEditingController();
  FocusNode referralCodeFocusNode = FocusNode();

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
    Get.toNamed(Routes.PERSONAL_DETAILS);
  }
}
