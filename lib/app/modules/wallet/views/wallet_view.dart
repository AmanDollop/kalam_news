import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:kalam_news_publication/app/validation/v.dart';
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
              appBarTitle: 'Wallet',
              onTapForBackButton: () => controller.onWillPop(),
              child2: KNPWidgets.commonRefreshIndicator(
                onRefresh: () async => controller.onInit(),
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.commonProgressBarView()
                      : controller.withdrawHistoryModal.value !=null
                      ? ListView(
                          padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                          children: [
                            totalIncomeView(),
                            SizedBox(height: CommonPaddingAndSize.size16()),
                            textFiledTitleTextView(text: 'Withdrawal amount'),
                            SizedBox(height: CommonPaddingAndSize.size10()),
                            withdrawAmountTextFieldView(),
                            SizedBox(height: CommonPaddingAndSize.size16()),
                            withdrawNowButtonView(),
                            KNPWidgets.commonDividerView(height: CommonPaddingAndSize.size12()*2),
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

  Widget totalIncomeTextView({required String text,int? flex}) => Flexible(
    flex: flex ?? 4,
    child: Text(
      text,
      style: Theme.of(Get.context!).textTheme.labelLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  Widget totalIncomeView() => KNPWidgets.commonContainerView(
      padding: EdgeInsets.all(12.px),
      color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
      borderColor: Theme.of(Get.context!).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          totalIncomeTextView(text: 'Total income',flex: 3),
          totalIncomeTextView(text: controller.withdrawHistoryModal.value?.totalCommission != null
              ? '₹${controller.withdrawHistoryModal.value?.totalCommission}'
              : '₹00'),
        ],
      ),
  );

  Widget textFiledTitleTextView({required String text,double? fontSize,Color? textColor}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.displaySmall?.copyWith(fontSize: fontSize,color:textColor),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget withdrawAmountTextFieldView() => KNPWidgets.commonTextFormField(
    title: '',
    hintText: '₹ Enter amount',
    controller: controller.withdrawAmountController,
    focusNode: controller.withdrawAmountFocusNode,
    // keyboardType: TextInputType.number,
    // maxLength: 7,
    // validator: (value) => V.isValid(value: value, title: 'Please enter withdraw amount'),
  );

  Widget withdrawNowButtonView() => KNPWidgets.commonElevatedButton(
      onPressed: controller.withdrawNowButtonValue.value
          ? () => null
          : () => controller.clickOnWithdrawNowButton(),
      buttonText: 'Withdraw now',
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
          child: cardHeadlineTextView(text: 'History'),
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

  Widget withdrawHistoryListView(){
    if(controller.walletHistory != null && controller.walletHistory!.isNotEmpty){
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
                        textFiledTitleTextView(text: 'Kotak mahindra  bank',fontSize: 12.px),
                        if(controller.walletHistory?[index].createdAt != null && controller.walletHistory![index].createdAt!.isNotEmpty)
                        cardSubTitleTextView(
                          text:
                          controller.walletHistory?[index].transactionType == 'income'
                          ? 'Credit on ${CMForDateTime.dateFormatForDateMonthYearHourMinSec(dateAndTime: '${controller.walletHistory?[index].createdAt}')}'
                          : 'Deposit on ${CMForDateTime.dateFormatForDateMonthYearHourMinSec(dateAndTime: '${controller.walletHistory?[index].createdAt}')}',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: CommonPaddingAndSize.size10()),
                  Flexible(
                    flex: 2,
                    child: textFiledTitleTextView(text: controller.walletHistory?[index].transactionType == 'income'
                        ? '+ ₹${controller.walletHistory?[index].amount}'
                        : '- ₹${controller.walletHistory?[index].amount}',
                        textColor: controller.walletHistory?[index].transactionType == 'income'
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.error),
                  ),
                ],
              ),
              if(controller.walletHistory?.length != null && controller.walletHistory!.isNotEmpty)
              if(index != controller.walletHistory!.length-1)
                KNPWidgets.commonDividerView(height: CommonPaddingAndSize.size12()*2,leftPadding: 0, rightPadding: 0),
            ],
          );
        },
      );
    }
    else{
      return KNPWidgets.noDataFoundView();
    }
  }

}
