import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;

  final key = GlobalKey<FormState>();

  final apiResValue = true.obs;

  final saveButtonValue = false.obs;

  final userData = Rxn<UserDataModal>();
  UserDetails? userDetails;

  final image = Rxn<File?>();

  final userPic = ''.obs;

  final initialsController = TextEditingController();
  FocusNode initialsFocusNode = FocusNode();
  final isInitialsDropDownValue = false.obs;
  final selectedInitialsValue = ''.obs;
  List<String> initialsList = [
    PageConstVar.mr.tr,
    PageConstVar.mrs.tr,
    PageConstVar.ms.tr,
    PageConstVar.mst.tr,
  ];

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

  Map<String, dynamic> bodyParamsForUpdateProfile = {};

  @override
  void onInit() {
    super.onInit();
    userData.value = Get.arguments[0];
    if(userData.value != null){
      userDetails = userData.value?.userDetails;
      setDefaultData();
    }
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
      userPic.value = userDetails?.profile ?? '';
      initialsController.text = userDetails?.initials ?? '';
      selectedInitialsValue.value = userDetails?.initials ?? '';
      firstNameController.text = userDetails?.firstName ?? '';
      middleNameController.text = userDetails?.middleName ?? '';
      lastNameController.text = userDetails?.lastName ?? '';
      dobController.text = CMForDateTime.dateFormatForDateMonthYear(date: '${userDetails?.dob}');
      emailController.text = userDetails?.email ?? '';
      mobileNumberController.text = userDetails?.mobileNumber ?? '';
      whatsappNumberController.text = userDetails?.whatsappNumber ?? '';
      completeAddressController.text = userDetails?.address ?? '';
      stateController.text = userDetails?.stateName.toString() ?? '';
      cityController.text = userDetails?.cityName.toString() ?? '';
      pinCodeController.text = userDetails?.pincode ?? '';
  }

  Future<void> clickOnCamera() async {
    await CD.commonIosPickImageDialog(
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

  Future<void> clickOnInitialsListOfDropDown({required value}) async {
    KNPMethods.unFocsKeyBoard();
    isInitialsDropDownValue.value = false;
    selectedInitialsValue.value = value ?? '';
    initialsController.text = value ?? '';
  }

  Future<void> clickOnUpdateButton() async {
    if(key.currentState!.validate()){
      await callingUpDateProfileApi();
    }
  }

  Future<void> callingUpDateProfileApi() async {
    try {
      saveButtonValue.value = true;
      bodyParamsForUpdateProfile = {
        ApiConstantVar.initials: initialsController.text.trim().toString(),
        ApiConstantVar.firstName: firstNameController.text.trim().toString(),
        ApiConstantVar.lastName: lastNameController.text.trim().toString(),
        ApiConstantVar.middleName: middleNameController.text.trim().toString(),
        // ApiConstantVar.dob: CMForDateTime.dateTimeFormatForApi(dateTime: dobController.text.trim().toString()),
        // ApiConstantVar.mobileNumber: mobileNumberController.text.trim().toString(),
        ApiConstantVar.whatsappNumber: whatsappNumberController.text.trim().toString(),
        // ApiConstantVar.email: emailController.text.trim().toString(),
        ApiConstantVar.address: completeAddressController.text.trim().toString(),
        ApiConstantVar.stateId: userDetails?.stateId.toString(),
        ApiConstantVar.cityId: userDetails?.cityId.toString(),
        ApiConstantVar.pinCode: pinCodeController.text.trim().toString(),
      };
      http.Response? response = await ApiIntrigation.updateProfileApi(
        bodyParams: bodyParamsForUpdateProfile,
        image: image.value,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          Map<String, dynamic> mapRes = {};
          mapRes = jsonDecode(response.body);
          KNPMethods.showSnackBar(message: mapRes[ApiConstantVar.message]);
          await callingGetUserDataApi();

          selectedBottomNavigationIndex.value = 0;
          // count.value++;
          // Get.back();
          Get.offAllNamed(Routes.BOTTOM_BAR);
          saveButtonValue.value = false;
        }
      } else {
        apiResValue.value = false;
        saveButtonValue.value = false;
      }
    } catch (e) {
      apiResValue.value = false;
      saveButtonValue.value = false;
      KNPMethods.error();
    }
  }

  Future<void> callingGetUserDataApi() async {
    final userDataFromLocalDataBase = ''.obs;
    try {
      userData.value = await ApiIntrigation.getUserDataApi();
      if (userData.value != null) {
        userDetails = userData.value?.userDetails;

        userDataFromLocalDataBase.value = await DataBaseHelper().getParticularData(key: DataBaseConstant.userDetail, tableName: DataBaseConstant.tableNameForUserDetail);

        String? token = UserDataModal.fromJson(jsonDecode(userDataFromLocalDataBase.value)).accessToken;
        userData.value?.accessToken = token;

        await DataBaseHelper().upDateDataBase(data: {DataBaseConstant.userDetail: json.encode(userData.value)}, tableName: DataBaseConstant.tableNameForUserDetail);
      }
    } catch (e) {
      KNPMethods.error();
      saveButtonValue.value = false;
    }
  }

}
