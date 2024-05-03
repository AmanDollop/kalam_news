import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/referral_user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class RegistrationController extends GetxController {

  final count = 0.obs;
  final buttonValue = false.obs;
  final key = GlobalKey<FormState>();

  final referralCodeController = TextEditingController();
  FocusNode referralCodeFocusNode = FocusNode();

  final referralUserDataModal = Rxn<ReferralUserDataModal>();
  ReferralUserData? referralUserData;
  Map<String, dynamic> bodyParams = {};

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

  Future<void> clickOnVerifyButtonView() async {
    KNPMethods.unFocsKeyBoard();
    if(key.currentState!.validate()){
      await callingReferralApi();
    }
  }

  Future<void> callingReferralApi() async {
    try{
      buttonValue.value = true;
      bodyParams = {
        ApiConstantVar.referralCode : referralCodeController.text.trim().toString(),
      };
      referralUserDataModal.value = await ApiIntrigation.referralUserDataApi(bodyParams: bodyParams);
      if(referralUserDataModal.value != null){
        print(referralUserDataModal.value?.message);
        referralUserData = referralUserDataModal.value?.referralUserData;
        Get.toNamed(Routes.REGISTRATION_VERIFICATION,arguments: [referralUserData]);
        buttonValue.value = false;
      }
      else{
        buttonValue.value = false;
      }
    }catch(e){
      KNPMethods.error();
      print('callingLoginApi:::: ERROR::::  $e');
      buttonValue.value = false;
    }
  }

}
