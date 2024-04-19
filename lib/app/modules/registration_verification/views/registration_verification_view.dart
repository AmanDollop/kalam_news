import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/registration_verification_controller.dart';

class RegistrationVerificationView
    extends GetView<RegistrationVerificationController> {
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
                appBarTitle: 'Verify Registered',
                child2: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
                  shrinkWrap: true,
                  children: [
                    referralCodeTextFieldView(),
                    SizedBox(height: 20.px),
                    youAreRegisteringTextView(
                        text: 'You are registering a new member under'),
                    SizedBox(height: 20.px),
                    commonRowView(
                      text1: 'Reference Code',
                      text2:
                          'AB1234567980AB123456798 0AB123456798 0AB12345679 80AB1 234567980AB123 4567980',
                    ),
                    SizedBox(height: 10.px),
                    commonRowView(
                      text1: 'Name',
                      text2: 'Dollop Infotech PVT.LTD',
                    ),
                    SizedBox(height: 10.px),
                    commonRowView(
                      text1: 'Mobile',
                      text2: '1234567890',
                    ),
                    SizedBox(height: 10.px),
                    commonRowView(
                        text1: 'City', text2: 'Indore', isDivider: false),
                    SizedBox(height: 20.px),
                    youAreRegisteringTextView(
                        text: 'Please select which way do you want to go?',
                    ),
                    SizedBox(height: 20.px),
                    Row(
                      children: [
                        KNPWidgets.commonRadioButtonWithTitle(
                          title: 'Left',
                          value: controller.selectRadioValue.value,
                          onTap: () {
                            controller.selectRadioValue.value = "Left";
                            controller.count.value++;
                          },
                        ),
                        SizedBox(width: 16.px),
                        KNPWidgets.commonRadioButtonWithTitle(
                          title: 'Right',
                          value: controller.selectRadioValue.value,
                          onTap: () {
                            controller.selectRadioValue.value = "Right";
                            controller.count.value++;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.px),
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
        title: 'Referral code',
        hintText: 'Referral code',
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
        buttonText: 'Proceed',
      );
}
