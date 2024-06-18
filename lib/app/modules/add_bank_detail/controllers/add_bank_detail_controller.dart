import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/bank_account_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/image_picker.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';

class AddBankDetailController extends GetxController {

  final key = GlobalKey<FormState>();

  final count = 0.obs;
  final pageName = ''.obs;
  final apiResValue = true.obs;
  final addButtonValue = false.obs;

  final bankNameController = TextEditingController();
  FocusNode bankNameFocusNode = FocusNode();

  final bankBranchController = TextEditingController();
  FocusNode bankBranchFocusNode = FocusNode();

  final accountNumberController = TextEditingController();
  FocusNode accountNumberFocusNode = FocusNode();

  final reAccountNumberController = TextEditingController();
  FocusNode reAccountNumberFocusNode = FocusNode();

  final customerNameController = TextEditingController();
  FocusNode customerNameFocusNode = FocusNode();

  final ifscCodeController = TextEditingController();
  FocusNode ifscCodeFocusNode = FocusNode();

  final bankPassbook = Rxn<File?>();

  final accountType = PageConstVar.current.tr.obs;

  BankAccounts? bankAccounts;

  Map<String, dynamic> bodyParamsForAddAndUpdateBankAccount = {};

  @override
  void onInit() {
    super.onInit();
    pageName.value =  Get.arguments[0];
    if(pageName.value == PageConstVar.updateBankDetail.tr) {
      bankAccounts = Get.arguments[1];
      setBankDataOnFiled();
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

  void setBankDataOnFiled() {
    bankNameController.text = bankAccounts?.bankName ?? '';
    bankBranchController.text = bankAccounts?.bankBranch ?? '';
    accountNumberController.text = bankAccounts?.accountNo ?? '';
    reAccountNumberController.text = bankAccounts?.accountNo ?? '';
    customerNameController.text = bankAccounts?.customerName ?? '';
    if(bankAccounts?.accountType == 'saving' || bankAccounts?.accountType == "Saving"){
      accountType.value = PageConstVar.saving.tr;
    }else{
      accountType.value = PageConstVar.current.tr;
    }
    ifscCodeController.text = bankAccounts?.ifscCode ?? '';
  }

  Future<void> clickOnAddBankPassbookButton() async {
    if(bankPassbook.value == null) {
      await CD.commonIosPickImageDialog(
      clickOnCamera: () async {
        Get.back();
        bankPassbook.value = await KNPImagePicker.pickImage(isCropper: true);
      },
      clickOnGallery: () async {
        Get.back();
        bankPassbook.value = await KNPImagePicker.pickImage(pickFromGallery: true,isCropper: true);
      },
    );
    }else{
      bankPassbook.value = null;
    }
  }

  Future<void> clickOnAddBankButton() async {
    if(key.currentState!.validate()){
      addButtonValue.value = true;
      await callingAddBankDetailApi();
    }
  }

  Future<void> callingAddBankDetailApi() async {
    try{
      bodyParamsForAddAndUpdateBankAccount = {
       ApiConstantVar.bankName : bankNameController.text.trim().toString(),
       ApiConstantVar.bankBranch : bankBranchController.text.trim().toString(),
       ApiConstantVar.accountNo : reAccountNumberController.text.trim().toString(),
       ApiConstantVar.customerName : customerNameController.text.trim().toString(),
       ApiConstantVar.accountType : accountType.value.toLowerCase(),
       ApiConstantVar.ifscCode : ifscCodeController.text.trim().toString(),
      };
      if(pageName.value == PageConstVar.updateBankDetail.tr) {
        bodyParamsForAddAndUpdateBankAccount.addAll({ApiConstantVar.bankId : bankAccounts?.bankId.toString() ?? '',});
      }
      http.Response? res = await ApiIntrigation.addBankDetailApi(
          bodyParams: bodyParamsForAddAndUpdateBankAccount,
          endPoint: pageName.value == PageConstVar.updateBankDetail.tr
          ? ApiUrls.apiEndPointUpdateBankAccounts
          : ApiUrls.apiEndPointAddBankAccount,
        image: bankPassbook.value
      );
      if(res != null && res.statusCode == 200){
        Get.back();
      }
    }catch(e){
      print('callingAddBankDetailApi::::  ERROR::::: $e');
      addButtonValue.value = false;
      KNPMethods.error();
    }
    addButtonValue.value = false;
  }

}
