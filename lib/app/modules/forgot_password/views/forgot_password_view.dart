import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KNPMethods.unFocsKeyBoard(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          controller.count.value;
          return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: '',
              child1: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    forgotYourPasswordTextView(),
                    SizedBox(height: 4.px),
                    emailAndPhoneNumberTextView(),
                  ],
                ),
              ),
            child2: Form(
              key: controller.key,
              child: ListView(
                padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                shrinkWrap: true,
                children: [
                  emailAndMobileNumberTextFieldView(),
                  SizedBox(height: CommonPaddingAndSize.size20()),
                  sendOtpButtonView(),
                ],
              ),
            )
          );
        }),
      ),
    );
  }

  Widget forgotYourPasswordTextView() => Text(PageConstVar.forgotYourPassword.tr, style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget emailAndPhoneNumberTextView() => Text(
    PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword.tr,
    style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
    textAlign: TextAlign.center,
  );

  Widget emailAndMobileNumberTextFieldView() => KNPWidgets.commonTextFormField(
      title: '${PageConstVar.emailPhone.tr}*',
      hintText: PageConstVar.emailPhone.tr,
      controller: controller.emailAndMobileNumberController,
      focusNode: controller.emailMobileNumberFocusNode,
      keyboardType: TextInputType.number,
      maxLength: 10,
      validator: (value) => V.isNumberValid(value: value),
  );

  Widget sendOtpButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: controller.sendOtpButtonValue.value
        ? () => null
        : () => controller.clickOnSendOtpButtonView(),
    buttonText: PageConstVar.sendOTP.tr,
    isLoading: controller.sendOtpButtonValue.value,
  );

}
