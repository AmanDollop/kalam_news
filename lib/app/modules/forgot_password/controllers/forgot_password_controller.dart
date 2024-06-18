import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {

  final count = 0.obs;

  final key = GlobalKey<FormState>();

  final emailAndMobileNumberController = TextEditingController();
  FocusNode emailMobileNumberFocusNode = FocusNode();

  final sendOtpButtonValue = false.obs;

  Map<String, dynamic> bodyParamsSendOtp = {};

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

  Future<void> clickOnSendOtpButtonView() async {
    KNPMethods.unFocsKeyBoard();
    if(key.currentState!.validate()) {
      await callingSendOtpApi();
    }
  }

  Future<void> callingSendOtpApi() async {
    try{
      sendOtpButtonValue.value = true;
      bodyParamsSendOtp = {
        ApiConstantVar.mobileNumber : emailAndMobileNumberController.text.trim().toString(),
      };
      http.Response? res = await ApiIntrigation.forgotPasswordApi(bodyParams: bodyParamsSendOtp);
      if(res != null && res.statusCode == 200){
        Map<String, dynamic> responseMap = jsonDecode(res.body);
        Get.toNamed(Routes.OTP,arguments: [PageConstVar.forgotPassword.tr,emailAndMobileNumberController.text.trim().toString(),'${responseMap[ApiConstantVar.otp]}']);
        sendOtpButtonValue.value = false;
      }
      else{
        sendOtpButtonValue.value = false;
      }
    }catch(e){
      KNPMethods.error();
      print('callingSendOtpApi:::: ERROR::::  $e');
      sendOtpButtonValue.value = false;
    }
  }

}
