import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/app_setting_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/banner_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_detail.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_dashboard_bv_count_modal.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cbs.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/razorpay.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final apiResValue = true.obs;
  final termsAndConditionsValue = false.obs;

  final userDataFromLocalDataBaseValue = false.obs;
  final userDataFromLocalDataBase = ''.obs;

  UserDataModal? userData;

  final packageClickValue = false.obs;

  final packageModal = Rxn<PackageModal>();
  List<PackageList>? packageList;
  int? isPackagePurchase;

  final packageDetailModal = Rxn<PackageDetailModal>();
  List<PackageDetails>? packageDetails;
  Map<String, dynamic> bodyParamsForPackageDetailApi = {};

  final bannerIndex = 0.obs;
  final bannerModal = Rxn<BannerModal>();
  List<BannerList>? banner;
  List<String> bannerList = [];

  final appSettingModal = Rxn<AppSettingModal>();
  final termCondition = ''.obs;

  final userDashboardBVCountModal = Rxn<UserDashboardBVCountModal>();
  UserDashboardBVCount? userDashboardBVCount;

  @override
  Future<void> onInit() async {
    super.onInit();
    await apisCallingMethod();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void refresh() {
    super.refresh();
  }

  void increment() => count.value++;

  Future<void> apisCallingMethod() async {
    await dataBaseCalling();
    await callingPackageApi();
    await callingBannerApi();
    await callingGetAppSettingApi();
    await callingGetDaseboardBVCountApi();
  }

  onWillPop() {
    CD.commonIosExitAppDialog(
      clickOnCancel: () => Get.back(),
      clickOnExit: () {
        Fluttertoast.cancel();
        exit(0); /*SystemNavigator.pop()*/
      },
    );
  }

  Future<void> dataBaseCalling() async {
    try {
      userData = await KNPRazorpayMethods.getUserDataDataBaseCalling();
    } catch (e) {
      print('dataBaseCalling:::: ERROR::::::  $e');
      apiResValue.value = false;
    }
  }

  Future<void> clickOnPackage({required int index}) async {
    packageClickValue.value = true;
    count.value++;
    try {
      await callingPackageDetailApi(packageId: '${packageList?[index].packageId}');
      if (packageDetailModal.value?.isUserPackage == 1) {
        termsAndConditionsValue.value = true;
      }
      await CBS.commonDraggableBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isDragOn: false,
        minChildSize: 1,
        initialChildSize: 1,
        maxChildSize: 1,
        children: [
          Obx(() {
            count.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.px,
                  decoration: BoxDecoration(
                    color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.05),
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  child: KNPWidgets.commonNetworkImageView(
                    path: KNPMethods.baseUrlForNetworkImage(imagePath: '${packageDetailModal.value?.packageImage}'),
                    height: 200.px,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    radius: 8.px,
                  ),
                ),
                SizedBox(height: CommonPaddingAndSize.size10()),
                Text(
                  '${packageDetailModal.value?.packageName}',
                  style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(fontSize: 20.px),
                ),
                // if (packageDetailModal.value?.packageDescription != null && packageDetailModal.value!.packageDescription!.isNotEmpty)
                // SizedBox(height: CommonPaddingAndSize.size10()),
                /*if (packageDetails != null && packageDetails!.isNotEmpty)
                KNPWidgets.commonContainerView(
                    child: Column(
                      children: [
                        commonRowForBottomSheet(
                            titleValue: true,
                            text1: 'Stage',
                            text2: 'Member',
                            text3: 'Commission',
                        ),
                        SizedBox(height: CommonPaddingAndSize.size10()),
                        KNPWidgets.commonDividerView(),
                        SizedBox(height: CommonPaddingAndSize.size10()),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: packageDetails?.length,
                          itemBuilder: (context, index) {
                            return commonRowForBottomSheet(
                                text1: '${packageDetails?[index].stageNumber}',
                                text2: '${packageDetails?[index].numberOfMembers}',
                                text3: '${packageDetails?[index].commission}',
                            );
                          },
                        ),
                      ],
                    ),
                  ),*/
                KNPWidgets.removeHtmlTagsProductAndSellerDescription(string: packageDetailModal.value?.packageDescription ?? ''),
                if (packageDetailModal.value?.isUserPackage == 0)
                  SizedBox(height: CommonPaddingAndSize.size10()),
                if (packageDetailModal.value?.isUserPackage == 0)
                  commonRowForTermsAndConditions(),
                if (termsAndConditionsValue.value)
                  SizedBox(height: CommonPaddingAndSize.size10()),
                if (termsAndConditionsValue.value)
                  KNPWidgets.commonElevatedButton(
                    onPressed: () => clickOnPurchaseNow(index: index),
                    buttonText: packageDetailModal.value?.isUserPackage == 0
                        ? 'Purchase now'
                        : 'Already purchased',
                  ),
                SizedBox(height: CommonPaddingAndSize.size20()),
              ],
            );
          })
        ],
      ).whenComplete(() {
        packageClickValue.value = false;
        termsAndConditionsValue.value = false;
      });
    } catch (e) {
      packageClickValue.value = false;
    }
    packageClickValue.value = false;
    count.value++;
  }

  Widget commonTitleTextView({required String text, TextAlign? textAlign}) => Expanded(
        child: Text(
          text,
          style: Theme.of(Get.context!).textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.start,
        ),
      );

  Widget commonSubTitleTextView({required String text, TextAlign? textAlign}) => Expanded(
        child: Text(
          text,
          style: Theme.of(Get.context!).textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.start,
        ),
      );

  Widget commonRowForBottomSheet({bool titleValue = false, required String text1, required String text2, required String text3}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleValue
            ? commonTitleTextView(text: text1)
            : commonSubTitleTextView(text: text1),
        titleValue
            ? commonTitleTextView(text: text2, textAlign: TextAlign.center)
            : commonSubTitleTextView(text: text2, textAlign: TextAlign.center),
        titleValue
            ? commonTitleTextView(text: text3, textAlign: TextAlign.end)
            : commonSubTitleTextView(text: text3, textAlign: TextAlign.end),
      ],
    );
  }

  Widget commonRowForTermsAndConditions() {
    return Obx(() {
      count.value;
      return Row(
        children: [
          KNPWidgets.commonCheckBoxView(
            changeValue: termsAndConditionsValue.value,
            onChanged: (value) {
              termsAndConditionsValue.value = !termsAndConditionsValue.value;
              count.value++;
            },
            visualDensity: VisualDensity(horizontal: -4.px, vertical: -4.px),
          ),
          RichText(
            text: TextSpan(
              text: 'I accept ',
              style: Theme.of(Get.context!).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: 'Term & Conditions',
                  style: Theme.of(Get.context!).textTheme.labelSmall,
                  recognizer: TapGestureRecognizer()..onTap = () {
                      Get.toNamed(Routes.WELCOME_MASSAGE, arguments: [
                        'Term & Conditions',
                        termCondition.value
                      ]);
                    },
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Future<void> clickOnPurchaseNow({required int index}) async {
    if (packageDetailModal.value?.isUserPackage == 1) {
      KNPMethods.showSnackBar(message: 'Already purchased');
      Get.back();
    } else {
      try {
        await KNPRazorpayMethods.clickOnMakePaymentButton(
                purchaseAmount: double.parse('${packageDetailModal.value?.packageAmount}').toInt(),
                traTypeValue: 'Online',
                packageDetails: packageDetails ?? [],
        ).whenComplete(() => Get.back());
      } catch (e) {
        print('clickOnPurchaseNow:::: ERROR::::::: $e');
      }
    }
  }

  Future<void> callingPackageApi() async {
    apiResValue.value = true;
    try {
      packageModal.value = await ApiIntrigation.getPackageApi();
      if (packageModal.value != null) {
        isPackagePurchase = packageModal.value?.isUserPackage;
        packageList = packageModal.value?.packageList;
      }
    } catch (e) {
      print('callingPackageApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
    apiResValue.value = false;
  }

  Future<void> callingPackageDetailApi({required String packageId}) async {
    try {
      bodyParamsForPackageDetailApi = {ApiConstantVar.packageId: packageId};
      packageDetailModal.value = await ApiIntrigation.getPackageDetailApi(bodyParams: bodyParamsForPackageDetailApi);
      if (packageDetailModal.value != null) {
        packageDetails = packageDetailModal.value?.packageDetails;
      }
    } catch (e) {
      print('callingPackageDetailApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
  }

  Future<void> callingBannerApi() async {
    apiResValue.value = true;
    bannerList.clear();
    try {
      bannerModal.value = await ApiIntrigation.getBannerApi();
      if (bannerModal.value != null) {
        banner = bannerModal.value?.banner;
        banner?.forEach((element) {
          bannerList.add(KNPMethods.baseUrlForNetworkImage(imagePath: '${element.bannerImage}'));
        });
        print('bannerList:::: ${bannerList[0]}');
      }
    } catch (e) {
      print('callingBannerApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
    apiResValue.value = false;
  }

  Future<void> callingGetAppSettingApi() async {
    apiResValue.value = true;
    try {
      appSettingModal.value = await ApiIntrigation.getAppSettingApi();
      if (appSettingModal.value != null) {
        termCondition.value = appSettingModal.value?.termCondition ?? '';
      }
    } catch (e) {
      print('callingGetAchievementApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
    apiResValue.value = false;
  }

  Future<void> callingGetDaseboardBVCountApi() async {
    apiResValue.value = true;
    try {
      userDashboardBVCountModal.value = await ApiIntrigation.getUserDashboardBVCountApi();
      if (userDashboardBVCountModal.value != null) {
        userDashboardBVCount = userDashboardBVCountModal.value?.userDashboardBVCount;
      }
    } catch (e) {
      print('callingGetDaseboardBVCountApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
    apiResValue.value = false;
  }
}
