import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KNPMethods.unFocsKeyBoard(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          controller.count.value;
          return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarValue: false,
            child1: Center(
              child: Column(
                children: [
                  loginTextView(),
                  SizedBox(height: 4.px),
                  signInUpTextView(),
                ],
              ),
            ),
            child2: Form(
              key: controller.key,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
                shrinkWrap: true,
                children: [
                  emailAndMobileNumberTextFieldView(),
                  SizedBox(height: 20.px),
                  passwordTextFieldView(),
                  SizedBox(height: 20.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          checkBoxView(),
                          rememberMeTextView(text: 'Remember me')
                        ],
                      ),
                      forgetPasswordTextButtonView()
                    ],
                  ),
                  SizedBox(height: 20.px),
                  loginButtonView(),
                  SizedBox(height: 20.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      rememberMeTextView(text: 'Don’t have an account? '),
                      registeredNowTextButtonView()
                    ],
                  ),
                ],
              ),
            )
          );
        }),
      ),
    );
  }

  Widget loginTextView() => Text('Login', style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget signInUpTextView() => Text(
        'Sign in-up to enjoy the best managing experience',
        style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
      );

  Widget emailAndMobileNumberTextFieldView() => KNPWidgets.commonTextFormField(
      title: 'Email / Phone',
      hintText: 'Email / Phone',
      controller: controller.emailAndMobileNumberController,
      focusNode: controller.emailMobileNumberFocusNode,
      validator: (value) => V.isValid(value: value, title: 'This filed is required.'),
  );

  Widget passwordTextFieldView() => KNPWidgets.commonTextFormField(
      title: 'Password',
      hintText: 'Password',
      controller: controller.passwordController,
      focusNode: controller.passwordFocusNode,
      obscureText: !controller.passwordVisible.value,
      suffixIcon: IconButton(
          icon: Icon(
            controller.passwordVisible.value
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(Get.context!).colorScheme.onSurface,
            size: 20.px,
          ),
          splashRadius: 20,
          onPressed: () {
            controller.passwordVisible.value = !controller.passwordVisible.value;
          }
      ),
     validator: (value) => V.isValid(value: value, title: 'This filed is required.'),
  );

  Widget checkBoxView() => KNPWidgets.commonCheckBoxView(
      changeValue: controller.rememberMeValue.value,
      onChanged: (value) {
        controller.rememberMeValue.value = !controller.rememberMeValue.value;
        controller.count.value++;
      },
      visualDensity: VisualDensity(horizontal: -4.px, vertical: -4.px));

  Widget rememberMeTextView({required String text}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(color: Theme.of(Get.context!).colorScheme.onSurface),
  );

  Widget forgetPasswordTextButtonView() => KNPWidgets.commonTextButton(
      onPressed: () => controller.clickOnForgetPasswordButton(),
      buttonText: 'Forget Password?');

  Widget loginButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: controller.loginButtonValue.value
            ? () => null
            : () => controller.clickOnLogInButtonView(),
        buttonText: 'Login',
        isLoading: controller.loginButtonValue.value,
      );

  Widget registeredNowTextButtonView() => KNPWidgets.commonTextButton(
      onPressed: () => controller.clickOnRegisteredNowButton(),
      buttonText: 'Registered Now',
  );

}
