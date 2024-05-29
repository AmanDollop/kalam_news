import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        if (AC.isConnect.value) {
          return WillPopScope(
            onWillPop: () => controller.onWillPop(),
            child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: PageConstVar.wallet.tr,
              onTapForBackButton: () => controller.onWillPop(),
              child2: KNPWidgets.commonRefreshIndicator(
                onRefresh: () async => controller.onInit(),
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.myLoaderView()
                      : controller.withdrawHistoryModal.value != null
                          ? ListView(
                              padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textFiledTitleTextView(text: PageConstVar.withdrawalAmount.tr),
                                    InkWell(
                                      onTap: () {
                                        controller.hideShowWithdrawFieldValue.value = !controller.hideShowWithdrawFieldValue.value;
                                        controller.count.value++;
                                      },
                                      child: Icon(
                                        controller.hideShowWithdrawFieldValue.value
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down,
                                        color: controller.hideShowWithdrawFieldValue.value
                                            ? Theme.of(context).colorScheme.primary
                                            : Theme.of(context).colorScheme.secondary,
                                        size: 26.px,
                                      ),
                                    )
                                  ],
                                ),
                                AnimatedCrossFade(
                                  firstChild: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: CommonPaddingAndSize.size10()),
                                      withdrawAmountTextFieldView(),
                                      SizedBox(height: CommonPaddingAndSize.size16()),
                                      withdrawNowButtonView(),
                                      KNPWidgets.commonDividerView(height: CommonPaddingAndSize.size12() * 2),
                                    ],
                                  ),
                                  secondChild: SizedBox(height: CommonPaddingAndSize.size12()),
                                  crossFadeState: controller.hideShowWithdrawFieldValue.value
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: const Duration(milliseconds: 500),
                                ),
                                totalIncomeView(),
                                SizedBox(height: CommonPaddingAndSize.size16()),
                                historyView(),
                                SizedBox(height: CommonPaddingAndSize.size20() * 4)
                              ],
                            )
                          : KNPWidgets.noDataFoundView(),
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

  Widget totalIncomeTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.labelLarge,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget totalIncomeView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.all(12.px),
        // color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
        // borderColor: Theme.of(Get.context!).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            totalIncomeTextView(text: PageConstVar.totalIncome.tr),
            totalIncomeTextView(
              text: controller.withdrawHistoryModal.value?.totalCommission != null
                  ? '₹${controller.withdrawHistoryModal.value?.totalCommission}'
                  : '₹00',
            ),
            KNPWidgets.commonDividerView(height: CommonPaddingAndSize.size12() * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardHeadlineTextView(
                        text: controller.withdrawHistoryModal.value?.totalCommission != null
                            ? '₹${controller.withdrawHistoryModal.value?.totalCommission}'
                            : '₹00',
                      ),
                      cardSubTitleTextView(text: PageConstVar.totalCommission.tr),
                      commonDividerView().paddingSymmetric(vertical: CommonPaddingAndSize.size10()),
                      cardHeadlineTextView(
                        text: controller.withdrawHistoryModal.value?.availableBalance != null
                            ? '₹${controller.withdrawHistoryModal.value?.availableBalance}'
                            : '₹00',
                      ),
                      cardSubTitleTextView(text: PageConstVar.availableWithdrawBlance.tr),
                    ],
                  ),
                ),
                SizedBox(width: 10.px),
                KNPWidgets.commonProgressBarView(
                  strokeWidth: 14.px,
                  value: .7,
                  height: 80.px,
                  width: 80.px,
                  progressTextValue: '70%'
                )
              ],
            )
          ],
        ),
      );

  Widget commonDividerView() => Dash(
        direction: Axis.horizontal,
        length: 48.w,
        dashGap: 1.px,
        dashLength: 1.px,
        dashThickness: .5.px,
        dashColor: Theme.of(Get.context!).colorScheme.inverseSurface,
      );

  Widget textFiledTitleTextView({required String text, double? fontSize, Color? textColor}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.displaySmall?.copyWith(fontSize: fontSize, color: textColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget withdrawAmountTextFieldView() => KNPWidgets.commonTextFormField(
        title: '',
        hintText: '₹ ${PageConstVar.enterAmount.tr}',
        controller: controller.withdrawAmountController,
        focusNode: controller.withdrawAmountFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 7,
        // onChanged: (value) {
        //   print('value::::::$value');
        //   if(int.parse(controller.withdrawHistoryModal.value?.availableBalance ?? '0') >= int.parse(value)){
        //
        //   }else{
        //     KNPMethods.showSnackBar(message: 'Insufficient balance.');
        //   }
        //   controller.count.value++;
        // },
        // validator: (value) => V.isValid(value: value, title: 'Please enter withdraw amount'),
      );

  Widget withdrawNowButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: controller.withdrawNowButtonValue.value
            ? () => null
            : () => controller.clickOnWithdrawNowButton(),
        buttonText: PageConstVar.withdrawNow.tr,
        isLoading: controller.withdrawNowButtonValue.value,
      );

  Widget cardHeadlineTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget cardSubTitleTextView({required String text, TextAlign? textAlign}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.titleMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget historyView() => KNPWidgets.commonContainerView(
        borderColor: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.px, vertical: CommonPaddingAndSize.size10()),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.px),
                  topRight: Radius.circular(8.px),
                ),
              ),
              child: cardHeadlineTextView(text: PageConstVar.history.tr),
            ),
            KNPWidgets.commonDividerView(
              height: 0,
              wight: 1.px,
              color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
            ),
            Padding(
              padding: EdgeInsets.all(CommonPaddingAndSize.size16()),
              child: withdrawHistoryListView(),
            ),
          ],
        ),
      );

  Widget withdrawHistoryListView() {
    if (controller.walletHistory != null && controller.walletHistory!.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.walletHistory?.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFiledTitleTextView(text: 'Kotak mahindra  bank', fontSize: 12.px),
                        if (controller.walletHistory?[index].createdAt != null && controller.walletHistory![index].createdAt!.isNotEmpty)
                          cardSubTitleTextView(
                            text: controller.walletHistory?[index].transactionType == 'income'
                                ? '${PageConstVar.creditOn.tr} ${CMForDateTime.dateFormatForDateMonthYearHourMinSec(dateAndTime: '${controller.walletHistory?[index].createdAt}')}'
                                : '${PageConstVar.depositOn.tr} ${CMForDateTime.dateFormatForDateMonthYearHourMinSec(dateAndTime: '${controller.walletHistory?[index].createdAt}')}',
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: CommonPaddingAndSize.size10()),
                  Flexible(
                    flex: 2,
                    child: textFiledTitleTextView(
                        text: controller.walletHistory?[index].transactionType == 'income'
                            ? '+ ₹${controller.walletHistory?[index].amount}'
                            : '- ₹${controller.walletHistory?[index].amount}',
                        textColor: controller.walletHistory?[index].transactionType == 'income'
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.error),
                  ),
                ],
              ),
              if (controller.walletHistory?.length != null && controller.walletHistory!.isNotEmpty)
              if (index != controller.walletHistory!.length - 1)
              KNPWidgets.commonDividerView(
               height: CommonPaddingAndSize.size12() * 2,
               leftPadding: 0,
               rightPadding: 0,
              ),
            ],
          );
        },
      );
    } else {
      return KNPWidgets.noDataFoundView();
    }
  }

}
