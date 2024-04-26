import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';

import '../controllers/welcome_massage_controller.dart';

class WelcomeMassageView extends GetView<WelcomeMassageController> {
  const WelcomeMassageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
          appBarTitle: 'Welcome massage',
          child2: ModalProgress(
            inAsyncCall: controller.apiResValue.value,
            child: controller.apiResValue.value
                ? KNPWidgets.commonProgressBarView()
                : ListView(
                    padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                    children: [
                      KNPWidgets.commonContainerView(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: Theme.of(Get.context!).textTheme.titleMedium,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      }),
    );
  }
}
