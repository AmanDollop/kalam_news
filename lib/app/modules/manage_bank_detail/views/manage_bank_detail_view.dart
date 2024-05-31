import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/manage_bank_detail_controller.dart';

class ManageBankDetailView extends GetView<ManageBankDetailController> {
  const ManageBankDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        if (AC.isConnect.value) {
          return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: PageConstVar.manageBank.tr,
            child2: KNPWidgets.commonRefreshIndicator(
              onRefresh: () async => await controller.onInit(),
              child: ModalProgress(
                inAsyncCall: controller.apiResValue.value,
                child: controller.apiResValue.value
                    ? KNPWidgets.myLoaderView()
                    : Padding(
                        padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                        child: Column(
                          children: [
                            Expanded(
                              child: controller.bankAccountsModal.value != null
                                  ? controller.bankAccountsList != null && controller.bankAccountsList!.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.bankAccountsList?.length,
                                      padding: EdgeInsets.only(bottom: CommonPaddingAndSize.size10()),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: CommonPaddingAndSize.size10()),
                                          child: KNPWidgets.commonContainerView(
                                            color: controller.bankAccountsList?[index].primaryBank == 1
                                                ? Theme.of(context).colorScheme.primary.withOpacity(.05)
                                                : Theme.of(context).colorScheme.inversePrimary,
                                            borderColor: controller.bankAccountsList?[index].primaryBank == 1
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(Get.context!).colorScheme.onSecondary,
                                            padding: EdgeInsets.only(left: CommonPaddingAndSize.size12()),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        bankNameTextView(text: controller.bankAccountsList?[index].bankName != null && controller.bankAccountsList![index].bankName!.isNotEmpty
                                                            ? '${controller.bankAccountsList?[index].bankName}'
                                                            : '?'),
                                                        SizedBox(width: 12.px),
                                                        if(controller.bankAccountsList?[index].primaryBank == 1)
                                                        primaryContainerView()
                                                      ],
                                                    ),
                                                    menuButtonView(index: index)
                                                  ],
                                                ),
                                                accountNumberTextView(text: controller.bankAccountsList?[index].accountNo != null && controller.bankAccountsList![index].accountNo!.isNotEmpty
                                                    ? '${controller.bankAccountsList?[index].accountNo}'
                                                    : '?' ).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                                                commonDividerView(),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    viewAccountDetailsTextView(),
                                                    downAndUpArrowButtonView(index: index)
                                                  ],
                                                ),
                                                AnimatedCrossFade(
                                                  firstChild: const SizedBox(),
                                                  secondChild: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      commonDividerView(),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          commonRowForDetailView(
                                                              text1: PageConstVar.accountHolderName.tr, text2: controller.bankAccountsList?[index].customerName != null && controller.bankAccountsList![index].customerName!.isNotEmpty
                                                              ? '${controller.bankAccountsList?[index].customerName}'
                                                              : '?',
                                                          ),
                                                          SizedBox(height: 5.px),
                                                          commonRowForDetailView(
                                                              text1: PageConstVar.accountNumber.tr, text2: controller.bankAccountsList?[index].accountNo != null && controller.bankAccountsList![index].accountNo!.isNotEmpty
                                                              ? '${controller.bankAccountsList?[index].accountNo}'
                                                              : '?',
                                                          ),
                                                          SizedBox(height: 5.px),
                                                          commonRowForDetailView(
                                                              text1: PageConstVar.accountType.tr, text2: controller.bankAccountsList?[index].accountType != null && controller.bankAccountsList![index].accountType!.isNotEmpty
                                                              ? capitalize(string: '${controller.bankAccountsList?[index].accountType}')
                                                              : '?',
                                                          ),
                                                          SizedBox(height: 5.px),
                                                          commonRowForDetailView(
                                                              text1: PageConstVar.iFSCCode.tr, text2: controller.bankAccountsList?[index].ifscCode != null && controller.bankAccountsList![index].ifscCode!.isNotEmpty
                                                              ? '${controller.bankAccountsList?[index].ifscCode}'
                                                              : '?',
                                                          ),
                                                          SizedBox(height: 5.px),
                                                          commonRowForDetailView(
                                                              text1: PageConstVar.branch.tr, text2: controller.bankAccountsList?[index].bankBranch != null && controller.bankAccountsList![index].bankBranch!.isNotEmpty
                                                              ? '${controller.bankAccountsList?[index].bankBranch}'
                                                              : '?',
                                                          ),
                                                        ],
                                                      ).paddingOnly(
                                                        right: CommonPaddingAndSize.size12(),
                                                        bottom: CommonPaddingAndSize.size12(),
                                                        top: CommonPaddingAndSize.size12(),
                                                      )
                                                    ],
                                                  ),
                                                  crossFadeState: controller.downAndUpValue.value != index.toString()
                                                      ? CrossFadeState.showFirst
                                                      : CrossFadeState.showSecond,
                                                  duration:
                                                  const Duration(milliseconds: 500),
                                                  secondCurve: Curves.easeInOutSine,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : KNPWidgets.noDataFoundView()
                                  : KNPWidgets.noDataFoundView(),
                             ),
                            addBankButtonView()
                          ],
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

  Widget bankNameTextView({required String text}) => Text(text, style: Theme.of(Get.context!).textTheme.displaySmall);

  Widget primaryContainerView() => Container(
        height: 20.px,
        width: 60.px,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
          borderRadius: BorderRadius.circular(10.px),
        ),
        child: Center(
          child: Text(
            PageConstVar.primary.tr,
            style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(color: Theme.of(Get.context!).colorScheme.primary),
          ),
        ),
      );

  Widget menuButtonView({required int index}) => KNPWidgets.commonIconButton(
        onPressed: () => controller.clickOnMenuButton(index: index),
        isAssetImage: true,
        imagePath: 'assets/icon/menu_icon.png',
      );

  Widget accountNumberTextView({required String text}) => Text(
        text.replaceRange(0, text.length - 4, "*" * (text.length - 4)),
        style: Theme.of(Get.context!).textTheme.labelSmall,
      );

  Widget commonDividerView() => Dash(
        direction: Axis.horizontal,
        length: 88.w,
        dashLength: 5.px,
        dashThickness: .5.px,
        dashColor: Theme.of(Get.context!).colorScheme.inverseSurface,
      );

  String capitalize({required String string}) => string[0].toUpperCase() + string.substring(1);

  Widget cardHeadlineTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget cardSubTitleTextView({required String text, TextAlign? textAlign, FontWeight? fontWeight}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(fontWeight: fontWeight),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget viewAccountDetailsTextView() => cardHeadlineTextView(text: PageConstVar.viewAccountDetails.tr);

  Widget downAndUpArrowButtonView({required int index}) => KNPWidgets.commonIconButton(
        onPressed: () => controller.clickOnDropDownButton(index: index),
        isAssetImage: false,
        icon: controller.downAndUpValue.value == index.toString()
            ? Icons.keyboard_arrow_down
            : Icons.keyboard_arrow_up,
        color: Theme.of(Get.context!).colorScheme.inverseSurface,
      );

  Widget commonRowForDetailView({required String text1, required String text2}) => Row(
        children: [
          Expanded(
            child: cardSubTitleTextView(text: text1),
          ),
          SizedBox(width: 6.px),
          cardHeadlineTextView(text: ':'),
          SizedBox(width: 6.px),
          Expanded(
            child: cardSubTitleTextView(
                text: text2,
                textAlign: TextAlign.end,
                fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );

  Widget addBankButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: () => controller.clickOnAddBankButton(),
        buttonText: PageConstVar.addBank.tr,
      );
}
