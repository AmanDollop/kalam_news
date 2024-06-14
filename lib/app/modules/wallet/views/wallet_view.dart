import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:lottie/lottie.dart';
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
                                        controller.withdrawAmountController.clear();
                                        controller.hideShowWithdrawFieldValue.value = !controller.hideShowWithdrawFieldValue.value;
                                        controller.count.value++;
                                      },
                                      child: /*Row(
                                        children: [
                                          cardHeadlineTextView(text: controller.hideShowWithdrawFieldValue.value ? 'Hide':'Show'),
                                          Icon(
                                            controller.hideShowWithdrawFieldValue.value
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Theme.of(context).colorScheme.secondary,
                                            size: 26.px,
                                          ),
                                        ],
                                      )*/
                                      Row(
                                        children: [
                                          Lottie.asset(
                                            controller.hideShowWithdrawFieldValue.value
                                              ? 'assets/animations/left_arrow.json'
                                              :'assets/animations/right_arrow.json',
                                            height: 30.px,
                                            width: 20.px,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 10.px),
                                          if(!controller.hideShowWithdrawFieldValue.value)
                                          Lottie.asset(
                                            'assets/animations/withdraw_money.json',
                                            height: 24.px,
                                            width: 24.px,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 10.px),
                                        ],
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
                                SizedBox(height: CommonPaddingAndSize.size20() * 4),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  totalIncomeTextView(text: PageConstVar.totalIncome.tr),
                  totalIncomeTextView(
                    text: controller.withdrawHistoryModal.value?.totalCommission != null
                        ? '₹${controller.withdrawHistoryModal.value?.totalCommission}'
                        : '₹00',
                  ),
                ],
              ),
                depositAndUnWithdrawalView()
              ],
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
                        text: controller.withdrawHistoryModal.value?.walletBalance != null
                            ? '₹${controller.withdrawHistoryModal.value?.walletBalance}'
                            : '₹00',
                      ),
                      cardSubTitleTextView(text: PageConstVar.walletBalance.tr),

                      commonDividerView().paddingSymmetric(vertical: CommonPaddingAndSize.size10()),

                      cardHeadlineTextView(
                        text: controller.withdrawHistoryModal.value?.totalWithdrawal != null
                            ? '₹${controller.withdrawHistoryModal.value?.totalWithdrawal}'
                            : '₹00',
                      ),
                      cardSubTitleTextView(text: PageConstVar.totalWithdrawal.tr),

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
                    value: controller.withdrawHistoryModal.value?.percentage != null && controller.withdrawHistoryModal.value!.percentage != 0
                        ? controller.withdrawHistoryModal.value!.percentage! / 100
                        : 0,
                    height: 120.px,
                    width: 120.px,
                    progressTextValue: controller.withdrawHistoryModal.value?.percentage != null && controller.withdrawHistoryModal.value!.percentage != 0
                        ? '${controller.withdrawHistoryModal.value?.percentage}%'
                        : '0%')
              ],
            ),
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
        onChanged: (value) async {
          if (value.isNotEmpty && int.parse(value) > 0) {
            if (int.parse(controller.withdrawHistoryModal.value?.availableBalance ?? '0') >= int.parse(value)) {
              if (int.parse(controller.withdrawHistoryModal.value?.limitBalance ?? '0') >= int.parse(value)) {
                  controller.disableWithdrawButton.value = true;
                  await Fluttertoast.cancel();
              }
              else {
                controller.disableWithdrawButton.value = false;
                await Fluttertoast.cancel();
                KNPMethods.showSnackBar(message: 'Your withdrawal limit has been exceeded.');
              }
            }
            else {
              controller.disableWithdrawButton.value = false;
              await Fluttertoast.cancel();
              KNPMethods.showSnackBar(message: 'You have insufficient balance.');
            }
          }
          else {
            controller.disableWithdrawButton.value = false;
            await Fluttertoast.cancel();
          }
        },
        // validator: (value) => V.isValid(value: value, title: 'Please enter withdraw amount'),
      );

  Widget withdrawNowButtonView() => KNPWidgets.commonElevatedButton(
      onPressed: controller.disableWithdrawButton.value
          ? controller.withdrawNowButtonValue.value
              ? () => null
              : () => controller.clickOnWithdrawNowButton()
          : () => null,
      buttonText: PageConstVar.withdrawNow.tr,
      isLoading: controller.withdrawNowButtonValue.value,
      buttonColor: controller.disableWithdrawButton.value
          ? Theme.of(Get.context!).colorScheme.primary
          : Theme.of(Get.context!).colorScheme.primary.withOpacity(.6),
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
                        textColor:
                            controller.walletHistory?[index].transactionType == 'income'
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
    }
    else {
      return KNPWidgets.noDataFoundView();
    }
  }

  Widget commonRowForDepositAndUnWithdrawalView({required String text, required Color color}) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      cardSubTitleTextView(text: text),
      Container(
        height: 12.px,
        width: 12.px,
        margin: EdgeInsets.only(left: 8.px),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    ],
  );

  Widget depositAndUnWithdrawalView() => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      commonRowForDepositAndUnWithdrawalView(text: PageConstVar.maximumCommission.tr, color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2)),
      commonRowForDepositAndUnWithdrawalView(text: PageConstVar.totalWithdrawal.tr, color: Theme.of(Get.context!).colorScheme.primary),
    ],
  );

}
