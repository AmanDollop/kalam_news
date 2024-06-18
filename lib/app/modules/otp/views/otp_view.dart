import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
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
                        child1: Center(
                          child: Column(
                            children: [
                              otpTextView(),
                              SizedBox(height: 4.px),
                              emailAndMobileNumberTextView(),
                            ],
                          ),
                        ),
                        child2: ListView(
                          padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                          shrinkWrap: true,
                          children: [
                            verificationCodeTextView(),
                            SizedBox(height: CommonPaddingAndSize.size20()),
                            otpView(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                controller.timer.value
                                    ? KNPWidgets.commonTextButton(onPressed: () {}, buttonText: PageConstVar.resend.tr)
                                    : Row(
                                        children: [
                                          Text(
                                            "${PageConstVar.didntReceiveCode.tr} ",
                                            style: Theme.of(Get.context!).textTheme.titleMedium,
                                          ),
                                          KNPWidgets.commonTextButton(
                                            onPressed: () async {
                                              controller.timer.value = !controller.timer.value;
                                              await controller.callingSendOtpApi();
                                            },
                                            buttonText: PageConstVar.resendOTP.tr,
                                          ),
                                        ],
                                      ),
                                controller.timer.value
                                    ? Countdown(
                                        seconds: 10,
                                        build: (_, double time) {
                                          return Text(
                                            " 00:${time.toInt()} ${PageConstVar.sec.tr}",
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
                            SizedBox(height: CommonPaddingAndSize.size20()),
                            verifyButtonView(),
                          ],
                        ),
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

  Widget otpTextView() => Text(PageConstVar.otpVerification.tr, style: Theme.of(Get.context!).textTheme.headlineLarge);

  Widget emailAndMobileNumberTextView() => Text(
        PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber.tr,
        style: Theme.of(Get.context!).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.onPrimary),
        textAlign: TextAlign.center,
      );

  Widget verificationCodeTextView() => Text(
        PageConstVar.verificationCode.tr,
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
        buttonText: PageConstVar.verify.tr,
        isLoading: controller.verifyButtonValue.value,
      );
}
