import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/bank_account_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';

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

  final customerNameController = TextEditingController();
  FocusNode customerNameFocusNode = FocusNode();

  final ifscCodeController = TextEditingController();
  FocusNode ifscCodeFocusNode = FocusNode();

  final accountType = 'Current'.obs;

  BankAccounts? bankAccounts;

  Map<String, dynamic> bodyParamsForAddAndUpdateBankAccount = {};

  @override
  void onInit() {
    super.onInit();
    pageName.value =  Get.arguments[0];
    if(pageName.value == "Update bank detail") {
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
    customerNameController.text = bankAccounts?.customerName ?? '';
    if(bankAccounts?.accountType == 'saving' || bankAccounts?.accountType == "Saving"){
      accountType.value = 'Saving';
    }else{
      accountType.value = 'Current';
    }
    ifscCodeController.text = bankAccounts?.ifscCode ?? '';
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
       ApiConstantVar.accountNo : accountNumberController.text.trim().toString(),
       ApiConstantVar.customerName : customerNameController.text.trim().toString(),
       ApiConstantVar.accountType : accountType.value.toLowerCase(),
       ApiConstantVar.ifscCode : ifscCodeController.text.trim().toString(),
      };
      if(pageName.value == "Update bank detail") {
        bodyParamsForAddAndUpdateBankAccount.addAll({ApiConstantVar.bankId : bankAccounts?.bankId.toString() ?? '',});
      }
      http.Response? res = await ApiIntrigation.addBankDetailApi(
          bodyParams: bodyParamsForAddAndUpdateBankAccount,
          endPoint: pageName.value == "Update bank detail"
          ? ApiUrls.apiEndPointUpdateBankAccounts
          : ApiUrls.apiEndPointAddBankAccount);
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
