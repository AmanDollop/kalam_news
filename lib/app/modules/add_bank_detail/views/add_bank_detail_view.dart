import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/add_bank_detail_controller.dart';

class AddBankDetailView extends GetView<AddBankDetailController> {
  const AddBankDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return SingleChildScrollView(
          child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: controller.pageName.value,
            child2: ModalProgress(
              inAsyncCall: controller.apiResValue.value,
              child: controller.apiResValue.value
                  ? KNPWidgets.myLoaderView()
                  : Padding(
                      padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                      child: Column(
                        children: [
                          Expanded(
                            child: Form(
                              key: controller.key,
                              child: ListView(
                                children: [
                                  bankNameTextFieldView(),
                                  bankBranchNameTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                  accountNumberTextFieldView(),
                                  reAccountNumberTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                  customerNameTextFieldView(),
                                  ifscCodeTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                  KNPWidgets.commonContainerView(child:
                                  SizedBox(
                                    height: 100.px,
                                    child: InkWell(
                                      onTap: () => controller.clickOnAddBankPassbookButton(),
                                      child: Center(
                                          child: controller.bankPassbook.value != null
                                              ? Stack(
                                                 alignment: Alignment.center,
                                                 children: [
                                                   Image.file(
                                                     File(controller.bankPassbook.value?.path ?? ''),
                                                     // height: 110.px,
                                                     width: double.infinity,
                                                   ),
                                                   commonIconButton(icon: Icons.cancel)
                                                 ],
                                               )
                                              : KNPWidgets.commonElevatedButton(
                                                  onPressed: ()=> controller.clickOnAddBankPassbookButton(),
                                                  buttonText: 'Add bank passbook',
                                                  height: 30.px,
                                                  width: 200.px,
                                                  borderRadius: 5.px,
                                                  fontSize: 12.px,
                                              ),
                                       ),
                                    ),
                                   ),
                                  ),
                                  SizedBox(height: CommonPaddingAndSize.size20()),
                                  Row(
                                    children: [
                                      KNPWidgets.commonRadioButtonWithTitle(
                                        title: PageConstVar.current.tr,
                                        value: controller.accountType.value,
                                        onTap: () {
                                          controller.accountType.value = PageConstVar.current.tr;
                                          controller.count.value++;
                                        },
                                      ),
                                      SizedBox(width: CommonPaddingAndSize.size16()),
                                      KNPWidgets.commonRadioButtonWithTitle(
                                        title: PageConstVar.saving.tr,
                                        value: controller.accountType.value,
                                        onTap: () {
                                          controller.accountType.value = PageConstVar.saving.tr;
                                          controller.count.value++;
                                        },
                                      ),
                                    ],
                                  ).paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                ],
                              ),
                            ),
                          ),
                          addBankButtonView()
                        ],
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }

  Widget bankNameTextFieldView() => KNPWidgets.commonTextFormField(
    title: '${PageConstVar.bankName.tr}*',
    hintText: PageConstVar.bankName.tr,
    controller: controller.bankNameController,
    focusNode: controller.bankNameFocusNode,
    validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterBankName.tr),
  );

  Widget bankBranchNameTextFieldView() => KNPWidgets.commonTextFormField(
    title: '${PageConstVar.bankBranchName.tr}*',
    hintText: PageConstVar.bankBranchName.tr,
    controller: controller.bankBranchController,
    focusNode: controller.bankBranchFocusNode,
    validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterBankBranchName.tr),
  );

  Widget accountNumberTextFieldView() => KNPWidgets.commonTextFormField(
    title: '${PageConstVar.accountNumber.tr}*',
    hintText: PageConstVar.accountNumber.tr,
    controller: controller.accountNumberController,
    focusNode: controller.accountNumberFocusNode,
    keyboardType: TextInputType.number,
    validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterAccountNumber.tr),
  );

  Widget reAccountNumberTextFieldView() => KNPWidgets.commonTextFormField(
    title: '${PageConstVar.reAccountNumber.tr}*',
    hintText: PageConstVar.reAccountNumber.tr,
    controller: controller.reAccountNumberController,
    focusNode: controller.reAccountNumberFocusNode,
    keyboardType: TextInputType.number,
    validator: (value) => V.isAccountNumberValid(value: value,accountNumber: controller.accountNumberController.text),
  );

  Widget customerNameTextFieldView() => KNPWidgets.commonTextFormField(
    title: '${PageConstVar.customerName.tr}*',
    hintText: PageConstVar.customerName.tr,
    controller: controller.customerNameController,
    focusNode: controller.customerNameFocusNode,
    validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterCustomerName.tr),
  );

  Widget ifscCodeTextFieldView() => KNPWidgets.commonTextFormField(
    title: '${PageConstVar.iFSCCode.tr}*',
    hintText: PageConstVar.iFSCCode.tr,
    controller: controller.ifscCodeController,
    focusNode: controller.ifscCodeFocusNode,
    textCapitalization: TextCapitalization.characters,
    validator: (value) => V.isIfscCodeValid(value: value),
  );

  Widget commonIconButton({required IconData icon}) => Container(
    height: 20.px,
    width: 20.px,
    margin: EdgeInsets.only(bottom: 4.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.primary,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Icon(
        icon,
        color: Theme.of(Get.context!).colorScheme.inversePrimary,
        size: 16.px,
      ),
    ),
  );

  Widget addBankButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: controller.addButtonValue.value
        ? () => null
        : () => controller.clickOnAddBankButton(),
    isLoading: controller.addButtonValue.value,
    buttonText: controller.pageName.value == PageConstVar.updateBankDetail.tr
        ? PageConstVar.updateBank.tr
        : PageConstVar.addBank.tr,
  );

}
