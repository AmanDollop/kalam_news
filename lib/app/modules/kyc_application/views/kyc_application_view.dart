import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
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
            appBarTitle: 'KYC application',
            child2: ModalProgress(
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
                              children: [
                                cardHeadlineTextView(text: 'Personal information').paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                personalInformationCardView().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                cardHeadlineTextView(text: 'Profile photo').paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                profilePhotoCard().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                cardHeadlineTextView(text: 'Aadhar card details').paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                aadharCardDetailsCard().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                                cardHeadlineTextView(text: 'Pan card details').paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                panCardDetailsCard(),
                                updateBankDetailsView().paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                              ],
                            ),
                        ),
                        submitButtonView()
                      ],
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
              text1: 'Name',
              text2: '${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'User id',
              text2: controller.userData?.userDetails?.userId != null
                  ? '${controller.userData?.userDetails?.userId}'
                  : '?',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'Referral code',
              text2: controller.userData?.userDetails?.referralCode != null &&
                      controller.userData!.userDetails!.referralCode!.isNotEmpty
                  ? '${controller.userData?.userDetails?.referralCode}'
                  : '?',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'City',
              text2: controller.userData?.userDetails?.cityName != null &&
                      controller.userData!.userDetails!.cityName!.isNotEmpty
                  ? '${controller.userData?.userDetails?.cityName}'
                  : '?',
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'Date of birth',
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

  Widget commonAddFileButtonView({GestureTapCallback? onTap}) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.px),
        child: KNPWidgets.commonContainerView(
          width: 116.px,
          height: 70.px,
          padding: EdgeInsets.zero,
          color: Theme.of(Get.context!).colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20.px,
                width: 20.px,
                margin: EdgeInsets.only(bottom: 4.px),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Theme.of(Get.context!).colorScheme.inversePrimary,
                    size: 16.px,
                  ),
                ),
              ),
              cardTitleTextView(text: 'Add file'),
            ],
          ),
        ),
      );

  Widget profilePhotoCard() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardTitleTextView(text: 'Upload profile picture').paddingOnly(bottom: 4.px),
            // commonAddFileButtonView(
            //   onTap: () => controller.clickOnUploadProfilePicture(),
            // ),
            commonImageView()
          ],
        ),
      );

  Widget aadharCardDetailsCard() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aAadharCardNumberTextFieldView().paddingOnly(bottom: CommonPaddingAndSize.size14()),
            cardTitleTextView(text: 'Aadhar card photo (Front side)').paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
              onTap: () => controller.clickOnAadharCardFrontSide(),
            ).paddingOnly(bottom: CommonPaddingAndSize.size14()),
            cardTitleTextView(text: 'Aadhar card photo (Back side)').paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
              onTap: () => controller.clickOnAadharCardBackSide(),
            ),
          ],
        ),
      );

  Widget aAadharCardNumberTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Aadhar card number*',
        hintText: 'Aadhar card number',
        controller: controller.aadharCardNumberController,
        focusNode: controller.aadharCardNumberFocusNode,
        validator: (value) => V.isValidateAadhar(value: value),
      );

  Widget panCardDetailsCard() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            panCardNumberTextFieldView().paddingOnly(bottom: CommonPaddingAndSize.size14()),
            cardTitleTextView(text: 'Pan card photo').paddingOnly(bottom: 4.px),
            commonAddFileButtonView(
              onTap: () => controller.clickOnPanCardPhoto(),
            ),
          ],
        ),
      );

  Widget panCardNumberTextFieldView() => KNPWidgets.commonTextFormField(
        title: 'Pan card number*',
        hintText: 'Pan card number',
        controller: controller.panCardNumberController,
        focusNode: controller.panCardNumberFocusNode,
        validator: (value) => V.isValidateAadhar(value: value),
      );

  Widget updateBankDetailsView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: commonRowForCard(
          text1: 'Update bank details',
          buttonValue: true,
          onTap: () => controller.clickOnUpdateBankDetails(),
        ),
      );

  Widget submitButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: () => controller.clickOnSubmitButton(),
    buttonText: 'Submit',
  );

}
