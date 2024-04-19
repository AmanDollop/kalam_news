import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/password_reset_successfully_controller.dart';

class PasswordResetSuccessfullyView extends GetView<PasswordResetSuccessfullyController> {
  const PasswordResetSuccessfullyView({Key? key}) : super(key: key);
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
              KNPWidgets.scaffoldBackgroundImageView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      successTextView(),
                      SizedBox(height: 4.px),
                      signInUpTextView(),
                      SizedBox(height: 20.px),
                      loginButtonView()
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

  Widget successTextView() => Text('Success', style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget signInUpTextView() => Text(
    'Your password has been successfully reset.',
    style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
  );

  Widget loginButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: () => controller.clickOnLogInButtonView(),
    buttonText: 'Login',
  );

}
