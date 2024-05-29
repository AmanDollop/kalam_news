import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    ProfileController profileController = Get.find();
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return WillPopScope(
          onWillPop: () => controller.onWillPop(),
          child: KNPWidgets.scaffoldBackgroundImageViewWithAppBar(
            appBarTitle: PageConstVar.profile.tr,
            onTapForBackButton: () => controller.onWillPop(),
            child2: KNPWidgets.commonRefreshIndicator(
              onRefresh: () async => await controller.onInit(),
              child: ModalProgress(
                inAsyncCall: controller.apiResValue.value,
                child: controller.apiResValue.value
                    ? KNPWidgets.myLoaderView()
                    : ListView(
                        padding: CommonPaddingAndSize.commonScaffoldBodyPadding(),
                        children: [
                          userProfileView(),
                          KNPWidgets.commonDividerView(height: 0).paddingSymmetric(vertical: CommonPaddingAndSize.size20()),
                          cardHeadlineTextView(text: PageConstVar.welcome.tr).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                          welcomeCardView().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                          cardHeadlineTextView(text: PageConstVar.accountSetting.tr).paddingOnly(bottom: CommonPaddingAndSize.size10()),
                          accountSettingCardView().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                          // changeLanguageView().paddingOnly(bottom: CommonPaddingAndSize.size20()),
                        ],
                      ),
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
                    cardTitleTextView(text: '${PageConstVar.referredBy.tr} - '),
                    Flexible(
                      child: cardSubTitleTextView(
                        text: controller.userData?.userDetails?.referredBy != null
                            ? '${controller.userData?.userDetails?.referredBy}'
                            : '?',
                      ),
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

  Widget editButtonView() => InkWell(
        onTap: () => controller.clickOnEditProfile(),
        borderRadius: BorderRadius.circular(12.px),
        child: Container(
          height: 24.px,
          width: 24.px,
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).colorScheme.inversePrimary,
            shape: BoxShape.circle,
          ),
          child: KNPWidgets.commonNetworkImageView(
              path: 'assets/icon/edit_icon.png', isAssetImage: true),
        ),
      );

  Widget userNameTextView() => Text(
        '${controller.userData?.userDetails?.initials}. ${controller.userData?.userDetails?.firstName} ${controller.userData?.userDetails?.lastName}',
        style: Theme.of(Get.context!).textTheme.displayMedium,
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
                      color: Theme.of(Get.context!).colorScheme.inverseSurface,
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

  Widget welcomeCardView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            commonRowForCard(
              text1: '${PageConstVar.welcome.tr} ${PageConstVar.message.tr}',
              onTap: () => controller.clickOnWelcomeMessage(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.kycApplication.tr,
              onTap: () => controller.clickOnKYCApplication(),
            ),
          ],
        ),
      );

  Widget accountSettingCardView() => KNPWidgets.commonContainerView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            commonRowForCard(
              text1: PageConstVar.editProfile.tr,
              onTap: () => controller.clickOnEditProfile(),
            ),
            // KNPWidgets.commonDividerView(height: 0),
            // commonRowForCard(
            //   text1: PageConstVar.changeLanguage.tr,
            //   onTap: () => controller.clickOnChangeLanguage(),
            // ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.changePassword.tr,
              onTap: () => controller.clickOnChangePassword(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.manageBankDetail.tr,
              onTap: () => controller.clickOnManageBankDetails(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.referralAFriends.tr,
              onTap: AC.isConnect.value
                  ? controller.referralAFriendsValue.value
                      ? () => KNPMethods.showSnackBar(message: PageConstVar.waitForResponse.tr)
                      : () => controller.clickOnReferralAFriends()
                  : () => KNPMethods.noInternet(),
            ),
            KNPWidgets.commonDividerView(height: 0),
            commonRowForCard(
              text1: PageConstVar.logOut.tr,
              onTap: () => controller.clickOnLogOutButton(),
            ),
          ],
        ),
      );

  Widget changeLanguageView() => KNPWidgets.commonContainerView(
    padding: EdgeInsets.zero,
    child: commonRowForCard(
      text1: PageConstVar.changeLanguage.tr,
      onTap: () => controller.clickOnChangeLanguage(),
    ),
  );

}
