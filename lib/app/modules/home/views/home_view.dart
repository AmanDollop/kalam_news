import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onWillPop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(() {
          controller.count.value;
          if (AC.isConnect.value) {
            return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              isHomeAppBarValue: true,
              child2: KNPWidgets.commonRefreshIndicator(
                onRefresh: () async => await controller.onInit(),
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.myLoaderView()
                      : controller.isPackagePurchase == 0
                      ? packagesPurchaseGridView()
                      : ListView(
                          padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                          shrinkWrap: true,
                          children: [
                            welcomeTextView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            if(controller.bannerList.isNotEmpty)
                            bannerView(),
                            if(controller.userData?.profilePercentage != null)
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            if(controller.userData?.profilePercentage != null)
                            profileProgressContainerView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            cardTitleTextView(text: PageConstVar.packages.tr),
                            SizedBox(height: CommonPaddingAndSize.size10()),
                            packagesListView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            nodeCountView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            commissionView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            yourSalesView(),
                            SizedBox(height: CommonPaddingAndSize.size20() * 4)
                          ],
                        ),
                ),
              ),
            );
          } else {
            return KNPWidgets.noNetworkConnectionView();
          }
        }),
      ),
    );
  }

  Widget welcomeTextView() => Text(
        '${PageConstVar.welcome.tr}, ${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}',
        style: Theme.of(Get.context!).textTheme.displayLarge,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget bannerView() => KNPWidgets.commonBannerView(
        imageList: controller.bannerList,
        selectedIndex: controller.bannerIndex.value,
        onPageChanged: (index, reason) {
          controller.bannerIndex.value = index;
          controller.count.value++;
        },
        indicatorHeight: 8.px,
        indicatorWidth: 8.px,
        indicatorCornerRadius: 4.px,
      );

  Widget profileProgressContainerView() => KNPWidgets.commonContainerView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardSubTitleTextView(text: PageConstVar.yourProfileProgress.tr),
            SizedBox(height: CommonPaddingAndSize.size10()),
            Row(
              children: [
                Expanded(
                  child: KNPWidgets.commonLinearProgressBar(
                      value: controller.userData!.profilePercentage != null
                          ? controller.userData!.profilePercentage!.toDouble() / 100
                          : 0.0),
                ),
                SizedBox(width: CommonPaddingAndSize.size10()),
                cardSubTitleTextView(text: '${controller.userData?.profilePercentage}%'),
              ],
            )
          ],
        ),
      );

  Widget cardTitleTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.displaySmall,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );

  Widget cardSubTitleTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );

  Widget cardDescriptionTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );

  Widget packagesListView() {
    if (controller.packageModal.value != null) {
      if (controller.packageList != null && controller.packageList!.isNotEmpty) {
        return SizedBox(
          height: 172.px,
          child: ListView.builder(
            itemCount: controller.packageList?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
             return packages(index:index);
            },
          ),
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  Widget packages({required int index, bool isCrossAxisAlignment = false}) => Padding(
    padding: EdgeInsets.only(right: 8.px, top: 2.px, bottom: 2.px, left: 2.px),
    child: InkWell(
      onTap: controller.packageClickValue.value
          ? () => null
          : () => controller.clickOnPackage(index: index),
      child: KNPWidgets.commonContainerView(
        width: 124.px,
        padding: EdgeInsets.all(4.px),
        child: Column(
          crossAxisAlignment: isCrossAxisAlignment
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            KNPWidgets.commonNetworkImageView(
              path: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.packageList?[index].packageImage}'),
              width: double.infinity.px,
              height: 108.px,
              radius: 4.px,
            ),
            SizedBox(height: 8.px),
            cardSubTitleTextView(text: '${controller.packageList?[index].packageName}'),
            cardDescriptionTextView(text: '${controller.packageList?[index].packagePrice}'),
          ],
        ),
      ),
    ),
  );

  Widget commonColumnForCardView({required String text1, required String text2}) => Expanded(
        child: Column(
          children: [
            Text(
              text1,
              style: Theme.of(Get.context!).textTheme.displayLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              text2,
              style: Theme.of(Get.context!).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      );

  Widget commonCard({required String title, required String text1, required String text2, required String text3, required String text4}) => KNPWidgets.commonContainerView(
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
              child: cardTitleTextView(text: title),
            ),
            KNPWidgets.commonDividerView(
              height: 0,
              wight: 1.px,
              color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
            ),
            Padding(
              padding: EdgeInsets.all(CommonPaddingAndSize.size10()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonColumnForCardView(text1: text1, text2: text2),
                  SizedBox(
                    height: 46.px,
                    child: VerticalDivider(
                      color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
                      width: CommonPaddingAndSize.size10(),
                    ),
                  ),
                  commonColumnForCardView(text1: text3, text2: text4)
                ],
              ),
            ),
          ],
        ),
      );

  Widget nodeCountView() => commonCard(
        title: PageConstVar.nodeCount.tr,
        text1: KNPMethods.checkStringIsNullOrEmpty(string: controller.userDashboardBVCount?.lUserNodeCount,blankText: '00'),
        text2: PageConstVar.leftBv.tr,
        text3:  KNPMethods.checkStringIsNullOrEmpty(string: controller.userDashboardBVCount?.rUserNodeCount,blankText: '00'),
        text4: PageConstVar.rightBv.tr,
      );

  Widget commissionView() => commonCard(
        title: PageConstVar.commission.tr,
        text1:  KNPMethods.checkStringIsNullOrEmpty(string: controller.userDashboardBVCount?.leftCommission,blankText: '00'),
        text2: PageConstVar.leftBv.tr,
        text3:  KNPMethods.checkStringIsNullOrEmpty(string: controller.userDashboardBVCount?.rightCommission,blankText: '00'),
        text4: PageConstVar.rightBv.tr,
      );

  Widget yourSalesView() => commonCard(
        title: PageConstVar.yourSales.tr,
        text1:  '₹${KNPMethods.checkStringIsNullOrEmpty(string: controller.userDashboardBVCount?.totalWalletBalance,blankText: '00')}',
        text2: PageConstVar.walletBalance.tr,
        text3:  '₹${KNPMethods.checkStringIsNullOrEmpty(string: controller.userDashboardBVCount?.totalWithdrawal,blankText: '00')}',
        text4: PageConstVar.withdrawalBalance.tr,
      );

  Widget packagesPurchaseGridView() => KNPWidgets.commonContainerView(
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
          child: cardTitleTextView(text: 'Purchase package'),
        ),
        KNPWidgets.commonDividerView(
          height: 0,
          wight: 1.px,
          color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
        ),
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.all(8.px),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: controller.packageList?.length,
              itemBuilder: (context, index) {
                return packages(index: index,isCrossAxisAlignment : true);
              },
          ),
        ),
      ],
    ),
  );

}
