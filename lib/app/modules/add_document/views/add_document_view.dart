import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/add_document_controller.dart';

class AddDocumentView extends GetView<AddDocumentController> {
  const AddDocumentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KNPMethods.unFocsKeyBoard(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          controller.count.value;
          return Stack(
            children: [
              KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
                appBarTitle: controller.pageName.value,
                child2: Form(
                  key: controller.key,
                  child: ListView(
                    padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                    shrinkWrap: true,
                    children: [
                      cardNumberTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      addFileFrontSideDocumentTextFieldView(),
                      if (controller.frontSideImage.value?.path != null && controller.frontSideImage.value!.path.isNotEmpty)
                      SizedBox(height: CommonPaddingAndSize.size10()),
                      if (controller.frontSideImage.value?.path != null && controller.frontSideImage.value!.path.isNotEmpty)
                      commonImageView(filePath: controller.frontSideImage.value?.path ?? ''),
                        SizedBox(height: CommonPaddingAndSize.size20()),
                      if (controller.pageName.value == "Aadhar Card")
                        addFileBackSideDocumentTextFieldView(),
                      if (controller.pageName.value == "Aadhar Card")
                        SizedBox(height: CommonPaddingAndSize.size10()),
                      if (controller.pageName.value == "Aadhar Card")
                      if (controller.backSideImage.value?.path != null && controller.backSideImage.value!.path.isNotEmpty)
                        commonImageView(filePath: controller.backSideImage.value?.path ?? ''),


                      SizedBox(height: CommonPaddingAndSize.size20()),
                      upDateButtonView(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget cardNumberTextFieldView() => KNPWidgets.commonTextFormField(
        title: controller.pageName.value == "Aadhar Card"
            ? 'Aadhar card number'
            : 'Pan card number',
        hintText: controller.pageName.value == "Aadhar Card"
            ? 'Aadhar card number'
            : 'Pan card number',
        controller: controller.aadharAndPanCardNumberController,
        focusNode: controller.aadharAndPanCardNumberFocusNode,
        validator: (value) => V.isValid(value: value,title: 'This field is required'),
      );

  Widget commonImageView({required String filePath}) => KNPWidgets.commonContainerView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.px),
          child: Image.file(
            File(filePath),
            height: 150.px,
            width: 280.px,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget commonSuffixButtonView({required VoidCallback onPressed}) => Padding(
    padding: EdgeInsets.symmetric(vertical: 10.px,horizontal: 12.px),
    child: KNPWidgets.commonElevatedButton(
        onPressed: onPressed,
        buttonText: 'Add file',
        height: 24.px,
        width: 64.px,
        fontSize: 10.px,
        borderRadius: 4.px),
  );

  Widget addFileFrontSideDocumentTextFieldView() => KNPWidgets.commonTextFormField(
          title: 'Add file',
          hintText: 'Add file',
          controller: controller.aadharAndPanCardFrontImageController,
          focusNode: controller.aadharAndPanCardFrontImageFocusNode,
          validator: (value) => V.isValid(value: value, title: 'Add file'),
          readOnly: true,
          // onTap: () => controller.clickOnFrontSideDocumentTextField(),
          suffixIcon: commonSuffixButtonView(
            onPressed: () => controller.clickOnFrontSideDocumentTextField(),
          ),
      );

  Widget addFileBackSideDocumentTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Add file',
        hintText: 'Add file',
        controller: controller.aadharBackImageController,
        focusNode: controller.aadharBackImageFocusNode,
        validator: (value) => V.isValid(value: value, title: 'Add file'),
        readOnly: true,
        // onTap: () => controller.clickOnBackSideDocumentTextField(),
        suffixIcon: commonSuffixButtonView(onPressed: () => controller.clickOnBackSideDocumentTextField(),)
      );

  Widget upDateButtonView() => KNPWidgets.commonElevatedButton(
      onPressed: controller.upDateButtonValue.value
          ? () => null
          : () => controller.clickOnUpDateButtonView(),
      buttonText: 'Update',
      isLoading: controller.upDateButtonValue.value);
}
