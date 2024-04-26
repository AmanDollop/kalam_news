import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';

class KycApplicationController extends GetxController {

  final count = 0.obs;
  final apiResValue = true.obs;

  UserDataModal? userData;

  final aadharCardNumberController = TextEditingController();
  FocusNode aadharCardNumberFocusNode = FocusNode();

  final panCardNumberController = TextEditingController();
  FocusNode panCardNumberFocusNode = FocusNode();


  @override
  void onInit() {
    super.onInit();
    userData = Get.arguments[0];
    apiResValue.value = false;
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

  void clickOnUploadProfilePicture() {}

  void clickOnAadharCardFrontSide() {}

  void clickOnAadharCardBackSide() {}

  void clickOnPanCardPhoto() {}

  void clickOnUpdateBankDetails() {}

  void clickOnSubmitButton() {}
}
