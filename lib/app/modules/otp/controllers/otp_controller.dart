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
import 'package:http/http.dart' as http;

class OtpController extends GetxController {

  final count = 0.obs;
  final pageName = ''.obs;
  final mobileNumber = ''.obs;

  final key = GlobalKey<FormState>();

  final otpController = TextEditingController();

  final timer = false.obs;

  final verifyButtonValue = false.obs;

  Map<String, dynamic> bodyParamsSendOtp = {};

  final userDataModal = Rxn<UserDataModal>();
  Map<String, dynamic> bodyParamsMatchOtp = {};

  @override
  void onInit() {
    super.onInit();
    pageName.value = Get.arguments[0];
    mobileNumber.value = Get.arguments[1];
    otpController.text = Get.arguments[2];
    print('pageName:::::  ${pageName.value}');
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

  Future<void> callingSendOtpApi() async {
    try{
      bodyParamsSendOtp = {
        ApiConstantVar.mobileNumber : mobileNumber.value,
      };
      http.Response? res = await ApiIntrigation.sendOtpApi(bodyParams: bodyParamsSendOtp);
      if(res != null && res.statusCode == 200){
        Map<String, dynamic> responseMap = jsonDecode(res.body);
        otpController.text = '${responseMap[ApiConstantVar.otp]}';
      }
    }catch(e){
      KNPMethods.error();
      print('callingSendOtpApi:::: ERROR::::  $e');
    }
  }

  Future<void> callingMatchOtpApi({required String otpValue}) async {
    try{
      verifyButtonValue.value = true;
      bodyParamsMatchOtp = {
        ApiConstantVar.mobileNumber : mobileNumber.value,
        ApiConstantVar.otp : otpValue,
        ApiConstantVar.otpType : pageName.value == 'Personal Details'
            ? 'registration'
            : 'forgotPassword',
      };
      userDataModal.value = await ApiIntrigation.matchOtp(bodyParams: bodyParamsMatchOtp);
      if(userDataModal.value != null){
        if(pageName.value == 'Personal Details'){
          await DataBaseHelper().insertInDataBase(data: {DataBaseConstant.userDetail: json.encode(userDataModal.value)}, tableName: DataBaseConstant.tableNameForUserDetail);
          selectedBottomNavigationIndex.value = 0;
          Get.offAllNamed(Routes.BOTTOM_BAR);
        }
        else{
          Get.toNamed(Routes.NEW_PASSWORD,arguments: ['Set new password',mobileNumber.value]);
        }
        verifyButtonValue.value = false;
      }
      else{
        verifyButtonValue.value = false;
      }
    }catch(e){
      KNPMethods.error();
      print('callingMatchOtpApi:::: ERROR::::  $e');
      verifyButtonValue.value = false;
    }
  }

  Future<void> clickOnVerifyButtonView() async {
    KNPMethods.unFocsKeyBoard();
    if(key.currentState!.validate()){
      await callingMatchOtpApi(otpValue: otpController.text.trim().toString());
    }
  }

}
