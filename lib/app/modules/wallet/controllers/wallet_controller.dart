import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/withdraw_history_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';

class WalletController extends GetxController {
  final count = 0.obs;

  final apiResValue = true.obs;
  final hideShowWithdrawFieldValue = false.obs;

  final withdrawAmountController = TextEditingController();
  FocusNode withdrawAmountFocusNode = FocusNode();
  final withdrawNowButtonValue = false.obs;

  final withdrawHistoryModal = Rxn<WithdrawHistoryModal>();
  List<WalletHistory>? walletHistory;

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

  void clickOnWithdrawNowButton() {
    KNPMethods.unFocsKeyBoard();
    if(withdrawAmountController.text.isNotEmpty){
      withdrawNowButtonValue.value = true;
      Future.delayed(
        const Duration(seconds: 3),
            () => withdrawNowButtonValue.value = false,
      );
    }else{
      withdrawNowButtonValue.value = false;
    }
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
}
