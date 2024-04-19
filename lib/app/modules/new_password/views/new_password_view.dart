import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness:
      Brightness.light, // For Android(M and greater): (dark icons)
    );
    return GestureDetector(
      onTap: () => KNPMethods.unFocsKeyBoard(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          controller.count.value;
          return Stack(
            children: [
              KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
                appBarTitle: 'Set new password',
                child2: Form(
                  key: controller.key,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
                    shrinkWrap: true,
                    children: [
                      setNewPasswordTextView(),
                      SizedBox(height: 20.px),
                      newPasswordTextFieldView(),
                      SizedBox(height: 20.px),
                      confirmPasswordTextFieldView(),
                      SizedBox(height: 20.px),
                      upDateButtonView(),
                    ],
                  ),
                )
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget setNewPasswordTextView() => Text(
    'Set new password',
    style: Theme.of(Get.context!).textTheme.labelLarge,
  );

  Widget newPasswordTextFieldView() => KNPWidgets.commonTextFormField(
    title: 'New password',
    hintText: 'New password',
    controller: controller.newPasswordController,
    focusNode: controller.newPasswordFocusNode,
    validator: (value) => V.isPasswordValid(value: value),
  );

  Widget confirmPasswordTextFieldView() => KNPWidgets.commonTextFormField(
    title: 'Confirm password',
    hintText: 'Confirm password',
    controller: controller.confirmPasswordController,
    focusNode: controller.confirmPasswordFocusNode,
    validator: (value) => V.isConfirmPasswordValid(value: value,password: controller.newPasswordController.text),
  );

  Widget upDateButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: controller.upDateButtonValue.value
        ? () => null
        : () => controller.clickOnUpDateButtonView(),
    buttonText: 'Update',
    isLoading: controller.upDateButtonValue.value
  );
}
