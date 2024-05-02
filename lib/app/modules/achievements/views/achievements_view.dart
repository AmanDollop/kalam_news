import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/achievements_controller.dart';

class AchievementsView extends GetView<AchievementsController> {
  const AchievementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        if (AC.isConnect.value) {
          return WillPopScope(
            onWillPop: () => controller.onWillPop(),
            child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: 'Achievements',
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
                            bannerView(),
                            SizedBox(height: CommonPaddingAndSize.size14()),
                            contactSupportView(),
                            SizedBox(height: CommonPaddingAndSize.size14()),
                            followSocialLinksView(),
                            SizedBox(height: CommonPaddingAndSize.size20() * 4)
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

  Widget cardHeadlineTextView({required String text}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget cardSubTitleTextView({required String text}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.titleMedium,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
  
  Widget commonContainerView({required String title,required Widget child}) => KNPWidgets.commonContainerView(
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
          child: cardHeadlineTextView(text: title),
        ),
        KNPWidgets.commonDividerView(
          height: 0,
          wight: 1.px,
          color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
        ),
        Padding(
          padding: EdgeInsets.all(CommonPaddingAndSize.size16()),
          child: child,
        ),
      ],
    ),
  );

  Widget commonRowForContactSupportView({required String imagePath,required String text,GestureTapCallback? onTap}) => InkWell(
    onTap: onTap,
    child: Row(
      children: [
        KNPWidgets.commonNetworkImageView(
          path: imagePath,
          isAssetImage: true,
          height: 26.px,
          width: 26.px,
        ),
        SizedBox(width: CommonPaddingAndSize.size14()),
        cardSubTitleTextView(text: text)
      ],
    ),
  );

  Widget commonDividerForContactSupportView()=>KNPWidgets.commonDividerView(
    height: CommonPaddingAndSize.size12()*2,
    leftPadding: 0,
    rightPadding: 0,
    color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
  );

  Widget contactSupportView() => commonContainerView(
    title: 'Contact support',
    child: Column(
      children: [
        if(controller.contacts?.callingNumber != null && controller.contacts!.callingNumber!.isNotEmpty)
        commonRowForContactSupportView(imagePath: 'assets/image/phone_image.png', text: '${controller.contacts?.callingNumber}',onTap: () => controller.clickOnPhoneNumber(),),
        if(controller.contacts?.callingNumber != null && controller.contacts!.callingNumber!.isNotEmpty)
        commonDividerForContactSupportView(),
        if(controller.contacts?.whatsapp != null && controller.contacts!.whatsapp!.isNotEmpty)
        commonRowForContactSupportView(imagePath: 'assets/image/whatsapp_image.png', text: '${controller.contacts?.whatsapp}',onTap: () => controller.clickOnWhatsappNumber(),),
        if(controller.contacts?.whatsapp != null && controller.contacts!.whatsapp!.isNotEmpty)
        commonDividerForContactSupportView(),
        if(controller.contacts?.telegram != null && controller.contacts!.telegram!.isNotEmpty)
        commonRowForContactSupportView(imagePath: 'assets/image/telegram_image.png', text: '${controller.contacts?.telegram}',onTap: () => controller.clickOnTelegram(),),
        if(controller.contacts?.telegram != null && controller.contacts!.telegram!.isNotEmpty)
        commonDividerForContactSupportView(),
        if(controller.contacts?.email != null && controller.contacts!.email!.isNotEmpty)
        commonRowForContactSupportView(imagePath: 'assets/image/email_image.png', text: '${controller.contacts?.email}',onTap: () => controller.clickOnEmail(),),
      ],
    ),
  );

  Widget followSocialLinksView(){
    if(controller.contactsAndFollowSocialLinksModal.value != null){
      if(controller.followUsList != null && controller.followUsList!.isNotEmpty){
        return  commonContainerView(
          title: 'Follow social links',
          child: SizedBox(
            height: 40.px,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.followUsList?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () => controller.clickOnSocialUrlIcons(index:index),
                      borderRadius: BorderRadius.circular(17.px),
                      child: KNPWidgets.commonNetworkImageView(
                        path: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.followUsList?[index].icon}'),
                        isAssetImage: false,
                        height: 40.px,
                        width: 40.px,
                        radius: 20.px
                      ),
                    ),
                    if(index != controller.followUsList!.length-1)
                      SizedBox(
                        height: 50.px,
                        child: VerticalDivider(
                          width: CommonPaddingAndSize.size12()*3,
                          color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
                          thickness: .5.px,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        );
      }else{
        return const SizedBox();
      }
    }else{
      return const SizedBox();
    }
  }

}
