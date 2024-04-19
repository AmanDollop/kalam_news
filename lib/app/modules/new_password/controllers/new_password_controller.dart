import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class NewPasswordController extends GetxController {

  final count = 0.obs;
  final mobileNumber = ''.obs;

  final key = GlobalKey<FormState>();

  final newPasswordController = TextEditingController();
  FocusNode newPasswordFocusNode = FocusNode();

  final confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  final upDateButtonValue = false.obs;
  Map<String, dynamic> bodyParamsResetPassword = {};

  @override
  void onInit() {
    super.onInit();
    mobileNumber.value = Get.arguments[0];
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

  Future<void> clickOnUpDateButtonView() async {
    KNPMethods.unFocsKeyBoard();
    if(key.currentState!.validate()){
      await callingResetPassword();
    }
  }

  Future<void> callingResetPassword() async {
    try{
      upDateButtonValue.value = true;
      bodyParamsResetPassword = {
        ApiConstantVar.mobileNumber : mobileNumber.value,
        ApiConstantVar.password : confirmPasswordController.text.trim().toString(),
      };
      http.Response? res = await ApiIntrigation.resetPassword(bodyParams: bodyParamsResetPassword);
      if(res != null && res.statusCode == 200){
        Get.toNamed(Routes.PASSWORD_RESET_SUCCESSFULLY);
        upDateButtonValue.value = false;
      }
      else{
        upDateButtonValue.value = false;
      }
    }catch(e){
      KNPMethods.error();
      print('callingResetPassword:::: ERROR::::  $e');
      upDateButtonValue.value = false;
    }
  }

}
