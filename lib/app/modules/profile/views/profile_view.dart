import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: 'Profile',
            onTapForBackButton: () => controller.onWillPop(),
            child2: ModalProgress(
              inAsyncCall: controller.apiResValue.value,
              child: controller.apiResValue.value
                  ? KNPWidgets.commonProgressBarView()
                  : ListView(
                      padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                      children: [
                        userProfileView(),
                        SizedBox(height: CommonPaddingAndSize.size20()),
                        KNPWidgets.commonDividerView(),
                        SizedBox(height: CommonPaddingAndSize.size20()),
                        cardHeadlineTextView(text: 'Personal information'),
                        SizedBox(height: CommonPaddingAndSize.size10()),
                        personalInformationCardView(),
                        SizedBox(height: CommonPaddingAndSize.size20()),
                        cardHeadlineTextView(text: 'Documents'),
                        SizedBox(height: CommonPaddingAndSize.size10()),
                        documentsCardView(),
                        SizedBox(height: CommonPaddingAndSize.size20()),
                        cardHeadlineTextView(text: 'Account Setting'),
                        SizedBox(height: CommonPaddingAndSize.size10()),
                        accountSettingCardView(),
                        SizedBox(height: CommonPaddingAndSize.size20()),
                        logoutButtonView(),
                        SizedBox(height: CommonPaddingAndSize.size20() * 4)
                      ],
                    ),
            ),
          ),
        );
      }),
    );
  }

  Widget userProfileView() => Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              profileView(),
              editButtonView(),
            ],
          ),
          SizedBox(width: CommonPaddingAndSize.size10()),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userNameTextView(),
                Row(
                  children: [
                    cardTitleTextView(text: 'User id - '),
                    Flexible(
                      child: cardSubTitleTextView(text: controller.userData?.userDetails?.userId != null
                          ? '${controller.userData?.userDetails?.userId}'
                          : '?'),
                    ),
                  ],
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
      );

  Widget editButtonView() => InkWell(
    onTap: () => controller.clickOnEditProfile(),
    borderRadius: BorderRadius.circular(12.px),
    child: Container(
          height: 24.px,
          width: 24.px,
          decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.inversePrimary,
              shape: BoxShape.circle),
          child: KNPWidgets.commonNetworkImageView(
              path: 'assets/icon/edit_icon.png', isAssetImage: true),
        ),
  );

  Widget userNameTextView() => Text(
       '${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}',
        style: Theme.of(Get.context!).textTheme.displayLarge,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

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

  Widget cardSubTitleTextView({required String text, TextAlign? textAlign}) => Text(
        text,
        style: Theme.of(Get.context!).textTheme.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      );

  Widget commonRowForCard({required String text1, String? text2, bool buttonValue = true, GestureTapCallback? onTap}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: CommonPaddingAndSize.size20(), vertical: CommonPaddingAndSize.size14()),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child:
                    cardTitleTextView(text: text1, textAlign: TextAlign.start),
              ),
              SizedBox(width: CommonPaddingAndSize.size10()),
              buttonValue
                  ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 14.px,
                    )
                  : text2 != null && text2.isNotEmpty
                      ? Flexible(
                          flex: 3,
                          child: cardSubTitleTextView(
                              text: text2, textAlign: TextAlign.end),
                        )
                      : const SizedBox()
            ],
          ),
        ),
      );

  Widget personalInformationCardView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            commonRowForCard(
                text1: 'User id',
                text2: controller.userData?.userDetails?.userId != null
                    ? '${controller.userData?.userDetails?.userId}'
                    : '?',
                buttonValue: false),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
                text1: 'Referral code',
                text2: controller.userData?.userDetails?.referralCode != null &&
                        controller
                            .userData!.userDetails!.referralCode!.isNotEmpty
                    ? '${controller.userData?.userDetails?.referralCode}'
                    : '?',
                buttonValue: false),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
                text1: 'City',
                text2: controller.userData?.userDetails?.cityId != null
                    ? '${controller.userData?.userDetails?.cityId}'
                    : '?',
                buttonValue: false),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
                text1: 'Date of birth',
                text2: controller.userData?.userDetails?.dob != null &&
                        controller.userData!.userDetails!.dob!.isNotEmpty
                    ? CMForDateTime.dateFormatForDateMonthYear(
                        date: '${controller.userData?.userDetails?.dob}')
                    : '?',
                buttonValue: false),
          ],
        ),
      );

  Widget documentsCardView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            commonRowForCard(
              text1: 'Aadhar card',
              onTap: () => controller.clickOnAadharCard(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'Pan card',
              onTap: () => controller.clickOnPanCard(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'Manage bank account',
              onTap: () => controller.clickOnManageBankAccount(),
            ),
          ],
        ),
      );

  Widget accountSettingCardView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            commonRowForCard(
              text1: 'Edit profile',
              onTap: () => controller.clickOnEditProfile(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'Change password',
              onTap: () => controller.clickOnChangePassword(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: 'Update bank details',
              onTap: () => controller.clickOnUpdateBankDetails(),
            ),
          ],
        ),
      );

  Widget logoutButtonView() => KNPWidgets.commonElevatedButton(
        onPressed: () => controller.clickOnLogOutButton(),
        buttonText: 'Log Out',
      );
}
