import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/app_setting_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/packages/razorpay.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:kalam_news_publication/app/modules/welcome_massage/views/welcome_massage_view.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:share_plus/share_plus.dart';

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

  void increment() => count.value++;

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

  void clickOnWelcomeMessage() {
    Get.toNamed(Routes.WELCOME_MASSAGE,arguments: ['Welcome massage',welcomeMessage.value]);
  }

  void clickOnKYCApplication() {
    Get.toNamed(Routes.KYC_APPLICATION, arguments: [userData]);
  }

  Future<void> clickOnEditProfile() async {
    await Get.toNamed(Routes.EDIT_PROFILE, arguments: [userData]);
    Get.lazyPut(()=>ProfileController());
    onInit();
  }

  Future<void> clickOnChangePassword() async {
    await Get.toNamed(Routes.NEW_PASSWORD, arguments: ['Change password']);
    Get.lazyPut(()=>ProfileController());
    onInit();
  }

  Future<void> clickOnManageBankDetails() async {
    await Get.toNamed(Routes.MANAGE_BANK_DETAIL);
    Get.lazyPut(()=>ProfileController());
    onInit();
  }

  void clickOnReferralAFriends() {
    referralAFriendsValue.value = true;
    String msg =KNPWidgets.extractTextFromHtml(appSettingModal.value?.inviteMessage ??'');
    try{
      Share.share(msg);
    }catch(e){
      referralAFriendsValue.value = false;
    }
    referralAFriendsValue.value = false;
    count.value++;
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

}
