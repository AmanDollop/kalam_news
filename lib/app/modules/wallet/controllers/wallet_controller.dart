import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/withdraw_history_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController {
  final count = 0.obs;

  final apiResValue = true.obs;
  final hideShowWithdrawFieldValue = false.obs;
  final disableWithdrawButton = false.obs;

  final withdrawAmountController = TextEditingController();
  FocusNode withdrawAmountFocusNode = FocusNode();
  final withdrawNowButtonValue = false.obs;

  final withdrawHistoryModal = Rxn<WithdrawHistoryModal>();
  List<WalletHistory>? walletHistory;

  Map<String, dynamic> bodyParamsForWithdrawAmountApi = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    hideShowWithdrawFieldValue.value = false;
    apiResValue.value = true;
    await callingGetWithdrawHistoryApi();
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

  onWillPop() {
    selectedBottomNavigationIndex.value = 0;
    count.value++;
  }

  Future<void> callingGetWithdrawHistoryApi() async {
    try {
      withdrawHistoryModal.value = await ApiIntrigation.getWithdrawHistoryApi();
      if (withdrawHistoryModal.value != null) {
        walletHistory = withdrawHistoryModal.value?.walletHistory;
      }
    } catch (e) {
      print('callingGetWithdrawHistoryApi:::  ERROR::: $e');
      KNPMethods.error();
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

  Future<void> clickOnWithdrawNowButton() async {
    KNPMethods.unFocsKeyBoard();
    if(withdrawAmountController.text.isNotEmpty){
      await callingWithdrawAmountApi();
    }else{
      withdrawNowButtonValue.value = false;
    }
  }

  Future<void> callingWithdrawAmountApi()  async {
    try{
      withdrawNowButtonValue.value = true;
      bodyParamsForWithdrawAmountApi = {
        ApiConstantVar.amount:withdrawAmountController.text.trim().toString()
      };
      http.Response? res = await ApiIntrigation.withdrawAmountApi(bodyParams: bodyParamsForWithdrawAmountApi);
    }catch(e){
      print('callingWithdrawAmountApi::: ERROR::::  $e');
      withdrawNowButtonValue.value = false;
      KNPMethods.error();
    }
    withdrawNowButtonValue.value = false;
  }

}
