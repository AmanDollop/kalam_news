import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
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
                appBarTitle: 'Registered',
                child2: ListView(
                  padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                  shrinkWrap: true,
                  children: [
                    referralCodeTextFieldView(),
                    SizedBox(height: CommonPaddingAndSize.size20()),
                    verifyButtonView(),
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
      title: 'Referral code*',
      hintText: 'Referral code',
      controller: controller.referralCodeController,
      focusNode: controller.referralCodeFocusNode,
  );

  Widget verifyButtonView() => KNPWidgets.commonElevatedButton(
    onPressed: () => controller.clickOnVerifyButtonView(),
    buttonText: 'Verify',
  );

}
