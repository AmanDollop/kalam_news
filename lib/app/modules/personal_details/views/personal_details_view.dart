import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/packages/my_drop_down.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
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
      statusBarIconBrightness: Brightness.light, // For Android(M and greater): (dark icons)
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
              appBarTitle: PageConstVar.personalDetails.tr,
              child2: Form(
                key: controller.key,
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.myLoaderView()
                      : Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ListView(
                             padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                             shrinkWrap: true,
                             children: [
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
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               Row(
                                 children: [
                                   InkWell(
                                     onTap: () => controller.clickOnSameAsPhoneNumber(),
                                     child: Row(
                                       children: [
                                         checkBoxView(),
                                         SizedBox(width: 6.px),
                                         sameAsMobileNumberTextView(text: PageConstVar.sameAsPhoneNumber.tr)
                                       ],
                                     ),
                                   ),
                                   const Spacer()
                                 ],
                               ),
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               completeAddressTextFieldView(),
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               stateTextFieldView(),
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               if(controller.stateController.text.isNotEmpty)
                               cityTextFieldView(),
                               if(controller.stateController.text.isNotEmpty)
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               pinCodeTextFieldView(),
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               passwordTextFieldView(),
                               SizedBox(height: CommonPaddingAndSize.size20()),
                               confirmPasswordTextFieldView(),
                               SizedBox(height: CommonPaddingAndSize.size20()*3),
                             ],
                           ),
                          Container(
                            height: 80.px,
                            padding: EdgeInsets.symmetric(horizontal: CommonPaddingAndSize.size12(),vertical: CommonPaddingAndSize.size14()),
                            color: Theme.of(context).colorScheme.inversePrimary,
                            child: continueButtonView(),
                          ),
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
        title: '${PageConstVar.initials.tr}*',
        items: controller.initialsList,
        nameList: controller.initialsList,
        selectedItem: controller.selectedInitialsValue.value,
        hintText: '${PageConstVar.select.tr} ${PageConstVar.initials.tr}',
        focusNode: controller.initialsFocusNode,
        textEditingController: controller.initialsController,
        isOpenValue: controller.isInitialsDropDownValue.value,
        onTapForTextFiled: () {
          controller.isInitialsDropDownValue.value = !controller.isInitialsDropDownValue.value;
          if(!controller.isInitialsDropDownValue.value){
            KNPMethods.unFocsKeyBoard();
          }
          controller.count.value++;
        },
        clickOnListOfDropDown: (value) => controller.clickOnInitialsListOfDropDown(value: value),
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseSelectInitials.tr),
      );

  Widget firstNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.firstName.tr}*',
        hintText: PageConstVar.firstName.tr,
        controller: controller.firstNameController,
        focusNode: controller.firstNameFocusNode,
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterFirsName.tr),
      );

  Widget lastNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.lastName.tr}*',
        hintText: PageConstVar.lastName.tr,
        controller: controller.lastNameController,
        focusNode: controller.lastNameFocusNode,
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterLastName.tr),
      );

  Widget middleNameTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.middleName.tr} (${PageConstVar.optional.tr})',
        hintText: PageConstVar.middleName.tr,
        controller: controller.middleNameController,
        focusNode: controller.middleNameFocusNode,
      );

  Widget dobTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.dob.tr}*',
        hintText: PageConstVar.dob.tr,
        controller: controller.dobController,
        focusNode: controller.dobFocusNode,
        readOnly: true,
        onTap: () => controller.clickOnDobTextField(),
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterDob.tr),
      );

  Widget emailTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.emailID.tr} (${PageConstVar.optional.tr})',
        hintText: PageConstVar.emailID.tr,
        controller: controller.emailController,
        focusNode: controller.emailFocusNode,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
      );

  Widget phoneNumberFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.phoneNumber.tr}*',
        hintText: PageConstVar.phoneNumber.tr,
        controller: controller.mobileNumberController,
        focusNode: controller.mobileNumberFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 10,
        onChanged: (value) {
          controller.sameAsMobileNumberValue.value = false;
        },
        validator: (value) => V.isNumberValid(value: value),
      );

  Widget whatsappNumberFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.whatsAppNumber.tr} ( ${PageConstVar.optional.tr} )',
        hintText: PageConstVar.whatsAppNumber.tr,
        controller: controller.whatsappNumberController,
        focusNode: controller.whatsappNumberFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 10,
      );

  Widget checkBoxView() => KNPWidgets.commonCheckBoxView(
        width: 20.px,
        height: 20.px,
        changeValue: controller.sameAsMobileNumberValue.value,
        onChanged: (value) => controller.clickOnSameAsPhoneNumber(),
        visualDensity: VisualDensity(horizontal: -4.px, vertical: -4.px),
      );

  Widget sameAsMobileNumberTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(color: Theme.of(Get.context!).colorScheme.onSurface),
      );

  Widget completeAddressTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.completeAddress.tr}*',
        hintText: PageConstVar.completeAddress.tr,
        controller: controller.completeAddressController,
        focusNode: controller.completeAddressFocusNode,
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterCompleteAddress.tr),
      );

  Widget downArrowIconView() => Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Theme.of(Get.context!).colorScheme.onInverseSurface,
        size: 24.px,
      );

  Widget stateTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.state.tr}*',
        hintText: '${PageConstVar.select.tr} ${PageConstVar.state.toLowerCase().tr}',
        controller: controller.stateController,
        focusNode: controller.stateFocusNode,
        readOnly: true,
        suffixIcon: downArrowIconView(),
        onTap: () => controller.clickOnStateTextFormFiled(),
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseSelectState.tr),
      );

  Widget cityTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.city.tr}*',
        hintText: '${PageConstVar.select.tr} ${PageConstVar.city.toLowerCase().tr}',
        controller: controller.cityController,
        focusNode: controller.cityFocusNode,
        readOnly: true,
        suffixIcon: downArrowIconView(),
        onTap: () => controller.clickOnCityTextFormFiled(),
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseSelectCity.tr),
      );

  Widget pinCodeTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.pinCode.tr}*',
        hintText: PageConstVar.pinCode.tr,
        controller: controller.pinCodeController,
        focusNode: controller.pinCodeFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 6,
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterPinCode.tr),
      );

  Widget passwordTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.password.tr}*',
        hintText: PageConstVar.password.tr,
        controller: controller.passwordController,
        focusNode: controller.passwordFocusNode,
        validator: (value) => V.isPasswordValid(value: value),
      );

  Widget confirmPasswordTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.confirmPassword.tr}*',
        hintText: PageConstVar.confirmPassword.tr,
        controller: controller.confirmPasswordController,
        focusNode: controller.confirmPasswordFocusNode,
        validator: (value) => V.isConfirmPasswordValid(value: value, password: controller.passwordController.text),
      );

  Widget continueButtonView() => KNPWidgets.commonElevatedButton(
        isLoading: controller.confirmButtonValue.value,
        onPressed: controller.confirmButtonValue.value
            ? () => null
            : () => controller.clickOnContinueButtonView(),
        buttonText: PageConstVar.continueText.tr,
      );

}
