import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/image_check_method/image_check_method.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
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
     await CD.commonIosPickImageDialog(
      clickOnCamera: () async {
        Get.back();
        frontSideImage.value = await KNPImagePicker.pickImage();
        await checkImageFront();
        count.value++;
      },
      clickOnGallery: () async {
        Get.back();
        frontSideImage.value = await KNPImagePicker.pickImage(pickFromGallery: true,);
        await checkImageFront();
        count.value++;
      },
    );
  }

  Future<void> checkImageFront() async {
    if(frontSideImage.value?.path != null && frontSideImage.value!.path.isNotEmpty){
      bool v = await CheckImage.validateAadharImage(imageFile: frontSideImage.value ?? File(''));
      if(pageName.value == "Aadhar Card"){
        if(v){
          aadharAndPanCardFrontImageController.text = "Aadhar Card";
        }else{
          KNPMethods.showSnackBar(message: 'Aadhar card are not valid');
          aadharAndPanCardFrontImageController.clear();
          frontSideImage.value = null;
        }
      }else{
        if(v){
          aadharAndPanCardFrontImageController.text = "Pan Card";
        }else{
          KNPMethods.showSnackBar(message: 'Pan card are not valid');
          aadharAndPanCardFrontImageController.clear();
          frontSideImage.value = null;
        }
      }
    }else{
      aadharAndPanCardFrontImageController.clear();
    }
    count.value++;
  }

  Future<void> clickOnBackSideDocumentTextField() async {
     CD.commonIosPickImageDialog(
      clickOnCamera: () async {
        Get.back();
        backSideImage.value = await KNPImagePicker.pickImage();
        await checkImageBack();
        count.value++;
      },
      clickOnGallery: () async {
        Get.back();
        backSideImage.value = await KNPImagePicker.pickImage(pickFromGallery: true);
        await checkImageBack();
        count.value++;
      },
    );
  }

  Future<void> checkImageBack() async {
    if(backSideImage.value?.path != null && backSideImage.value!.path.isNotEmpty){
      bool v = await CheckImage.validateAadharImage(imageFile: backSideImage.value ?? File(''));
      if(v){
        aadharBackImageController.text = "Aadhar Card";
      }else{
        KNPMethods.showSnackBar(message: 'Aadhar card are not valid');
        aadharBackImageController.clear();
        backSideImage.value = null;
      }
    }else{
      aadharBackImageController.clear();
    }
  }

  void clickOnUpDateButtonView() {
    if(key.currentState!.validate()){
      Get.back();
    }
  }

}
