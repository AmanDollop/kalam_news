import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class LogInController extends GetxController {

  final count = 0.obs;

  final key = GlobalKey<FormState>();

  final emailAndMobileNumberController = TextEditingController();
  FocusNode emailMobileNumberFocusNode = FocusNode();

  final passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final passwordVisible = false.obs;

  final loginButtonValue = false.obs;
  final rememberMeValue = false.obs;

  final userDataModal = Rxn<UserDataModal>();
  Map<String, dynamic> bodyParamsLogin = {};

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

  void clickOnForgetPasswordButton() {
    KNPMethods.unFocsKeyBoard();
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  Future<void> clickOnLogInButtonView() async {
    KNPMethods.unFocsKeyBoard();
    if(key.currentState!.validate() && rememberMeValue.value){
      await callingLoginApi();
    }
  }

  void clickOnRegisteredNowButton() {
    KNPMethods.unFocsKeyBoard();
    Get.toNamed(Routes.REGISTRATION);
  }

  Future<void> callingLoginApi() async {
    try{
      loginButtonValue.value = true;
      bodyParamsLogin = {
        ApiConstantVar.mobileNumber : emailAndMobileNumberController.text.trim().toString(),
        ApiConstantVar.password : passwordController.text.trim().toString(),
      };
      userDataModal.value = await ApiIntrigation.loginApi(bodyParams: bodyParamsLogin);
      if(userDataModal.value != null){
        await DataBaseHelper().insertInDataBase(data: {DataBaseConstant.userDetail: json.encode(userDataModal.value)}, tableName: DataBaseConstant.tableNameForUserDetail);
        selectedBottomNavigationIndex.value = 0;
        Get.offAllNamed(Routes.BOTTOM_BAR);
        loginButtonValue.value = false;
      }
      else{
        loginButtonValue.value = false;
      }
    }catch(e){
      KNPMethods.error();
      print('callingLoginApi:::: ERROR::::  $e');
      loginButtonValue.value = false;
    }
  }

}
