import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
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
              child1: Column(
                children: [
                  forgotYourPasswordTextView(),
                  SizedBox(height: 4.px),
                  emailAndPhoneNumberTextView(),
                ],
              ),
            child2: Form(
              key: controller.key,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
                shrinkWrap: true,
                children: [
                  emailAndMobileNumberTextFieldView(),
                  SizedBox(height: 20.px),
                  sendOtpButtonView(),
                ],
              ),
            )
          );
        }),
      ),
    );
  }

  Widget forgotYourPasswordTextView() => Text('Forgot your password', style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget emailAndPhoneNumberTextView() => Text(
    'Please enter your email / Phone number to reset the password',
    style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
    textAlign: TextAlign.center,
  );

  Widget emailAndMobileNumberTextFieldView() => KNPWidgets.commonTextFormField(
      title: 'Email / Phone',
      hintText: 'Email / Phone',
      controller: controller.emailAndMobileNumberController,
      focusNode: controller.emailMobileNumberFocusNode,
      validator: (value) => V.isValid(value: value, title: 'This filed is required.'),
  );

  Widget sendOtpButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: controller.sendOtpButtonValue.value
        ? () => null
        : () => controller.clickOnSendOtpButtonView(),
    buttonText: 'Send Otp',
    isLoading: controller.sendOtpButtonValue.value,
  );

}
