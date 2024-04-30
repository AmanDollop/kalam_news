import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';

import '../controllers/genealogy_controller.dart';

class GenealogyView extends GetView<GenealogyController> {
  const GenealogyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: 'Genealogy',
            onTapForBackButton: () => controller.onWillPop(),
            child2: KNPWidgets.commonRefreshIndicator(
              onRefresh: () async => controller.onInit(),
              child: ModalProgress(
                inAsyncCall: controller.apiResValue.value,
                child: controller.apiResValue.value
                    ? KNPWidgets.commonProgressBarView()
                    : ListView(
                  padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                  children: [

                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
