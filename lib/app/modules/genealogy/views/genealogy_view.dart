import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/genealogy_controller.dart';

class GenealogyView extends GetView<GenealogyController> {
  const GenealogyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        if (AC.isConnect.value) {
          return WillPopScope(
            onWillPop: () => controller.onWillPop(),
            child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
              appBarTitle: PageConstVar.genealogy.tr,
              onTapForBackButton: () => controller.onWillPop(),
              child2: KNPWidgets.commonRefreshIndicator(
                onRefresh: () async => controller.onInit(),
                child: ModalProgress(
                  inAsyncCall: controller.apiResValue.value,
                  child: controller.apiResValue.value
                      ? KNPWidgets.myLoaderView()
                      : ListView(
                          padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                          children: [
                            userProfileView(),
                            KNPWidgets.commonDividerView(height: 20.px),
                            totalBusinessValueView(),
                            KNPWidgets.commonDividerView(height: 20.px),
                            KNPWidgets.commonContainerView(
                              color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
                              borderColor: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
                              padding: EdgeInsets.symmetric(horizontal: 18.px, vertical: CommonPaddingAndSize.size10()),
                              child: cardHeadlineTextView(
                                text: PageConstVar.totalBusinessValue.tr,
                              ),
                            ),
                            SizedBox(height: CommonPaddingAndSize.size10() * 3),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    borderView(),
                                    Column(
                                      children: [
                                        topUserView(),
                                        if(controller.userDetailsForUserTree?.userLevel != null && controller.userDetailsForUserTree?.userLevel != 0)
                                        SizedBox(height: 5.px),
                                        if(controller.userDetailsForUserTree?.userLevel != null && controller.userDetailsForUserTree?.userLevel != 0)
                                        levelCountAndGoBackView()
                                      ],
                                    ),
                                    borderView(isLeftBorder: false)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: controller.lUser?.userId != null
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.end,
                                  children: [
                                    if(controller.lUser?.userId != null)
                                      leftUserView(),
                                    if(controller.rUser?.userId != null)
                                      rightUserView(),
                                  ],
                                )
                              ],
                            ),
                            if(controller.lUser != null && controller.rUser != null || controller.lUser?.userId != null && controller.rUser?.userId != null)
                            KNPWidgets.commonDividerView(height: CommonPaddingAndSize.size20() * 2),
                            if(controller.lUser != null && controller.rUser != null || controller.lUser?.userId != null && controller.rUser?.userId != null)
                            paidAndUnPaidView(),
                            SizedBox(height: CommonPaddingAndSize.size20() * 4),
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

  Widget userProfileView() => Row(
        children: [
          profileView(),
          SizedBox(width: CommonPaddingAndSize.size10()),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userNameTextView(text: '${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}'),
                commonRowForProfileSection(
                  text1: '${PageConstVar.referredBy.tr} - ',
                  text2: controller.userData?.userDetails?.referredBy != null
                      ? '${controller.userData?.userDetails?.referredBy}'
                      : '?',
                ),
                InkWell(
                  onTap: controller.userData?.userDetails?.referralCode != null
                      ? () async => await Clipboard.setData(ClipboardData(text: "${controller.userData?.userDetails?.referralCode}"))
                      : () => null,
                  child: commonRowForProfileSection(
                    text1: '${PageConstVar.referralCode.tr} - ',
                    text2: controller.userData?.userDetails?.referralCode != null
                        ? '${controller.userData?.userDetails?.referralCode}'
                        : '?',
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget profileView() => Container(
        height: 76.px,
        width: 76.px,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: KNPWidgets.commonNetworkImageView(
            path: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.userData?.userDetails?.profile}'),
            radius: 55.px,
            height: 110.px,
            width: 110.px,
            fit: BoxFit.fill,
            errorImage: 'assets/image/profile.png',
          ),
        ),
      );

  Widget userNameTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.displayMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget commonRowForProfileSection({required String text1, required String text2}) {
    return Row(
      children: [
        cardTitleTextView(text: text1),
        Flexible(
          child: cardSubTitleTextView(
            text: text2,
          ),
        ),
      ],
    );
  }

  Widget cardHeadlineTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget cardTitleTextView({required String text, TextAlign? textAlign}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.titleMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget commonColumnForCardView({required String text1, required String text2}) => Expanded(
        child: Column(
          children: [
            userNameTextView(text: text1),
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

  Widget cardSubTitleTextView({required String text, TextAlign? textAlign}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget commonCard({required String title, required String totalCountText, required String text1, required String text2, required String text3, required String text4}) => KNPWidgets.commonContainerView(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: cardHeadlineTextView(text: title),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      totalCountText,
                      style: Theme.of(Get.context!).textTheme.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
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

  Widget totalBusinessValueView() => commonCard(
        title: PageConstVar.totalBusinessValue.tr,
        totalCountText:  KNPMethods.checkStringIsNullOrEmpty(string: '${controller.userBVCount?.totalBvCount}',blankText: '00'),
        text1:  KNPMethods.checkStringIsNullOrEmpty(string: '${controller.userBVCount?.lBvCount}',blankText: '00'),
        text2: PageConstVar.leftBv.tr,
        text3:  KNPMethods.checkStringIsNullOrEmpty(string: '${controller.userBVCount?.rBvCount}',blankText: '00'),
        text4: PageConstVar.rightBv.tr,
      );

  Widget commonLevelConnection({required String profile, required int isPaidUser, required String userName, required String leftBVCount, required String rightBVCount, GestureTapCallback? onTap}) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.px),
        child: Container(
          height: 12.h,
          width: 38.w,
          padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 6.px),
          decoration: BoxDecoration(
            color: isPaidUser == 0
                ? const Color(0xfffff4f4)
                : const Color(0xfff3fcf2),
            borderRadius: BorderRadius.circular(10.px),
            border: Border.all(color: isPaidUser == 0
                ? Theme.of(Get.context!).colorScheme.error
                : Theme.of(Get.context!).colorScheme.onTertiary,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 34.px,
                width: 34.px,
                decoration: BoxDecoration(
                  color: isPaidUser == 0
                      ? Theme.of(Get.context!).colorScheme.error
                      : Theme.of(Get.context!).colorScheme.onTertiary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: KNPWidgets.commonNetworkImageView(
                    path: profile,
                    radius: 16.px,
                    height: 32.px,
                    width: 32.px,
                    fit: BoxFit.fill,
                    errorImage: 'assets/image/profile.png',
                  ),
                ),
              ),
              SizedBox(height: 3.px),
              Text(
                userName,
                style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                      color: Theme.of(Get.context!).colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              KNPWidgets.commonDividerView(color: isPaidUser == 0
                  ? Theme.of(Get.context!).colorScheme.error
                  : Theme.of(Get.context!).colorScheme.onTertiary, height: 4.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonColumnForLevelCard(
                    text1: leftBVCount,
                    text2: PageConstVar.leftBv.tr,
                    textColor: isPaidUser == 0
                      ? Theme.of(Get.context!).colorScheme.error
                      : Theme.of(Get.context!).colorScheme.onTertiary,
                  ),
                  SizedBox(
                    height: 18.px,
                    child: VerticalDivider(
                      thickness: .5.px,
                      color: isPaidUser == 0
                          ? Theme.of(Get.context!).colorScheme.error
                          : Theme.of(Get.context!).colorScheme.onTertiary,
                      width: CommonPaddingAndSize.size20(),
                    ),
                  ),
                  commonColumnForLevelCard(
                    text1: rightBVCount,
                    text2: PageConstVar.rightBv.tr,
                    textColor: isPaidUser == 0
                      ? Theme.of(Get.context!).colorScheme.error
                      : Theme.of(Get.context!).colorScheme.onTertiary,
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget commonRowForPaidAndUnPaidView({required String text, required Color color}) => Row(
        children: [
          Container(
            height: 12.px,
            width: 12.px,
            margin: EdgeInsets.only(right: 8.px),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          cardSubTitleTextView(text: text)
        ],
      );

  Widget borderView({bool isLeftBorder = true}) => Container(
    height: 100.px,
    width: isLeftBorder
        ? 36.px
        : 34.px,
    margin: EdgeInsets.only(top: 30.px),
    decoration: BoxDecoration(
      border: isLeftBorder
          ? Border(
            top: BorderSide(
              width: 1.5.px,
              color: controller.lUser?.userId != null
                  ? Theme.of(Get.context!).colorScheme.onSecondary
                  : Colors.transparent,
            ),
            left: BorderSide(
              width: 1.5.px,
              color: controller.lUser?.userId != null
                  ? Theme.of(Get.context!).colorScheme.onSecondary
                  : Colors.transparent,
            ),
          )
          : Border(
            top: BorderSide(
              width: 1.5.px,
              color: controller.rUser?.userId != null
                  ? Theme.of(Get.context!).colorScheme.onSecondary
                  : Colors.transparent,
            ),
            right: BorderSide(
              width: 1.5.px,
              color: controller.rUser?.userId != null
                  ? Theme.of(Get.context!).colorScheme.onSecondary
                  : Colors.transparent,
            ),
            left: BorderSide.none,
          ),
      borderRadius: isLeftBorder
          ? BorderRadius.only(topLeft: Radius.circular(5.px))
          : BorderRadius.only(topRight: Radius.circular(5.px)),
    ),
  );

  Widget topUserView() => commonLevelConnection(
      isPaidUser: controller.userDetailsForUserTree?.isPaidUser ?? 0,
      userName: '${controller.userDetailsForUserTree?.firstName} ${controller.userDetailsForUserTree?.lastName}',
      leftBVCount: KNPMethods.checkStringIsNullOrEmpty(string: '${controller.userDetailsForUserTree?.lBvCount}',blankText: '00'),
      rightBVCount: KNPMethods.checkStringIsNullOrEmpty(string: '${controller.userDetailsForUserTree?.rBvCount}',blankText: '00'),
      profile: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.userDetailsForUserTree?.profile}')
  );

  Widget levelCountAndGoBackView ()=> RichText(
    text: TextSpan(
      text: controller.userDetailsForUserTree?.userLevel != null && controller.userDetailsForUserTree?.userLevel != 0
          ? '${controller.userDetailsForUserTree?.userLevel} ${PageConstVar.levelBelow.tr} '
          : ' ',
      style: Theme.of(Get.context!).textTheme.titleSmall,
      children: [
        TextSpan(
          text: PageConstVar.goBack.tr,
          style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(Get.context!).colorScheme.primary,
            color: Theme.of(Get.context!).colorScheme.primary,
          ),
          recognizer: TapGestureRecognizer()..onTap = () => controller.clickOnGoBackButton(),
        )
      ],
    ),
  );

  Widget leftUserView() => commonLevelConnection(
      isPaidUser: controller.lUser?.isPaidUser ?? 0,
      userName: '${controller.lUser?.firstName} ${controller.lUser?.lastName}',
      leftBVCount:  KNPMethods.checkStringIsNullOrEmpty(string: '${controller.lUser?.lBvCount}',blankText: '00'),
      rightBVCount: KNPMethods.checkStringIsNullOrEmpty(string: '${controller.lUser?.rBvCount}',blankText: '00'),
      onTap: () => controller.clickOnLeftUser(),
      profile: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.lUser?.profile}')
  );

  Widget rightUserView() => commonLevelConnection(
      isPaidUser: controller.rUser?.isPaidUser?? 0,
      userName: '${controller.rUser?.firstName} ${controller.rUser?.lastName}',
      leftBVCount:  KNPMethods.checkStringIsNullOrEmpty(string: '${controller.rUser?.lBvCount}',blankText: '00'),
      rightBVCount: KNPMethods.checkStringIsNullOrEmpty(string: '${controller.rUser?.rBvCount}',blankText: '00'),
      onTap: () => controller.clickOnRightUser(),
      profile: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.rUser?.profile}')
  );

  Widget commonColumnForLevelCard({required String text1, required String text2, required Color textColor}) => Column(
    children: [
      Text(
        text1,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
          color: Theme.of(Get.context!).colorScheme.secondary,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        text2,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            color: Theme.of(Get.context!).colorScheme.secondary, //textColor,
            fontSize: 8.px,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );

  Widget paidAndUnPaidView() => Column(
    children: [
      commonRowForPaidAndUnPaidView(text: PageConstVar.paidUsers.tr, color: Theme.of(Get.context!).colorScheme.onTertiary),
      SizedBox(height: CommonPaddingAndSize.size10() - 2),
      commonRowForPaidAndUnPaidView(text: PageConstVar.unpaidUsers.tr, color: Theme.of(Get.context!).colorScheme.error)
    ],
  );

}
