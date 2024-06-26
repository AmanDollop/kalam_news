import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness:
          Brightness.light, // For Android(M and greater): (dark icons)
    );
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => KNPMethods.unFocsKeyBoard(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Obx(() {
                controller.count.value;
                return Stack(
                  children: [
                    KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
                      child1: Column(
                        children: [
                          otpTextView(),
                          SizedBox(height: 4.px),
                          emailAndMobileNumberTextView(),
                        ],
                      ),
                      child2: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
                        shrinkWrap: true,
                        children: [
                          verificationCodeTextView(),
                          SizedBox(height: 20.px),
                          otpView(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              controller.timer.value
                                  ? KNPWidgets.commonTextButton(
                                  onPressed: () {},
                                  buttonText: 'Resend')
                                  : Row(
                                children: [
                                  Text(
                                    "Didn’t receive code? ",
                                    style: Theme.of(Get.context!).textTheme.titleMedium,
                                  ),
                                  KNPWidgets.commonTextButton(
                                      onPressed: () async {
                                        controller.timer.value = !controller.timer.value;
                                        await controller.callingSendOtpApi();
                                      },
                                      buttonText: 'Resend OTP'),
                                ],
                              ),
                              controller.timer.value
                                  ? Countdown(
                                seconds: 30,
                                build: (_, double time) {
                                  return Text(
                                    " 00:${time.toInt()} Sec",
                                    style: Theme.of(Get.context!).textTheme.bodySmall,
                                  );
                                },
                                interval: const Duration(milliseconds: 100),
                                onFinished: () {
                                  controller.timer.value = !controller.timer.value;
                                },
                              )
                                  : const SizedBox(),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          verifyButtonView(),
                        ],
                      )
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      );
    });
  }

  Widget otpTextView() => Text('OTP Verification', style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget emailAndMobileNumberTextView() => Text(
        'Enter the verification code we just send to your phone number 9876543210.',
        style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
        textAlign: TextAlign.center,
      );

  Widget verificationCodeTextView() => Text(
        'Verification code',
        style: Theme.of(Get.context!).textTheme.labelLarge,
      );

  Widget otpView() => Form(
        key: controller.key,
        child: KNPWidgets.commonOtpView(
            // validator: (value) => V.isValid(value: value, title: 'Invalidate verification code please send again.'),
            controller: controller.otpController),
      );

  Widget verifyButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: controller.verifyButtonValue.value
            ? () => null
            : () => controller.clickOnVerifyButtonView(),
        buttonText: 'Verify',
        isLoading: controller.verifyButtonValue.value,
      );
}
