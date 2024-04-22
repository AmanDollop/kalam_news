import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/packages/image_picker.dart';

class AddDocumentController extends GetxController {

  final count = 0.obs;
  final pageName = ''.obs;

  final key = GlobalKey<FormState>();

  final aadharAndPanCardNumberController = TextEditingController();
  FocusNode aadharAndPanCardNumberFocusNode = FocusNode();

  final aadharAndPanCardFrontImageController = TextEditingController();
  FocusNode aadharAndPanCardFrontImageFocusNode = FocusNode();
  final frontSideImage = Rxn<File?>();

  final aadharBackImageController = TextEditingController();
  FocusNode aadharBackImageFocusNode = FocusNode();
  final backSideImage = Rxn<File?>();

  final upDateButtonValue = false.obs;

  @override
  void onInit() {
    super.onInit();
    pageName.value = Get.arguments[0];
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

  Future<void> clickOnFrontSideDocumentTextField() async {
    frontSideImage.value = await KNPImagePicker.pickImage(pickFromGallery: true);
    if(frontSideImage.value?.path != null && frontSideImage.value!.path.isNotEmpty){
      if(pageName.value == "Aadhar Card"){
        aadharAndPanCardFrontImageController.text = "Aadhar Card";
      }else{
        aadharAndPanCardFrontImageController.text = "Pan Card";
      }
    }
  }

  Future<void> clickOnBackSideDocumentTextField() async {
    backSideImage.value = await KNPImagePicker.pickImage(pickFromGallery: true);
    if(backSideImage.value?.path != null && backSideImage.value!.path.isNotEmpty){
      if(pageName.value == "Aadhar Card"){
        aadharBackImageController.text = "Aadhar Card";
      }
    }
  }

  void clickOnUpDateButtonView() {}

}
