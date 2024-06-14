import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/packages/my_drop_down.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
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
        return GestureDetector(
          onTap: () {
            KNPMethods.unFocsKeyBoard();
            controller.isInitialsDropDownValue.value = false;
          },
          child: SingleChildScrollView(
            child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: PageConstVar.editProfile.tr,
              child2: Form(
                key: controller.key,
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.myLoaderView()
                      : Padding(
                        padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  children: [
                                    Center(
                                      child: userProfileView(),
                                    ),
                                    mrAndMrsTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                    firstNameTextFieldView(),
                                    middleNameTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                    lastNameTextFieldView(),
                                    dobTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                    emailTextFieldView(),
                                    phoneNumberFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                    whatsappNumberFieldView(),
                                    Row(
                                      children: [
                                        checkBoxView(),
                                        sameAsMobileNumberTextView(text: PageConstVar.sameAsPhoneNumber.tr)
                                      ],
                                    ).paddingSymmetric(vertical: CommonPaddingAndSize.size10()),
                                    completeAddressTextFieldView(),
                                    stateTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                    cityTextFieldView(),
                                    pinCodeTextFieldView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                  ],
                                ),
                            ),
                            upDateButtonView(),
                          ],
                        ),
                      ),
                ),
              ),
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
        child: Center(
                child: controller.image.value?.path != null && controller.image.value!.path.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(55.px),
                      child: Image.file(
                        File(controller.image.value?.path ?? ''),
                        height: 110.px,
                        width: 110.px,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) => KNPWidgets.commonNetworkImageView(path: 'assets/image/profile.png',isAssetImage: true),
                      ),
                    )
                    : KNPWidgets.commonNetworkImageView(
                       path: KNPMethods.baseUrlForNetworkImage(imagePath: controller.userPic.value),
                       radius: 55.px,
                       height: 110.px,
                       width: 110.px,
                       fit: BoxFit.fill,
                       errorImage: 'assets/image/profile.png',
                   ),
               ),
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
            boxShadow: [
              BoxShadow(
                color: Theme.of(Get.context!).colorScheme.onSurface,
                blurRadius: 5
              )
            ]
          ),
          child: KNPWidgets.commonNetworkImageView(path: 'assets/icon/edit_icon.png', isAssetImage: true),
        ),
      );

  Widget lockIconView() => Icon(
        Icons.lock,
        color: Theme.of(Get.context!).colorScheme.onInverseSurface,
        size: 18.px,
      );

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
        title: '${PageConstVar.middleName.tr} ( ${PageConstVar.optional.tr} )',
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
      validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterDob.tr),
      suffixIcon: lockIconView(),
  );

  Widget emailTextFieldView() => KNPWidgets.commonTextFormField(
      title: '${PageConstVar.emailID.tr}*',
      hintText: PageConstVar.emailID.tr,
      controller: controller.emailController,
      focusNode: controller.emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      readOnly: true,
      validator: (value) => V.isEmailValid(value: value),
      suffixIcon: lockIconView(),
  );

  Widget phoneNumberFieldView() => KNPWidgets.commonTextFormField(
      title: '${PageConstVar.phoneNumber.tr}*',
      hintText: PageConstVar.phoneNumber.tr,
      controller: controller.mobileNumberController,
      focusNode: controller.mobileNumberFocusNode,
      keyboardType: TextInputType.number,
      readOnly: true,
      maxLength: 10,
      validator: (value) => V.isNumberValid(value: value),
      suffixIcon: lockIconView(),
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
        changeValue: controller.sameAsMobileNumberValue.value,
        onChanged: (value) {
          if (controller.mobileNumberController.text.isNotEmpty) {
            controller.sameAsMobileNumberValue.value = !controller.sameAsMobileNumberValue.value;
            if (controller.sameAsMobileNumberValue.value) {
              controller.whatsappNumberController.text = controller.mobileNumberController.text;
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
        title: '${PageConstVar.completeAddress.tr}*',
        hintText: PageConstVar.completeAddress.tr,
        controller: controller.completeAddressController,
        focusNode: controller.completeAddressFocusNode,
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseEnterCompleteAddress.tr),
      );

  Widget stateTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.state.tr}*',
        hintText: '${PageConstVar.select.tr} ${PageConstVar.state.tr}',
        controller: controller.stateController,
        focusNode: controller.stateFocusNode,
        readOnly: true,
        suffixIcon: lockIconView(),
        validator: (value) => V.isValid(value: value, title: PageConstVar.pleaseSelectState.tr),
      );

  Widget cityTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.city.tr}*',
        hintText: '${PageConstVar.select.tr} ${PageConstVar.city.tr}',
        controller: controller.cityController,
        focusNode: controller.cityFocusNode,
        readOnly: true,
        suffixIcon: lockIconView(),
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

  Widget upDateButtonView() => KNPWidgets.commonElevatedButton(
        isLoading: controller.saveButtonValue.value,
        onPressed: controller.saveButtonValue.value
            ? () => null
            : () => controller.clickOnUpdateButton(),
        buttonText: PageConstVar.update.tr,
      );

}
