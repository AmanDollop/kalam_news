import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/welcome_massage_controller.dart';

class WelcomeMassageView extends GetView<WelcomeMassageController> {
  const WelcomeMassageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
          appBarTitle: controller.pageName.value,
          child2: ModalProgress(
            inAsyncCall: controller.apiResValue.value,
            child: controller.apiResValue.value
                ? KNPWidgets.commonProgressBarView()
                : ListView(
                    padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                    children: [
                      removeHtmlTagsProductAndSellerDescription(string: controller.welcomeMessage.value),
                    ],
                  ),
          ),
        );
      }),
    );
  }

  Widget removeHtmlTagsProductAndSellerDescription({required String string}) {
    return Html(
      data: string.trim(),
      // shrinkWrap: false,
      style: {
        "body": Style(
            fontSize: FontSize(12.px),
            fontWeight: FontWeight.w500,
            color: Theme.of(Get.context!).colorScheme.secondary,margin: Margins.zero, padding: HtmlPaddings.zero,),
        "li": Style(
          listStyleType: ListStyleType.circle,
          margin: Margins.zero,
          padding: HtmlPaddings.zero
        ),
      },
    ).paddingZero;
  }
}
