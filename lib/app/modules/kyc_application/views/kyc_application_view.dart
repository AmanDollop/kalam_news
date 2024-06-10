import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/kyc_application_controller.dart';

class KycApplicationView extends GetView<KycApplicationController> {
  const KycApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return SingleChildScrollView(
          child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: PageConstVar.kycApplication.tr,
            child2: ModalProgress(
              inAsyncCall: controller.apiResValue.value,
              child: controller.apiResValue.value
                  ? KNPWidgets.myLoaderView()
                  : Padding(
                      padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                      child: Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  cardHeadlineTextView(text: PageConstVar.personalInformation.tr).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                  personalInformationCardView().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                  // cardHeadlineTextView(text: PageConstVar.profilePhoto.tr).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                  // profilePhotoCard().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                  cardHeadlineTextView(text: PageConstVar.aadharCardDetails.tr).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                  aadharCardDetailsCard().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                  cardHeadlineTextView(text: PageConstVar.panCardDetails.tr).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                  panCardDetailsCard().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                  // updateBankDetailsView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                                ],
                              ),
                            ),
                            submitButtonView()
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }

  Widget cardHeadlineTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget cardTitleTextView({required String text, TextAlign? textAlign}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.titleMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget cardSubTitleTextView({required String text, TextAlign? textAlign}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget commonRowForCard({required String text1, String? text2, bool buttonValue = false, GestureTapCallback? onTap}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonPaddingAndSize.size20(), vertical: CommonPaddingAndSize.size14()),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child:
                    cardTitleTextView(text: text1, textAlign: TextAlign.start),
              ),
              SizedBox(width: CommonPaddingAndSize.size10()),
              buttonValue
                  ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(Get.context!).colorScheme.inverseSurface,
                      size: 14.px,
                    )
                  : text2 != null && text2.isNotEmpty
                      ? Flexible(
                          flex: 3,
                          child: cardSubTitleTextView(
                              text: text2, textAlign: TextAlign.end),
                        )
                      : const SizedBox()
            ],
          ),
        ),
      );

  Widget personalInformationCardView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            commonRowForCard(
              text1: PageConstVar.name.tr,
              text2:
                  '${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.userId.tr,
              text2: controller.userData?.userDetails?.userId != null
                  ? '${controller.userData?.userDetails?.userId}'
                  : '?',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.referralCode.tr,
              text2: controller.userData?.userDetails?.referralCode != null &&
                      controller.userData!.userDetails!.referralCode!.isNotEmpty
                  ? '${controller.userData?.userDetails?.referralCode}'
                  : '?',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.city.tr,
              text2: controller.userData?.userDetails?.cityName != null &&
                      controller.userData!.userDetails!.cityName!.isNotEmpty
                  ? '${controller.userData?.userDetails?.cityName}'
                  : '?',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.dob.tr,
              text2: controller.userData?.userDetails?.dob != null &&
                      controller.userData!.userDetails!.dob!.isNotEmpty
                  ? CMForDateTime.dateFormatForDateMonthYear(
                      date: '${controller.userData?.userDetails?.dob}')
                  : '?',
            ),
          ],
        ),
      );

  Widget commonImageView({GestureTapCallback? onTap}) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          KNPWidgets.commonContainerView(
            width: 116.px,
            height: 70.px,
            padding: EdgeInsets.zero,
            color: Theme.of(Get.context!).colorScheme.surface,
            child: KNPWidgets.commonNetworkImageView(
                path: 'assets/image/empty_image.png', isAssetImage: true),
          ),
          InkWell(
            onTap: onTap,
            child: KNPWidgets.commonNetworkImageView(
                path: 'assets/icon/edit_icon.png',
                isAssetImage: true,
                height: 20.px,
                width: 20.px),
          )
        ],
      );

  Widget commonAddFileButtonView({GestureTapCallback? onTap, File? file}) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.px),
        child: KNPWidgets.commonContainerView(
          width: 116.px,
          height: 70.px,
          padding: EdgeInsets.zero,
          color: Theme.of(Get.context!).colorScheme.surface,
          child: file != null
              ? Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(
                        File(file.path ?? ''),
                        height: 110.px,
                        width: 110.px,
                      ),
                      commonIconButton(icon: Icons.cancel)
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonIconButton(icon: Icons.add),
                    cardTitleTextView(text: PageConstVar.addFile.tr),
                  ],
                ),
        ),
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

  Widget profilePhotoCard() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardTitleTextView(text: PageConstVar.uploadProfilePicture.tr)
                .paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
                onTap: () => controller.clickOnUploadProfilePicture(),
                file: controller.profilePic.value),
            // commonImageView()
          ],
        ),
      );

  Widget aadharCardDetailsCard() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aadharCardNumberTextFieldView().paddingOnly(bottom: CommonPaddingAndSize.size14()),
            cardTitleTextView(text: '${PageConstVar.aadharCardPhoto.tr} (${PageConstVar.frontSide.tr})*').paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
                onTap: () => controller.clickOnAadharCardFrontSide(),
                file: controller.aadharFrontImage.value,
            ).paddingOnly(bottom: CommonPaddingAndSize.size14()),
            cardTitleTextView(text: '${PageConstVar.aadharCardPhoto.tr} (${PageConstVar.backSide.tr})*').paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
                onTap: () => controller.clickOnAadharCardBackSide(),
                file: controller.aadharBackImage.value,
            ),
          ],
        ),
      );

  Widget aadharCardNumberTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.aadharNumber.tr}*',
        hintText: PageConstVar.aadharNumber.tr,
        controller: controller.aadharCardNumberController,
        focusNode: controller.aadharCardNumberFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 12,
        validator: (value) => V.isValidateAadhar(value: value),
      );

  Widget panCardDetailsCard() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            panCardNumberTextFieldView().paddingOnly(bottom: CommonPaddingAndSize.size14()),
            cardTitleTextView(text: '${PageConstVar.panCardPhoto}*'.tr).paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
                onTap: () => controller.clickOnPanCardPhoto(),
                file: controller.panCardImage.value,
            ),
          ],
        ),
      );

  Widget panCardNumberTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.panCardNumber.tr}*',
        hintText: PageConstVar.panCardNumber.tr,
        controller: controller.panCardNumberController,
        focusNode: controller.panCardNumberFocusNode,
        textCapitalization: TextCapitalization.characters,
        validator: (value) => V.isPanCardValid(value: value),
      );

  Widget updateBankDetailsView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: commonRowForCard(
          text1: PageConstVar.updateBankDetail.tr,
          buttonValue: true,
          onTap: () => controller.clickOnUpdateBankDetails(),
        ),
      );

  Widget submitButtonView() => KNPWidgets.commonElevatedButton(
      onPressed: controller.submitButtonValue.value
          ? () => null
          : () => controller.clickOnSubmitButton(),
      buttonText: PageConstVar.submit.tr,
      isLoading: controller.submitButtonValue.value
  );
}
