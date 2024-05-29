import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/registration_verification_controller.dart';

class RegistrationVerificationView extends GetView<RegistrationVerificationController> {
  const RegistrationVerificationView({Key? key}) : super(key: key);

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
                appBarTitle: PageConstVar.verifyRegistered.tr,
                child2: ListView(
                  padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                  shrinkWrap: true,
                  children: [
                    referralCodeTextFieldView(),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    youAreRegisteringTextView(text: PageConstVar.youAreRegisteringANewMemberUnder.tr),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    commonRowView(
                      text1: PageConstVar.name.tr,
                      text2: '${controller.referralUserData?.name}',
                    ),
                    SizedBox(height: CommonPaddingAndSize.size10()),
                    commonRowView(
                      text1: PageConstVar.referralCode.tr,
                      text2: '${controller.referralUserData?.referralCode}',
                    ),
                    SizedBox(height: CommonPaddingAndSize.size10()),
                    commonRowView(
                      text1: PageConstVar.mobile.tr,
                      text2: '${controller.referralUserData?.mobileNumber}',
                    ),
                    SizedBox(height: CommonPaddingAndSize.size10()),
                    commonRowView(text1: PageConstVar.city.tr, text2: '${controller.referralUserData?.city}', isDivider: false),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    youAreRegisteringTextView(text:PageConstVar.pleaseSelectWhichWayDoYouWantToGo.tr),
                    Row(
                      children: [
                        KNPWidgets.commonRadioButtonWithTitle(
                          title: PageConstVar.left.tr,
                          value: controller.selectRadioValue.value,
                          onTap: () {
                            controller.selectRadioValue.value = PageConstVar.left.tr;
                            controller.count.value++;
                          },
                        ),
                        SizedBox(width: CommonPaddingAndSize.size16()),
                        KNPWidgets.commonRadioButtonWithTitle(
                          title: PageConstVar.right.tr,
                          value: controller.selectRadioValue.value,
                          onTap: () {
                            controller.selectRadioValue.value = PageConstVar.right.tr;
                            controller.count.value++;
                          },
                        ),
                      ],
                    ).paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                    proceedButtonView(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget referralCodeTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.referralCodeOrPhone.tr}*',
        hintText: PageConstVar.referralCodeOrPhone.tr,
        controller: controller.referralCodeController,
        focusNode: controller.referralCodeFocusNode,
        readOnly: true,
      );

  Widget youAreRegisteringTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.labelLarge,
      );

  Widget commonRowView({required String text1, required String text2, bool isDivider = true}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                text1,
                style: Theme.of(Get.context!).textTheme.bodySmall,
              ),
              Text(
                ' : ',
                style: Theme.of(Get.context!).textTheme.bodySmall,
              ),
              Expanded(
                child: Text(
                  text2,
                  style: Theme.of(Get.context!).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (isDivider) SizedBox(height: 6.px),
          if (isDivider) KNPWidgets.commonDividerView(),
        ],
      );

  Widget proceedButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: () => controller.clickOnProceedButtonView(),
        buttonText: PageConstVar.proceed.tr,
      );
}
