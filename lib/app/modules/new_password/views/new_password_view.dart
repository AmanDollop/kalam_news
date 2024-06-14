import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);

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
                  appBarTitle: controller.pageName.value,
                  child2: Padding(
                    padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                    child: Column(
                      children: [
                        Expanded(
                          child: Form(
                            key: controller.key,
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              children: [
                                setNewPasswordTextView(),
                                if (controller.pageName.value == PageConstVar.changePassword.tr)
                                SizedBox(height: CommonPaddingAndSize.size20()),
                                if (controller.pageName.value == PageConstVar.changePassword.tr)
                                oldPasswordTextFieldView(),
                                SizedBox(height: CommonPaddingAndSize.size20()),
                                newPasswordTextFieldView(),
                                SizedBox(height: CommonPaddingAndSize.size20()),
                                confirmPasswordTextFieldView(),
                              ],
                            ),
                          ),
                        ),
                        upDateButtonView(),
                      ],
                    ),
                  ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget setNewPasswordTextView() => Text(
        controller.pageName.value,
        style: Theme.of(Get.context!).textTheme.labelLarge,
      );

  Widget suffixIconButtonView({required bool visible, required VoidCallback onPressed}) => IconButton(
          icon: Icon(
            visible
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(Get.context!).colorScheme.onSurface,
            size: CommonPaddingAndSize.size20(),
          ),
          splashRadius: 20,
          onPressed: onPressed);

  Widget oldPasswordTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.oldPassword.tr}*',
        hintText: PageConstVar.oldPassword.tr,
        controller: controller.oldPasswordController,
        focusNode: controller.oldPasswordFocusNode,
        obscureText: !controller.oldPasswordVisible.value,
        suffixIcon: suffixIconButtonView(
          visible: controller.oldPasswordVisible.value,
          onPressed: () => controller.oldPasswordVisible.value = !controller.oldPasswordVisible.value,
        ),
        // validator: (value) => V.isPasswordValid(value: value),
      );

  Widget newPasswordTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.newPassword.tr}*',
        hintText: PageConstVar.newPassword.tr,
        controller: controller.newPasswordController,
        focusNode: controller.newPasswordFocusNode,
        obscureText: !controller.newPasswordVisible.value,
        suffixIcon: suffixIconButtonView(
          visible: controller.newPasswordVisible.value,
          onPressed: () => controller.newPasswordVisible.value = !controller.newPasswordVisible.value,
        ),
        validator: (value) => V.isPasswordValid(value: value),
      );

  Widget confirmPasswordTextFieldView() => KNPWidgets.commonTextFormField(
        title: '${PageConstVar.confirmPassword.tr}*',
        hintText: PageConstVar.confirmPassword.tr,
        controller: controller.confirmPasswordController,
        focusNode: controller.confirmPasswordFocusNode,
        obscureText: !controller.confirmPasswordVisible.value,
        suffixIcon: suffixIconButtonView(
          visible: controller.confirmPasswordVisible.value,
          onPressed: () => controller.confirmPasswordVisible.value =
              !controller.confirmPasswordVisible.value,
        ),
        validator: (value) => V.isConfirmPasswordValid(value: value, password: controller.newPasswordController.text),
      );

  Widget upDateButtonView() => KNPWidgets.commonElevatedButton(
      onPressed: controller.upDateButtonValue.value
          ? () => null
          : () => controller.clickOnUpDateButtonView(),
      buttonText: PageConstVar.verify.tr,
      isLoading: controller.upDateButtonValue.value,
  );

}
