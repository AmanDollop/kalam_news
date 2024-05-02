import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
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
              appBarTitle: 'Genealogy',
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
                            userProfileView(),
                            KNPWidgets.commonDividerView(height: 20.px),
                            totalBusinessValueView(),
                            KNPWidgets.commonDividerView(height: 20.px),
                            KNPWidgets.commonContainerView(
                              color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
                              borderColor: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
                              padding: EdgeInsets.symmetric(horizontal: 18.px, vertical: CommonPaddingAndSize.size10()),
                              child: cardHeadlineTextView(
                                text: 'Total business value',
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
                                    Container(
                                      height: 100.px,
                                      width: 32.px,
                                      margin: EdgeInsets.only(top: 30.px),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            width: 1.5.px,
                                            color: controller.leftSideLeaveCardValue.value
                                                ? Theme.of(context).colorScheme.onSecondary
                                                : Colors.transparent,
                                          ),
                                          left: BorderSide(
                                            width: 1.5.px,
                                            color: controller.leftSideLeaveCardValue.value
                                                ? Theme.of(context).colorScheme.onSecondary
                                                : Colors.transparent,
                                          ),
                                        ),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5.px)),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        commonLevelConnection(
                                          lightColor: Theme.of(context).colorScheme.onTertiary.withOpacity(.2),
                                          darkColor: Theme.of(context).colorScheme.onTertiary,
                                          userName: 'Dollop 04',
                                          leftBVCount: '04',
                                          rightBVCount: '04',
                                          profile: KNPMethods.baseUrlForNetworkImage(imagePath: '${controller.userData?.userDetails?.profile}')
                                        ),
                                        SizedBox(height: 5.px),
                                        if (!controller.rightSideLeaveCardValue.value || !controller.leftSideLeaveCardValue.value)
                                          RichText(
                                            text: TextSpan(
                                                text: '1 Leave below ',
                                                style: Theme.of(Get.context!).textTheme.titleSmall,
                                                children: [
                                                  TextSpan(
                                                    text: 'Go back',
                                                    style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                                                          decoration: TextDecoration.underline,
                                                          decorationColor: Theme.of(context).colorScheme.primary,
                                                          color: Theme.of(context).colorScheme.primary,
                                                        ),
                                                    recognizer: TapGestureRecognizer()..onTap = () {
                                                            controller.rightSideLeaveCardValue.value = true;
                                                            controller.leftSideLeaveCardValue.value = true;
                                                          },
                                                  )
                                                ],
                                            ),
                                          )
                                      ],
                                    ),
                                    Container(
                                      height: 100.px,
                                      width: 30.px,
                                      margin: EdgeInsets.only(top: 30.px),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            width: 1.5.px,
                                            color: controller.rightSideLeaveCardValue.value
                                                    ? Theme.of(context).colorScheme.onSecondary
                                                    : Colors.transparent,
                                          ),
                                          right: BorderSide(
                                            width: 1.5.px,
                                            color: controller.rightSideLeaveCardValue.value
                                                    ? Theme.of(context).colorScheme.onSecondary
                                                    : Colors.transparent,
                                          ),
                                          left: BorderSide.none,
                                        ),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(5.px)),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (controller.leftSideLeaveCardValue.value)
                                      commonLevelConnection(
                                        lightColor: Theme.of(context).colorScheme.onError,
                                        darkColor: Theme.of(context).colorScheme.error,
                                        userName: 'Dollop 06',
                                        leftBVCount: '06',
                                        rightBVCount: '06',
                                        onTap: () {
                                          controller.leftSideLeaveCardValue.value = false;
                                        },
                                        profile: 'https://cdn-icons-png.flaticon.com/512/10337/10337609.png'
                                      )
                                    else commonEmptyLevel(),
                                    if(controller.rightSideLeaveCardValue.value)
                                        commonLevelConnection(
                                            lightColor: Theme.of(context).colorScheme.onError,
                                            darkColor: Theme.of(context).colorScheme.error,
                                            userName: 'Dollop 05',
                                            leftBVCount: '05',
                                            rightBVCount: '05',
                                            onTap: () {
                                              controller.rightSideLeaveCardValue.value = false;
                                            },
                                            profile: 'https://cdn-icons-png.flaticon.com/512/10337/10337609.png'
                                          )
                                        else commonEmptyLevel(),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: CommonPaddingAndSize.size10() * 3),
                            KNPWidgets.commonDividerView(height: 20.px),
                            SizedBox(height: CommonPaddingAndSize.size10()),
                            paidAndUnPaidView(),
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
                  text1: 'User id - ',
                  text2: controller.userData?.userDetails?.userId != null
                      ? '${controller.userData?.userDetails?.userId}'
                      : '?',
                ),
                commonRowForProfileSection(
                  text1: 'Referral code - ',
                  text2: controller.userData?.userDetails?.referralCode != null
                      ? '${controller.userData?.userDetails?.referralCode}'
                      : '?',
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
            isAssetImage: false,
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
        title: 'Total business value',
        totalCountText: '1500',
        text1: '500',
        text2: 'Left Bv',
        text3: '1000',
        text4: 'Right Bv',
      );

  Widget commonLevelConnection({required String profile, required Color lightColor, required Color darkColor, required String userName, required String leftBVCount, required String rightBVCount, GestureTapCallback? onTap}) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.px),
        child: Container(
          height: 12.h,
          width: 38.w,
          padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 6.px),
          decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(10.px),
            border: Border.all(color: darkColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 34.px,
                width: 34.px,
                decoration: BoxDecoration(
                  color: darkColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: KNPWidgets.commonNetworkImageView(
                    path: profile,
                    isAssetImage: false,
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
              ),
              KNPWidgets.commonDividerView(color: darkColor, height: 4.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonColumnForLevelCard(text1: leftBVCount, text2: 'Left BV', textColor: darkColor),
                  SizedBox(
                    height: 18.px,
                    child: VerticalDivider(
                      thickness: .5.px,
                      color: darkColor,
                      width: CommonPaddingAndSize.size20(),
                    ),
                  ),
                  commonColumnForLevelCard(text1: rightBVCount, text2: 'Right BV', textColor: darkColor),
                ],
              )
            ],
          ),
        ),
      );

  Widget commonEmptyLevel() => SizedBox(
        height: 12.h,
        width: 38.w,
      );

  Widget commonColumnForLevelCard({required String text1, required String text2, required Color textColor}) => Column(
        children: [
          Text(
            text1,
            style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                  color: Theme.of(Get.context!).colorScheme.secondary,
                  fontWeight: FontWeight.w700,
                ),
          ),
          Text(
            text2,
            style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                color: Theme.of(Get.context!).colorScheme.secondary, //textColor,
                fontSize: 8.px),
          ),
        ],
      );

  Widget paidAndUnPaidView() => Column(
        children: [
          commonRowForPaidAndUnPaidView(text: 'Paid users', color: Theme.of(Get.context!).colorScheme.onTertiary),
          SizedBox(height: CommonPaddingAndSize.size10() - 2),
          commonRowForPaidAndUnPaidView(text: 'Paid users', color: Theme.of(Get.context!).colorScheme.error)
        ],
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
}
