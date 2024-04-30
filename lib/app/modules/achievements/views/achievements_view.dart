import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import '../controllers/achievements_controller.dart';

class AchievementsView extends GetView<AchievementsController> {
  const AchievementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        if (AC.isConnect.value) {
          return WillPopScope(
            onWillPop: () => controller.onWillPop(),
            child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: 'Achievements',
              onTapForBackButton: () => controller.onWillPop(),
              child2: KNPWidgets.commonRefreshIndicator(
                onRefresh: () async => controller.onInit(),
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.commonProgressBarView()
                      : Padding(
                    padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KNPWidgets.noDataFoundView(),
                      ],
                    ),
                  ),
                ),
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
