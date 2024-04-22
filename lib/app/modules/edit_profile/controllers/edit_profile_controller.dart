import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/image_picker.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;
  final apiResValue = true.obs;

  UserDataModal? userData;

  final image = Rxn<File?>();

  final initialsController = TextEditingController();
  FocusNode initialsFocusNode = FocusNode();

  final firstNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  final lastNameController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  final middleNameController = TextEditingController();
  FocusNode middleNameFocusNode = FocusNode();

  final dobController = TextEditingController();
  FocusNode dobFocusNode = FocusNode();

  final emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  final mobileNumberController = TextEditingController();
  FocusNode mobileNumberFocusNode = FocusNode();

  final whatsappNumberController = TextEditingController();
  FocusNode whatsappNumberFocusNode = FocusNode();

  final sameAsMobileNumberValue = false.obs;

  final completeAddressController = TextEditingController();
  FocusNode completeAddressFocusNode = FocusNode();

  final stateController = TextEditingController();
  FocusNode stateFocusNode = FocusNode();

  final cityController = TextEditingController();
  FocusNode cityFocusNode = FocusNode();

  final pinCodeController = TextEditingController();
  FocusNode pinCodeFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    userData = Get.arguments[0];
    setDefaultData();
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

  void setDefaultData() {
    if (userData != null) {
      initialsController.text = userData?.userDetails?.initials ?? '';
      firstNameController.text = userData?.userDetails?.firstName ?? '';
      middleNameController.text = userData?.userDetails?.middleName ?? '';
      lastNameController.text = userData?.userDetails?.lastName ?? '';
      dobController.text = CMForDateTime.dateFormatForDateMonthYear(
          date: '${userData?.userDetails?.dob}');
      emailController.text = userData?.userDetails?.email ?? '';
      mobileNumberController.text = userData?.userDetails?.mobileNumber ?? '';
      whatsappNumberController.text =
          userData?.userDetails?.whatsappNumber ?? '';
      completeAddressController.text = userData?.userDetails?.address ?? '';
      stateController.text = userData?.userDetails?.stateId.toString() ?? '';
      cityController.text = userData?.userDetails?.cityId.toString() ?? '';
      pinCodeController.text = userData?.userDetails?.pincode ?? '';
    }
  }

  void clickOnCamera() {
    CD.commonIosPickImageDialog(
      isDismiss: false,
      clickOnCamera: () async {
        Get.back();
        image.value = await KNPImagePicker.pickImage(isCropper: true);
      },
      clickOnGallery: () async {
        Get.back();
        image.value = await KNPImagePicker.pickImage(pickFromGallery: true,isCropper: true);
      },
    );
  }

  void clickOnUpdateButton() {
    Get.back();
  }
}
