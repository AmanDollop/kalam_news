import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/referral_user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class RegistrationVerificationController extends GetxController {

  final count = 0.obs;

  final referralCodeController = TextEditingController();
  FocusNode referralCodeFocusNode = FocusNode();
  ReferralUserData? referralUserData;

  final selectRadioValue = '' .obs;

  @override
  void onInit() {
    super.onInit();
    referralUserData = Get.arguments[0];
    referralCodeController.text = referralUserData?.referralCode ?? '';
    if(referralUserData?.left == true && referralUserData?.right == true){
      selectRadioValue.value = "Left";
    }else if(referralUserData?.left == false){
      selectRadioValue.value = "Right";
    }else{
      selectRadioValue.value = "Left";
    }
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
