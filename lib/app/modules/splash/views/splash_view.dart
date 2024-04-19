import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: KNPWidgets.scaffoldBackgroundImageView(
          child: Center(
            child: KNPWidgets.commonProgressBarView(),
          ),
        ),
      );
    });
  }
}
