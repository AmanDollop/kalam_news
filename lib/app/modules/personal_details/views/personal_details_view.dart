import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/packages/my_drop_down.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/personal_details_controller.dart';

class PersonalDetailsView extends GetView<PersonalDetailsController> {
  const PersonalDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness:
          Brightness.light, // For Android(M and greater): (dark icons)
    );
    return GestureDetector(
      onTap: () {
        KNPMethods.unFocsKeyBoard();
        controller.isInitialsDropDownValue.value = false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          controller.count.value;
          return SingleChildScrollView(
            child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: 'Personal Details',
              child2: Form(
                key: controller.key,
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.commonProgressBarView()
                      : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
                    shrinkWrap: true,
                    children: [
                      mrAndMrsTextFieldView(),
                      SizedBox(height: 20.px),
                      firstNameTextFieldView(),
                      SizedBox(height: 20.px),
                      lastNameTextFieldView(),
                      SizedBox(height: 20.px),
                      middleNameTextFieldView(),
                      SizedBox(height: 20.px),
                      dobTextFieldView(),
                      SizedBox(height: 20.px),
                      emailTextFieldView(),
                      SizedBox(height: 20.px),
                      phoneNumberFieldView(),
                      SizedBox(height: 20.px),
                      whatsappNumberFieldView(),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          checkBoxView(),
                          sameAsMobileNumberTextView(text: 'Same as phone number')
                        ],
                      ),
                      SizedBox(height: 10.px),
                      completeAddressTextFieldView(),
                      SizedBox(height: 20.px),
                      stateTextFieldView(),
                      SizedBox(height: 20.px),
                      if(controller.stateController.text.isNotEmpty)
                        cityTextFieldView(),
                      if(controller.stateController.text.isNotEmpty)
                        SizedBox(height: 20.px),
                      pinCodeTextFieldView(),
                      SizedBox(height: 20.px),
                      passwordTextFieldView(),
                      SizedBox(height: 20.px),
                      confirmPasswordTextFieldView(),
                      SizedBox(height: 20.px),
                      continueButtonView(),
                    ],
                  ),
                ),
              )
            ),
          );
        }),
      ),
    );
  }


  Widget mrAndMrsTextFieldView() => MyDropdown(
        title: 'Initials*',
        items: controller.initialsList,
        nameList: controller.initialsList,
        selectedItem: controller.selectedInitialsValue.value,
        hintText: 'Select Initials',
        focusNode: controller.initialsFocusNode,
        textEditingController: controller.initialsController,
        isOpenValue: controller.isInitialsDropDownValue.value,
        onTapForTextFiled: () {
          controller.isInitialsDropDownValue.value = !controller.isInitialsDropDownValue.value;
          controller.count.value++;
        },
        clickOnListOfDropDown: (value) => controller.clickOnInitialsListOfDropDown(value: value),
        validator: (value) => V.isValid(value: value, title: 'Please select initials'),
      );

  Widget firstNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'First name*',
        hintText: 'First name',
        controller: controller.firstNameController,
        focusNode: controller.firstNameFocusNode,
        validator: (value) => V.isValid(value: value, title: 'Please first name'),
      );

  Widget lastNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Last name*',
        hintText: 'Last name',
        controller: controller.lastNameController,
        focusNode: controller.lastNameFocusNode,
        validator: (value) => V.isValid(value: value, title: 'Please enter last name'),
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
        onTap: () => controller.clickOnDObTextField(),
        validator: (value) => V.isValid(value: value, title: 'Please enter dob'),
      );

  Widget emailTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Email Id*',
        hintText: 'Email Id',
        controller: controller.emailController,
        focusNode: controller.emailFocusNode,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        validator: (value) => V.isEmailValid(value: value),
      );

  Widget phoneNumberFieldView() => KNPWidgets.commonTextFormField(
        title: 'Phone number*',
        hintText: 'Phone number',
        controller: controller.mobileNumberController,
        focusNode: controller.mobileNumberFocusNode,
        keyboardType: TextInputType.number,
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
           if(controller.mobileNumberController.text.isNotEmpty){
             controller.sameAsMobileNumberValue.value = !controller.sameAsMobileNumberValue.value;
             if(controller.sameAsMobileNumberValue.value){
               controller.whatsappNumberController.text = controller.mobileNumberController.text;
             }else{
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
        validator: (value) => V.isValid(value: value, title: 'Please enter complete address'),
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
        onTap: () => controller.clickOnStateTextFormFiled(),
        validator: (value) => V.isValid(value: value, title: 'Please select state'),
      );

  Widget cityTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'City*',
        hintText: 'Select city',
        controller: controller.cityController,
        focusNode: controller.cityFocusNode,
        readOnly: true,
        suffixIcon: downArrowIconView(),
        onTap: () => controller.clickOnCityTextFormFiled(),
        validator: (value) => V.isValid(value: value, title: 'Please select city'),
      );

  Widget pinCodeTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Pin code*',
        hintText: 'Pin code',
        controller: controller.pinCodeController,
        focusNode: controller.pinCodeFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 6,
        validator: (value) => V.isValid(value: value, title: 'Please enter pin code'),
      );

  Widget passwordTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Password*',
        hintText: 'Password',
        controller: controller.passwordController,
        focusNode: controller.passwordFocusNode,
        validator: (value) => V.isPasswordValid(value: value),
      );

  Widget confirmPasswordTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Confirm password*',
        hintText: 'Confirm password',
        controller: controller.confirmPasswordController,
        focusNode: controller.confirmPasswordFocusNode,
        validator: (value) => V.isConfirmPasswordValid(value: value, password: controller.passwordController.text),
      );

  Widget continueButtonView() => KNPWidgets.commonElevatedButton(
        isLoading: controller.confirmButtonValue.value,
        onPressed: controller.confirmButtonValue.value
            ? () => null
            : () => controller.clickOnContinueButtonView(),
        buttonText: 'Continue',
      );
}
