import 'dart:convert';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:share_plus/share_plus.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  final apiResValue = true.obs;

  final userDataFromLocalDataBaseValue = false.obs;
  final userDataFromLocalDataBase = ''.obs;
  UserDataModal? userData;

  @override
  Future<void> onInit() async {
    super.onInit();
    apiResValue.value = true;
    await dataBaseCalling();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  onWillPop() {
    selectedBottomNavigationIndex.value = 0;
    count.value++;
  }

  Future<void> dataBaseCalling() async {
    try {
      userDataFromLocalDataBaseValue.value = await DataBaseHelper()
          .isDatabaseHaveData(
              db: DataBaseHelper.dataBaseHelper,
              tableName: DataBaseConstant.tableNameForUserDetail);
      if (!userDataFromLocalDataBaseValue.value) {
        userDataFromLocalDataBase.value = await DataBaseHelper()
            .getParticularData(
                key: DataBaseConstant.userDetail,
                tableName: DataBaseConstant.tableNameForUserDetail);
        userData =
            UserDataModal.fromJson(jsonDecode(userDataFromLocalDataBase.value));
      }
    } catch (e) {
      print('dataBaseCalling:::: ERROR::::::  $e');
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

  /*void clickOnAadharCard() {
    Get.toNamed(Routes.ADD_DOCUMENT, arguments: ['Aadhar Card']);
  }

  void clickOnPanCard() {
    Get.toNamed(Routes.ADD_DOCUMENT, arguments: ['Pan Card']);
  }

  void clickOnManageBankAccount() {

  }*/

  void clickOnWelcomeMessage() {
    Get.toNamed(Routes.WELCOME_MASSAGE);
  }

  void clickOnKYCApplication() {
    Get.toNamed(Routes.KYC_APPLICATION, arguments: [userData]);
  }

  Future<void> clickOnEditProfile() async {
    await Get.toNamed(Routes.EDIT_PROFILE, arguments: [userData]);
    onInit();
  }

  void clickOnChangePassword() {
    Get.toNamed(Routes.NEW_PASSWORD, arguments: ['Change password']);
  }

  void clickOnManageBankDetails() {
    Get.toNamed(Routes.MANAGE_BANK_DETAIL);
  }

  void clickOnReferralAFriends() {
    Share.share(
        'Give your friend up to 50% off when they sign up with your link \nReferral Code -: "${userData?.userDetails?.referralCode}"',
        subject:
            'Give your friend up to 50% off when they sign up with your link. Receive 2 Wish Cash for each referral after their first order ships. Earn up to 20 per month.',);
  }

  Future<void> clickOnLogOutButton() async {
    CD.commonIosLogoutDialog(
      isDismiss: false,
      clickOnCancel: () => Get.back(),
      clickOnLogout: () async {
        await DataBaseHelper()
            .deleteDataBase(tableName: DataBaseConstant.tableNameForUserDetail);
        Get.offAllNamed(Routes.LOG_IN);
      },
    );
  }
}
