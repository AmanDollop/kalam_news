import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
          appBarTitle: 'Edit Profile',
          child2: ModalProgress(
            inAsyncCall: controller.apiResValue.value,
            child: controller.apiResValue.value
                ? KNPWidgets.commonProgressBarView()
                : ListView(
                    padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: userProfileView(),
                      ),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      mrAndMrsTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      firstNameTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      middleNameTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      lastNameTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      dobTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      emailTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      phoneNumberFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      whatsappNumberFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size10()),
                      Row(
                        children: [
                          checkBoxView(),
                          sameAsMobileNumberTextView(text: 'Same as phone number')
                        ],
                      ),
                      SizedBox(height: CommonPaddingAndSize.size10()),
                      completeAddressTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      stateTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      cityTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      pinCodeTextFieldView(),
                      SizedBox(height: CommonPaddingAndSize.size20()),
                      upDateButtonView(),
                    ],
                  ),
          ),
        );
      }),
    );
  }

  Widget userProfileView() => Stack(
        alignment: Alignment.bottomRight,
        children: [
          profileView(),
          editButtonView(),
        ],
      );

  Widget profileView() => Container(
        height: 120.px,
        width: 120.px,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
          shape: BoxShape.circle,
        ),
        child: controller.image.value?.path != null && controller.image.value!.path.isNotEmpty
            ? Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55.px),
                child: Image.file(
                   File(controller.image.value?.path ?? ''),
                    height: 110.px,
                    width: 110.px,
                  ),
              ),
            )
            : const SizedBox(),
      );

  Widget editButtonView() => InkWell(
        onTap: () => controller.clickOnCamera(),
        borderRadius: BorderRadius.circular(17.px),
        child: Container(
          height: 30.px,
          width: 30.px,
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).colorScheme.inversePrimary,
            shape: BoxShape.circle,
          ),
          child: KNPWidgets.commonNetworkImageView(
              path: 'assets/icon/edit_icon.png', isAssetImage: true),
        ),
      );

  Widget mrAndMrsTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Initials*',
        hintText: 'Initials',
        controller: controller.initialsController,
        focusNode: controller.initialsFocusNode,
        validator: (value) =>
            V.isValid(value: value, title: 'Please enter initials'),
      );

  Widget firstNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'First name*',
        hintText: 'First name',
        controller: controller.firstNameController,
        focusNode: controller.firstNameFocusNode,
        validator: (value) =>
            V.isValid(value: value, title: 'Please first name'),
      );

  Widget lastNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Last name*',
        hintText: 'Last name',
        controller: controller.lastNameController,
        focusNode: controller.lastNameFocusNode,
        validator: (value) =>
            V.isValid(value: value, title: 'Please enter last name'),
      );

  Widget middleNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Middle name ( Optional )',
        hintText: 'Middle name',
        controller: controller.middleNameController,
        focusNode: controller.middleNameFocusNode,
      );

  Widget dobTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'DOB*',
        hintText: 'DOB',
        controller: controller.dobController,
        focusNode: controller.dobFocusNode,
        readOnly: true,
        validator: (value) =>
            V.isValid(value: value, title: 'Please enter dob'),
      );

  Widget emailTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Email Id*',
        hintText: 'Email Id',
        controller: controller.emailController,
        focusNode: controller.emailFocusNode,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        readOnly: true,
        validator: (value) => V.isEmailValid(value: value),
      );

  Widget phoneNumberFieldView() => KNPWidgets.commonTextFormField(
        title: 'Phone number*',
        hintText: 'Phone number',
        controller: controller.mobileNumberController,
        focusNode: controller.mobileNumberFocusNode,
        keyboardType: TextInputType.number,
        readOnly: true,
        maxLength: 10,
        validator: (value) => V.isNumberValid(value: value),
      );

  Widget whatsappNumberFieldView() => KNPWidgets.commonTextFormField(
        title: 'WhatsApp number ( Optional )',
        hintText: 'WhatsApp number',
        controller: controller.whatsappNumberController,
        focusNode: controller.whatsappNumberFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 10,
      );

  Widget checkBoxView() => KNPWidgets.commonCheckBoxView(
        changeValue: controller.sameAsMobileNumberValue.value,
        onChanged: (value) {
          if (controller.mobileNumberController.text.isNotEmpty) {
            controller.sameAsMobileNumberValue.value =
                !controller.sameAsMobileNumberValue.value;
            if (controller.sameAsMobileNumberValue.value) {
              controller.whatsappNumberController.text =
                  controller.mobileNumberController.text;
            } else {
              controller.whatsappNumberController.clear();
            }
          }
          controller.count.value++;
        },
        visualDensity: VisualDensity(horizontal: -4.px, vertical: -4.px),
      );

  Widget sameAsMobileNumberTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(color: Theme.of(Get.context!).colorScheme.onSurface),
      );

  Widget completeAddressTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Complete address*',
        hintText: 'Complete address',
        controller: controller.completeAddressController,
        focusNode: controller.completeAddressFocusNode,
        validator: (value) =>
            V.isValid(value: value, title: 'Please enter complete address'),
      );

  Widget downArrowIconView() => Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Theme.of(Get.context!).colorScheme.onInverseSurface,
        size: 24.px,
      );

  Widget stateTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'State*',
        hintText: 'Select state',
        controller: controller.stateController,
        focusNode: controller.stateFocusNode,
        readOnly: true,
        suffixIcon: downArrowIconView(),
        validator: (value) =>
            V.isValid(value: value, title: 'Please select state'),
      );

  Widget cityTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'City*',
        hintText: 'Select city',
        controller: controller.cityController,
        focusNode: controller.cityFocusNode,
        readOnly: true,
        suffixIcon: downArrowIconView(),
        validator: (value) =>
            V.isValid(value: value, title: 'Please select city'),
      );

  Widget pinCodeTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Pin code*',
        hintText: 'Pin code',
        controller: controller.pinCodeController,
        focusNode: controller.pinCodeFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 6,
        validator: (value) => V.isValid(value: value, title: 'Please enter pin code'),
        readOnly: true
      );

  Widget upDateButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: () => controller.clickOnUpdateButton(),
    buttonText: 'Update',
  );

}
