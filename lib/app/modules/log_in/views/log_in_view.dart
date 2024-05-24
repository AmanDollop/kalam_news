import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/page_const_var/selected_language_page.dart';
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
                    appLogo(),
                    SizedBox(height: 14.px),
                    loginTextView(),
                    SizedBox(height: 4.px),
                    signInUpTextView(),
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
                    passwordTextFieldView(),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            checkBoxView(),
                            rememberMeTextView(text: PageConstVar.rememberMe.tr)
                          ],
                        ),
                        forgetPasswordTextButtonView()
                      ],
                    ),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    loginButtonView(),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        rememberMeTextView(text: '${PageConstVar.dontHaveAnAccount.tr}? '),
                        registeredNowTextButtonView()
                      ],
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }

  Widget appLogo() => KNPWidgets.commonNetworkImageView(path: 'assets/image/app_logo.png',height: 100.px,width: 100.px,isAssetImage: true);

  Widget loginTextView() => Text(PageConstVar.logIn.tr, style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget signInUpTextView() => Text(
        PageConstVar.signInUpToEnjoyTheBestManagingExperience.tr,
        style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
      );

  Widget emailAndMobileNumberTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.emailPhone.tr}*',
        hintText: PageConstVar.emailPhone.tr,
        controller: controller.emailAndMobileNumberController,
        focusNode: controller.emailMobileNumberFocusNode,
        validator: (value) => V.isValid(value: value, title: '${PageConstVar.thisFiledIsRequired.tr}.'),
      );

  Widget passwordTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.password.tr}*',
        hintText: PageConstVar.password.tr,
        controller: controller.passwordController,
        focusNode: controller.passwordFocusNode,
        obscureText: !controller.passwordVisible.value,
        suffixIcon: IconButton(
            icon: Icon(
              controller.passwordVisible.value
                  ? Icons.remove_red_eye_outlined
                  : Icons.visibility_off_outlined,
              color: Theme.of(Get.context!).colorScheme.onSurface,
              size: CommonPaddingAndSize.size20(),
            ),
            splashRadius: 20,
            onPressed: () {
              controller.passwordVisible.value = !controller.passwordVisible.value;
            },
        ),
        validator: (value) => V.isValid(value: value, title: '${PageConstVar.thisFiledIsRequired.tr}.'),
      );

  Widget checkBoxView() => KNPWidgets.commonCheckBoxView(
      changeValue: controller.rememberMeValue.value,
      onChanged: (value) {
        controller.rememberMeValue.value = !controller.rememberMeValue.value;
        controller.count.value++;
      },
      visualDensity: VisualDensity(horizontal: -4.px, vertical: -4.px),
  );

  Widget rememberMeTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(Get.context!).colorScheme.onSurface),
      );

  Widget forgetPasswordTextButtonView() => KNPWidgets.commonTextButton(
        onPressed: () => controller.clickOnForgetPasswordButton(),
        buttonText: '${PageConstVar.forgetPassword.tr}?',
      );

  Widget loginButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: controller.loginButtonValue.value
            ? () => null
            : () => controller.clickOnLogInButtonView(),
        buttonText: PageConstVar.logIn.tr,
        isLoading: controller.loginButtonValue.value,
      );

  Widget registeredNowTextButtonView() => KNPWidgets.commonTextButton(
        onPressed: () => controller.clickOnRegisteredNowButton(),
        buttonText: PageConstVar.registeredNow.tr,
      );

}
