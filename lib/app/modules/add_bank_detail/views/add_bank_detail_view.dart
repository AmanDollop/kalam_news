import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';

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
                  ? KNPWidgets.commonProgressBarView()
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
                                  customerNameTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                  ifscCodeTextFieldView(),
                                  Row(
                                    children: [
                                      KNPWidgets.commonRadioButtonWithTitle(
                                        title: 'Current',
                                        value: controller.accountType.value,
                                        onTap: () {
                                          controller.accountType.value = "Current";
                                          controller.count.value++;
                                        },
                                      ),
                                      SizedBox(width: CommonPaddingAndSize.size16()),
                                      KNPWidgets.commonRadioButtonWithTitle(
                                        title: 'Saving',
                                        value: controller.accountType.value,
                                        onTap: () {
                                          controller.accountType.value = "Saving";
                                          controller.count.value++;
                                        },
                                      ),
                                    ],
                                  ).paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
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
    title: 'Bank name*',
    hintText: 'Bank name',
    controller: controller.bankNameController,
    focusNode: controller.bankNameFocusNode,
    validator: (value) => V.isValid(value: value, title: 'Please enter bank name'),
  );

  Widget bankBranchNameTextFieldView() => KNPWidgets.commonTextFormField(
    title: 'Bank branch name*',
    hintText: 'Bank branch name',
    controller: controller.bankBranchController,
    focusNode: controller.bankBranchFocusNode,
    validator: (value) => V.isValid(value: value, title: 'Please enter bank branch name'),
  );

  Widget accountNumberTextFieldView() => KNPWidgets.commonTextFormField(
    title: 'Account number*',
    hintText: 'Account number',
    controller: controller.accountNumberController,
    focusNode: controller.accountNumberFocusNode,
    keyboardType: TextInputType.number,
    validator: (value) => V.isValid(value: value, title: 'Please enter account number'),
  );

  Widget customerNameTextFieldView() => KNPWidgets.commonTextFormField(
    title: 'Customer name*',
    hintText: 'Customer name',
    controller: controller.customerNameController,
    focusNode: controller.customerNameFocusNode,
    validator: (value) => V.isValid(value: value, title: 'Please enter customer name'),
  );

  Widget ifscCodeTextFieldView() => KNPWidgets.commonTextFormField(
    title: 'IFSC code*',
    hintText: 'IFSC code',
    controller: controller.ifscCodeController,
    focusNode: controller.ifscCodeFocusNode,
    validator: (value) => V.isValid(value: value, title: 'Please enter ifsc code'),
  );

  Widget addBankButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: controller.addButtonValue.value
        ? () => null
        : () => controller.clickOnAddBankButton(),
    isLoading: controller.addButtonValue.value,
    buttonText: controller.pageName.value == "Update bank detail"
        ? 'Update Bank'
        : 'Add Bank',
  );

}
