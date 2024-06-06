import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/image_picker.dart';
import 'package:http/http.dart' as http;

class KycApplicationController extends GetxController {

  final count = 0.obs;

  final key = GlobalKey<FormState>();

  final apiResValue = true.obs;

  UserDataModal? userData;

  final aadharCardNumberController = TextEditingController();
  FocusNode aadharCardNumberFocusNode = FocusNode();

  final panCardNumberController = TextEditingController();
  FocusNode panCardNumberFocusNode = FocusNode();


  final profilePic = Rxn<File?>();
  final aadharFrontImage = Rxn<File?>();
  final aadharBackImage = Rxn<File?>();
  final panCardImage = Rxn<File?>();

  Map<String, dynamic> bodyParamsForEKyc = {};

  final submitButtonValue = false.obs;



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

  Future<void> clickOnUploadProfilePicture() async {
    await CD.commonIosPickImageDialog(
      clickOnCamera: () async {
        Get.back();
        profilePic.value = await KNPImagePicker.pickImage(isCropper: true);
      },
      clickOnGallery: () async {
        Get.back();
        profilePic.value = await KNPImagePicker.pickImage(pickFromGallery: true,isCropper: true);
      },
    );
  }

  Future<void> clickOnAadharCardFrontSide() async {
    if(aadharFrontImage.value == null) {
      await CD.commonIosPickImageDialog(
        clickOnCamera: () async {
          Get.back();
          aadharFrontImage.value = await KNPImagePicker.pickImage(isCropper: true);
        },
       clickOnGallery: () async {
         Get.back();
         aadharFrontImage.value = await KNPImagePicker.pickImage(pickFromGallery: true,isCropper: true);
       },
      );
    }else{
      aadharFrontImage.value = null;
    }
    count.value++;
  }

  Future<void> clickOnAadharCardBackSide() async {
    if(aadharBackImage.value == null) {
      await CD.commonIosPickImageDialog(
      clickOnCamera: () async {
        Get.back();
        aadharBackImage.value = await KNPImagePicker.pickImage(isCropper: true);
      },
      clickOnGallery: () async {
        Get.back();
        aadharBackImage.value = await KNPImagePicker.pickImage(pickFromGallery: true,isCropper: true);
      },
    );
    }else{
      aadharBackImage.value = null;
    }
    count.value++;
  }

  Future<void> clickOnPanCardPhoto() async {
    if(panCardImage.value == null) {
      await CD.commonIosPickImageDialog(
      clickOnCamera: () async {
        Get.back();
        panCardImage.value = await KNPImagePicker.pickImage(isCropper: true);
      },
      clickOnGallery: () async {
        Get.back();
        panCardImage.value = await KNPImagePicker.pickImage(pickFromGallery: true,isCropper: true);
      },
    );
    }else{
      panCardImage.value = null;
    }
    count.value++;
  }

  void clickOnUpdateBankDetails() {}

  void clickOnSubmitButton() {
    if(key.currentState!.validate() && aadharFrontImage.value != null && aadharBackImage.value != null && panCardImage.value != null){
      Get.back();
    }else{
      KNPMethods.showSnackBar(message: 'All filed are required');
    }
  }

  Future<void> callingAddEKycApi() async {
    try{

      bodyParamsForEKyc = {
        ApiConstantVar.aadharCardNo:aadharCardNumberController.text.trim().toString(),
        ApiConstantVar.panCardNo:panCardNumberController.text.trim().toString(),
      };

      Map<String, List<File>> imageMap = {
        ApiConstantVar.aadharCardPhotoFront : aadharFrontImage.value[0] ?? File(''),
        ApiConstantVar.aadharCardPhotoBack : aadharBackImage.value[1] ?? File(''),
        ApiConstantVar.panCardPhoto : panCardImage.value[2] ?? File(''),
      };



      http.Response? response = await ApiIntrigation.addEKycApi(bodyParams: bodyParamsForEKyc, imageMap: imageMap);
      if(response != null && response.statusCode == 200){
        Get.back();
      }else{
        KNPMethods.error();
      }

    }catch(e){
      KNPMethods.error();
      print('callingAddEKycApi ::::  error::::  $e');
      submitButtonValue.value = false;
    }
    submitButtonValue.value = false;
  }

}
