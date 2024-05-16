import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import '../controllers/welcome_massage_controller.dart';

class WelcomeMassageView extends GetView<WelcomeMassageController> {
  const WelcomeMassageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        if (AC.isConnect.value) {
          return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: controller.pageName.value,
            child2: ModalProgress(
              inAsyncCall: controller.apiResValue.value,
              child: controller.apiResValue.value
                  ? KNPWidgets.myLoaderView()
                  : ListView(
                padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                children: [
                  KNPWidgets.removeHtmlTagsProductAndSellerDescription(string: controller.welcomeMessage.value),
                ],
              ),
            ),
          );
        } else {
          return KNPWidgets.noNetworkConnectionView();
        }
      }),
    );
  }

}
