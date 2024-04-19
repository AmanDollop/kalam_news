import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        controller.count.value;
        return KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
          isHomeAppBarValue: true,
          child2: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 26.px),
            shrinkWrap: true,
            children: [
              welcomeTextView(),
              SizedBox(height: 12.px),
              bannerView(),
              SizedBox(height: 12.px),
              profileProgressContainerView(),
              SizedBox(height: 12.px),
              cardTitleTextView(text: 'Packages'),
              SizedBox(height: 10.px),
              packagesListView(),
              SizedBox(height: 10.px),
              bvCountView(),
              SizedBox(height: 12.px),
              groupMatchingCommissionView(),
              SizedBox(height: 12.px),
              cardTitleTextView(text: 'Your sales'),
              SizedBox(height: 12.px),
              commonRowForCardView(text1: 'Current wallet balance', text2: '₹0'),
              SizedBox(height: 12.px),
              commonRowForCardView(text1: 'Total paid commission', text2: '₹0'),
              SizedBox(height: 80.px)
            ],
          ),
        );
      }),
    );
  }

  Widget welcomeTextView() => Text('Welcome, Name xyz',style: Theme.of(Get.context!).textTheme.displayLarge);

  Widget bannerView() => KNPWidgets.commonBannerView(
    imageList: controller.bannerList,
    selectedIndex: controller.bannerIndex.value,
    onPageChanged: (index, reason) {
      controller.bannerIndex.value = index;
      controller.count.value++;
    },
    indicatorHeight: 8.px,
    indicatorWidth: 8.px,
    indicatorCornerRadius: 4.px
  );

  Widget profileProgressContainerView() => KNPWidgets.commonContainerView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardSubTitleTextView(text:'Your profile progress (2/4)'),
        SizedBox(height: 10.px),
        Row(
          children: [
            Expanded(
              child: KNPWidgets.commonLinearProgressBar(value: .5),
            ),
            SizedBox(width: 10.px),
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
    if(controller.packageModal.value != null){
      if(controller.packageList != null && controller.packageList!.isNotEmpty){
        return SizedBox(
          height: 172.px,
          child: ListView.builder(
            itemCount: controller.packageList?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.px,top: 2.px,bottom: 2.px,left: 2.px),
                child: InkWell(
                  onTap: () => controller.clickOnPackage(index:index),
                  child: KNPWidgets.commonContainerView(
                    width: 124.px,
                    padding: EdgeInsets.all(4.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KNPWidgets.commonNetworkImageView(path: '${ApiUrls.baseUrlForImage}${controller.packageList?[index].packageImage}',isAssetImage: false,width: 116.px,height: 108.px),
                        SizedBox(height: 8.px),
                        cardSubTitleTextView(text: '${controller.packageList?[index].packageName}'),
                        cardDescriptionTextView(text: '${controller.packageList?[index].packagePrice}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }else{
        return const SizedBox();
      }
    }else{
      return const SizedBox();
    }
  }

  Widget commonRowForCardView({required String text1, required String text2}) => KNPWidgets.commonContainerView(
    color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
    borderColor: Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cardSubTitleTextView(text: text1),
        cardDescriptionTextView(text: text2),
      ],
    ),
  );

  Widget bvCountView() => KNPWidgets.commonContainerView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardTitleTextView(text: 'BV count'),
        SizedBox(height: 16.px),
        commonRowForCardView(text1 : 'Left Bv', text2 : '02'),
        SizedBox(height: 10.px),
        commonRowForCardView(text1: 'Right Bv', text2: '02')
      ],
    ),
  );

  Widget groupMatchingCommissionView() => KNPWidgets.commonContainerView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardTitleTextView(text: 'Group matching commission'),
        SizedBox(height: 16.px),
        commonRowForCardView(text1 : 'Left Bv', text2 : '02'),
        SizedBox(height: 10.px),
        commonRowForCardView(text1: 'Right Bv', text2: '02')
      ],
    ),
  );

}
