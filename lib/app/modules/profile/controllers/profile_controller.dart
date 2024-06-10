import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/app_setting_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/razorpay.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/page_const_var/selected_language_page.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

final isEN = 'en'.obs;

class ProfileController extends GetxController {

  final count = 0.obs;
  final apiResValue = true.obs;

  final referralAFriendsValue = false.obs;

  final userDataFromLocalDataBaseValue = false.obs;
  final userDataFromLocalDataBase = ''.obs;
  UserDataModal? userData;

  final appSettingModal = Rxn<AppSettingModal>();
  final welcomeMessage = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    apiResValue.value = true;
    await dataBaseCalling();
    await callingGetAppSettingApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment(String value) => isEN.value = value;

  onWillPop() {
    selectedBottomNavigationIndex.value = 0;
    count.value++;
  }

  Future<void> dataBaseCalling() async {
    try {
      userData = await KNPRazorpayMethods.getUserDataDataBaseCalling();
    } catch (e) {
      print('dataBaseCalling:::: ERROR::::::  $e');
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

  Future<void> cMethod({required String page,dynamic arguments}) async {
    await Get.toNamed(page, arguments: arguments);
    Get.lazyPut(()=>ProfileController());
    onInit();
  }

  Future<void> clickOnWelcomeMessage() async {
    if(welcomeMessage.value.isNotEmpty){
      await cMethod(page: Routes.WELCOME_MASSAGE,arguments: ['${PageConstVar.welcome.tr} ${PageConstVar.message.tr}',welcomeMessage.value]);
    }
    else{
      KNPMethods.error();
    }
  }

  Future<void> clickOnKYCApplication() async {
    if(appSettingModal.value?.kycAddOrNot != null && appSettingModal.value!.kycAddOrNot!.isNotEmpty){
      await cMethod(page: Routes.KYC_APPLICATION, arguments: [userData,appSettingModal.value?.kycAddOrNot]);
    }
    else{
      KNPMethods.error();
    }
  }

  Future<void> clickOnEditProfile() async {
    await cMethod(page: Routes.EDIT_PROFILE, arguments: [userData]);
  }

  Future<void> clickOnChangePassword() async {
    await cMethod(page: Routes.NEW_PASSWORD, arguments: [PageConstVar.changePassword.tr]);
  }

  Future<void> clickOnManageBankDetails() async {
    await cMethod(page: Routes.MANAGE_BANK_DETAIL);
  }

  Future<void> clickOnReferralAFriends() async {
    referralAFriendsValue.value = true;
    count.value++;
    await Share.share(KNPWidgets.extractTextFromHtml(appSettingModal.value?.inviteMessage ??''),);
    Future.delayed(const Duration(seconds: 1),() => referralAFriendsValue.value = false,);
  }

  Future<void> clickOnLogOutButton() async {
    await CD.commonIosLogoutDialog(
           isDismiss: false,
           clickOnCancel: () => Get.back(),
           clickOnLogout: () => clickOnLogout(),
         );
  }

  Future<void> clickOnLogout() async {
    await DataBaseHelper().deleteDataBase(tableName: DataBaseConstant.tableNameForUserDetail);
    Get.offAllNamed(Routes.LOG_IN);
  }

  Future<void> callingGetAppSettingApi() async {
    apiResValue.value = true;
    try {
      appSettingModal.value = await ApiIntrigation.getAppSettingApi();
      if (appSettingModal.value != null) {
        welcomeMessage.value = appSettingModal.value?.welcomeMessage ?? '';
      }
    } catch (e) {
      print('callingGetAchievementApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
    apiResValue.value = false;
  }

  void clickOnChangeLanguage() {

    if(Get.locale?.languageCode == 'hi'){
      isEN.value = 'hi';
    }
    else{
      isEN.value = 'en';
    }

    showModalBottomSheet(
      context: Get.context!,
      isDismissible: false,
      builder: (BuildContext context) {
        return Obx((){
            count.value;
            return SizedBox(
              height: 330.px,
              child: SelectedLanguagePage(
                isEn: isEN.value,
                changeLanguage: (String value) => increment(value),
                onPressed: () {},
              ),
            );
          },
        );
      },
    );
  }

}
