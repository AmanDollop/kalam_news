import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/app_setting_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KycApplicationController extends GetxController {

  final count = 0.obs;

  final key = GlobalKey<FormState>();

  final apiResValue = true.obs;

  UserDataModal? userData;
  final kycAddOrNot = ''.obs;
  KycDocument? kycDocument;

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
    kycAddOrNot.value = Get.arguments[1];
    print('kycAddOrNot.value::::::: ${kycAddOrNot.value}');
    if(kycAddOrNot.value == '1') {
      kycDocument = Get.arguments[2];
      setDefaultData();
      print('::::::: ${kycDocument?.aadharCardNo}');
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

  void setDefaultData(){
    aadharCardNumberController.text = kycDocument?.aadharCardNo ?? '';
    panCardNumberController.text = kycDocument?.panCardNo ?? '';
  }

  Future<void> clickOnUploadProfilePicture() async {
    if(kycAddOrNot.value == '1'){
      commonDialog(path: kycDocument?.userKycPhoto ?? '');
    }
    else{
      if(profilePic.value == null) {
        profilePic.value = await KNPImagePicker.pickImage(isCropper: true);
      }
      else{
        profilePic.value = null;
      }
    }
  }

  Future<void> clickOnAadharCardFrontSide() async {
    if(kycAddOrNot.value == '1' && kycDocument?.isAadharVerified != 2){
      commonDialog(path: kycDocument?.aadharCardPhotoFront ?? '');
    }
    else{
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
      }
      else{
        aadharFrontImage.value = null;
      }
    }
    count.value++;
  }

  Future<void> clickOnAadharCardBackSide() async {
    if(kycAddOrNot.value == '1' && kycDocument?.isAadharVerified != 2){
      commonDialog(path: kycDocument?.aadharCardPhotoBack ?? '');
    }
    else{
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
      }
      else{
        aadharBackImage.value = null;
      }
    }
    count.value++;
  }

  Future<void> clickOnPanCardPhoto() async {
    if(kycAddOrNot.value == '1' && kycDocument?.isPanVerified != 2){
      commonDialog(path: kycDocument?.panCardPhoto ?? '');
    }
    else{
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
      }
      else{
        panCardImage.value = null;
      }
    }
    count.value++;
  }

  void commonDialog({required String path}) {
    showDialog(context: Get.context!, builder: (context) => Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: Padding(
        padding:  EdgeInsets.all(8.px),
        child: KNPWidgets.commonNetworkImageView(
          path: KNPMethods.baseUrlForNetworkImage(imagePath: path),
          height: 350.px,
          width: 200.px,
          radius: 10.px,
          fit: BoxFit.contain
        ),

      ),
     ));
  }

  void clickOnUpdateBankDetails() {}

  Future<void> clickOnSubmitButton() async {
    if(kycAddOrNot.value == '0'){
      if(key.currentState!.validate() && profilePic.value != null && aadharFrontImage.value != null && aadharBackImage.value != null && panCardImage.value != null){
       await addKycCalling();
      }
      else{
        KNPMethods.showSnackBar(message: 'All filed are required');
      }
    }
    else{
      if(key.currentState!.validate() && kycAddOrNot.value == '1' && kycDocument?.isAadharVerified == 2 && kycDocument?.isPanVerified != 2){
        await updateAadharCalling();
      }
      else if(key.currentState!.validate() && kycAddOrNot.value == '1' && kycDocument?.isPanVerified == 2 && kycDocument?.isAadharVerified != 2){
        await updatePanCalling();
      }
      else if(key.currentState!.validate() && kycAddOrNot.value == '1' && kycDocument?.isAadharVerified == 2 && kycDocument?.isPanVerified == 2){
        await updateAadharAndPanBothCalling();
      }
    }
  }

  Future<void> addKycCalling() async {
    bodyParamsForEKyc.clear();
    bodyParamsForEKyc = {
      ApiConstantVar.aadharCardNo: aadharCardNumberController.text.trim().toString(),
      ApiConstantVar.panCardNo: panCardNumberController.text.trim().toString(),
    };
    Map<String, File> imageMap = {
      ApiConstantVar.userKycPhoto : profilePic.value ?? File(''),
      ApiConstantVar.aadharCardPhotoFront : aadharFrontImage.value ?? File(''),
      ApiConstantVar.aadharCardPhotoBack : aadharBackImage.value ?? File(''),
      ApiConstantVar.panCardPhoto : panCardImage.value ?? File(''),
    };
    await callingAddEKycApi(endPoint: ApiUrls.apiEndPointUserKycDocument,imageMap:imageMap);
  }

  Future<void> updateAadharCalling() async {
    bodyParamsForEKyc.clear();
    bodyParamsForEKyc = {
      ApiConstantVar.kycUpdateType: '0',
      ApiConstantVar.docsId: kycDocument?.docsId.toString(),
      ApiConstantVar.aadharCardNo: aadharCardNumberController.text.trim().toString(),
    };
    Map<String, File> imageMap = {
      ApiConstantVar.aadharCardPhotoFront : aadharFrontImage.value ?? File(''),
      ApiConstantVar.aadharCardPhotoBack : aadharBackImage.value ?? File(''),
    };
    await callingAddEKycApi(endPoint: ApiUrls.apiEndPointUpdateKycDocument,imageMap:imageMap);
  }

  Future<void> updatePanCalling() async {
    bodyParamsForEKyc.clear();
    bodyParamsForEKyc = {
      ApiConstantVar.kycUpdateType: '1',
      ApiConstantVar.docsId: kycDocument?.docsId.toString(),
      ApiConstantVar.panCardNo: panCardNumberController.text.trim().toString(),
    };
    Map<String, File> imageMap = {
      ApiConstantVar.panCardPhoto : panCardImage.value ?? File(''),
    };
    await callingAddEKycApi(endPoint: ApiUrls.apiEndPointUpdateKycDocument,imageMap:imageMap);
  }

  Future<void> updateAadharAndPanBothCalling() async {
    bodyParamsForEKyc.clear();
    bodyParamsForEKyc = {
      ApiConstantVar.kycUpdateType: '2',
      ApiConstantVar.docsId: kycDocument?.docsId.toString(),
      ApiConstantVar.aadharCardNo: aadharCardNumberController.text.trim().toString(),
      ApiConstantVar.panCardNo: panCardNumberController.text.trim().toString(),
    };
    Map<String, File> imageMap = {
      ApiConstantVar.aadharCardPhotoFront : aadharFrontImage.value ?? File(''),
      ApiConstantVar.aadharCardPhotoBack : aadharBackImage.value ?? File(''),
      ApiConstantVar.panCardPhoto : panCardImage.value ?? File(''),
    };
    await callingAddEKycApi(endPoint: ApiUrls.apiEndPointUpdateKycDocument,imageMap:imageMap);
  }

  Future<void> callingAddEKycApi({required String endPoint, required Map<String, File> imageMap}) async {
    try{
      submitButtonValue.value = true;
      http.Response? response = await ApiIntrigation.addEKycApi(bodyParams: bodyParamsForEKyc, imageMap: imageMap,endPoint: endPoint);
      if(response != null && response.statusCode == 200){
        Get.back();
      }
      else{
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
