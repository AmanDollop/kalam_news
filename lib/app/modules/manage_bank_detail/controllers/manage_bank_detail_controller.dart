import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/bank_account_modal.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cbs.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/modules/manage_bank_detail/views/manage_bank_detail_view.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class ManageBankDetailController extends GetxController with GetTickerProviderStateMixin{

  final count = 0.obs;
  final apiResValue = true.obs;

  final downAndUpValue = '-1'.obs;

  late AnimationController rotationController;

  final rotationValue = false.obs;

  final bankAccountsModal = Rxn<BankAccountsModal>();
  List<BankAccounts>? bankAccountsList;

  Map<String, dynamic> bodyParamsForSetPrimaryAndDeleteBankAccount = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    apiResValue.value = true;
    rotationController = AnimationController(duration: const Duration(milliseconds: 30000), vsync: this);
    rotationController.forward(from: 0.0); // it starts the animation
    await callingGetBankAccountApi();
    rotationController.stop();
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

  void clickOnDropDownButton({required int index}) {
    if (downAndUpValue.value != index.toString()) {
      downAndUpValue.value = index.toString();
    } else {
      downAndUpValue.value = '-1';
    }
    count.value++;
  }

  void clickOnMenuButton({required int index}) {
    CBS.commonBottomSheet(
      isDismissible: false,
      children: [
        Center(
          child: Text('Choose Action', style: Theme.of(Get.context!).textTheme.displayMedium),
        ),
        SizedBox(height: 16.px),
        commonRowForBottomSheet(
          imagePath: 'assets/icon/edit_pen_icon.png',
          text: 'Edit',
          onTap: () => clickOnEditButton(index: index),
        ),
        if(bankAccountsList?[index].primaryBank != 1)
        const ManageBankDetailView().commonDividerView().paddingSymmetric(vertical: CommonPaddingAndSize.size10()/2),
        if(bankAccountsList?[index].primaryBank != 1)
        Obx(() {
          count.value;
          return SizedBox(
            height: 35.px,
            child: InkWell(
              onTap: !rotationValue.value
                  ? () => clickOnSetPrimary(index: index)
                  : () => null,
              borderRadius: BorderRadius.circular(6.px),
              child: Row(
                children: [
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 30.0).animate(rotationController),
                    child: KNPWidgets.commonNetworkImageView(
                        path: 'assets/icon/sync_icon.png',
                        isAssetImage: true,
                        width: 20.px,
                        height: 20.px),
                  ),
                  SizedBox(width: 12.px),
                  Text(
                    'Set as Primary',
                    style: Theme.of(Get.context!).textTheme.displaySmall?.copyWith(fontSize: 14.px),
                  ),
                ],
              ),
            ),
          );
        }),
        if(bankAccountsList?[index].primaryBank != 1)
        const ManageBankDetailView().commonDividerView().paddingSymmetric(vertical: CommonPaddingAndSize.size10()/2),
        if(bankAccountsList?[index].primaryBank != 1)
        commonRowForBottomSheet(
          imagePath: 'assets/icon/delete_icon.png',
          text: 'Remove',
          onTap: () => clickOnRemove(index: index),
        ),
        SizedBox(height: 10.px),
      ],
    );
  }

  Widget commonRowForBottomSheet({required String imagePath, required String text, required GestureTapCallback onTap}) => SizedBox(
    height: 35.px,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.px),
      child: Row(
        children: [
          KNPWidgets.commonNetworkImageView(
              path: imagePath,
              isAssetImage: true,
              width: 20.px,
              height: 20.px),
          SizedBox(width: 12.px),
          Text(text, style: Theme.of(Get.context!).textTheme.displaySmall?.copyWith(fontSize: 14.px)),
        ],
      ),
    ),
  );

  void clickOnRemove({required int index}) {
    Get.back();
    CD.commonIosDeleteConfirmationDialog(
        clickOnCancel: () => Get.back(),
        clickOnDelete: () async => await callingDeleteBankDetailApi(bankId: bankAccountsList?[index].bankId.toString() ?? ''),
    );
  }

  Future<void> clickOnSetPrimary({required int index}) async {
    rotationValue.value = true;
    rotationController.forward(from: 0.0);
    await callingSetPrimaryBankDetailApi(bankId: bankAccountsList?[index].bankId.toString() ?? '');
    rotationController.stop();
    rotationValue.value = false;
  }

  Future<void> clickOnEditButton({required int index}) async {
    Get.back();
    await Get.toNamed(Routes.ADD_BANK_DETAIL,arguments: ['Update bank detail',bankAccountsList?[index]]);
    onInit();
  }

  Future<void> clickOnAddBankButton() async {
    await Get.toNamed(Routes.ADD_BANK_DETAIL,arguments: ['Add bank detail']);
    onInit();
  }

  Future<void> callingGetBankAccountApi() async {
    try{
      downAndUpValue.value='-1';
      bankAccountsModal.value = await ApiIntrigation.getBankAccountsApi();
      if(bankAccountsModal.value != null){
        bankAccountsList = bankAccountsModal.value?.bankAccounts;
        print('bankAccountsList::::: ${bankAccountsList?.length}');
      }
    }catch(e){
      KNPMethods.error();
      print('callingGetBankAccountApi:::: ERROR::::  $e');
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

  Future<void> callingSetPrimaryBankDetailApi({required String bankId}) async {
    try{
      bodyParamsForSetPrimaryAndDeleteBankAccount = {ApiConstantVar.bankId : bankId};
      http.Response? res = await ApiIntrigation.addBankDetailApi(bodyParams: bodyParamsForSetPrimaryAndDeleteBankAccount, endPoint: ApiUrls.apiEndPointChangePrimaryBankAccount);
      if(res != null && res.statusCode == 200){
        Get.back();
        await onInit();
      }else{
        Get.back();
      }
    }catch(e){
      print('callingSetPrimaryBankDetailApi::::  ERROR::::: $e');
      KNPMethods.error();
    }
  }

  Future<void> callingDeleteBankDetailApi({required String bankId}) async {
    try{
      bodyParamsForSetPrimaryAndDeleteBankAccount = {ApiConstantVar.bankId : bankId};
      http.Response? res = await ApiIntrigation.deleteBankAccountApi(bodyParams: bodyParamsForSetPrimaryAndDeleteBankAccount);
      if(res != null && res.statusCode == 200){
        Get.back();
        await onInit();
      }else{
        Get.back();
      }
    }catch(e){
      print('callingDeleteBankDetailApi::::  ERROR::::: $e');
      Get.back();
      KNPMethods.error();
    }
  }

}
