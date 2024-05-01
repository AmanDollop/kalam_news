import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
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
                      ? KNPWidgets.commonProgressBarView()
                      : ListView(
                          padding:
                              CommonPaddingAndSize.commonScaffoldBodyPadding(),
                          shrinkWrap: true,
                          children: [
                            welcomeTextView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            bannerView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            profileProgressContainerView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            /* KNPWidgets.commonContainerView(
                             borderColor: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
                             padding: EdgeInsets.zero,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   padding: EdgeInsets.symmetric(horizontal: 18.px, vertical: CommonPaddingAndSize.size10()),
                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                     color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
                                     borderRadius: BorderRadius.only(
                                       topLeft: Radius.circular(8.px),
                                       topRight: Radius.circular(8.px),
                                     ),
                                   ),
                                   child: cardTitleTextView(text: 'Packages'),
                                 ),
                                 KNPWidgets.commonDividerView(height: 0, wight: 1.px,color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),),
                                 SizedBox(height: CommonPaddingAndSize.size10()),
                                 packagesListView(),
                                 SizedBox(height: CommonPaddingAndSize.size10()),
                               ],
                             ),
                           ),*/
                            cardTitleTextView(text: 'Packages'),
                            SizedBox(height: CommonPaddingAndSize.size10()),
                            packagesListView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            bvCountView(),
                            SizedBox(height: CommonPaddingAndSize.size12()),
                            groupMatchingCommissionView(),
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
        'Welcome, ${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}',
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
            cardSubTitleTextView(text: 'Your profile progress (2/4)'),
            SizedBox(height: CommonPaddingAndSize.size10()),
            Row(
              children: [
                Expanded(
                  child: KNPWidgets.commonLinearProgressBar(value: .5),
                ),
                SizedBox(width: CommonPaddingAndSize.size10()),
                cardSubTitleTextView(text: '50%'),
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
        style: Theme.of(Get.context!)
            .textTheme
            .labelMedium
            ?.copyWith(fontWeight: FontWeight.w500),
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
      if (controller.packageList != null &&
          controller.packageList!.isNotEmpty) {
        return SizedBox(
          height: 172.px,
          child: ListView.builder(
            itemCount: controller.packageList?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: 8.px, top: 2.px, bottom: 2.px, left: 2.px),
                child: InkWell(
                  onTap: controller.packageClickValue.value
                      ? () => null
                      : () => controller.clickOnPackage(index: index),
                  child: KNPWidgets.commonContainerView(
                    width: 124.px,
                    padding: EdgeInsets.all(4.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KNPWidgets.commonNetworkImageView(
                          path: KNPMethods.baseUrlForNetworkImage(
                              imagePath:
                                  '${controller.packageList?[index].packageImage}'),
                          isAssetImage: false,
                          width: 124.px,
                          height: 108.px,
                          radius: 4.px,
                        ),
                        SizedBox(height: 8.px),
                        cardSubTitleTextView(
                            text:
                                '${controller.packageList?[index].packageName}'),
                        cardDescriptionTextView(
                            text:
                                '${controller.packageList?[index].packagePrice}'),
                      ],
                    ),
                  ),
                ),
              );
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

  Widget commonColumnForCardView({required String text1, required String text2}) =>
      Expanded(
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
              padding: EdgeInsets.symmetric(
                  horizontal: 18.px, vertical: CommonPaddingAndSize.size10()),
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
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
                      color: Theme.of(Get.context!)
                          .colorScheme
                          .primary
                          .withOpacity(.2),
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

  Widget bvCountView() => commonCard(
        title: 'BV count',
        text1: '02',
        text2: 'Left Bv',
        text3: '03',
        text4: 'Right Bv',
      );

  Widget groupMatchingCommissionView() => commonCard(
        title: 'Group matching commission',
        text1: '01',
        text2: 'Left Bv',
        text3: '06',
        text4: 'Right Bv',
      );

  Widget yourSalesView() => commonCard(
        title: 'Your sales',
        text1: '₹6',
        text2: 'Current wallet balance',
        text3: '₹10',
        text4: 'Current wallet balance',
      );
}
