import 'dart:developer';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/app_setting_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/banner_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:url_launcher/url_launcher.dart';

class AchievementsController extends GetxController {
  final count = 0.obs;

  final apiResValue = true.obs;

  final bannerIndex = 0.obs;
  final bannerModal = Rxn<BannerModal>();
  List<BannerList>? banner;
  List<String> bannerList = [];

  final appSettingModal = Rxn<AppSettingModal>();
  Contacts? contacts;
  List<FollowUs>? followUsList;

  @override
  Future<void> onInit() async {
    super.onInit();
    await callingBannerApi();
    await callingGetAppSettingApi();
    apiResValue.value = false;
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

  String checkCountryCodeInNumber({required String number}) {
    String phoneNumber = number;

    if (phoneNumber.contains("+91")) {
      phoneNumber = number;
    } else {
      phoneNumber = '+91 $number';
    }
    return phoneNumber;
  }

  Future<void> clickOnPhoneNumber() async {
    if (contacts?.callingNumber != null && contacts!.callingNumber!.isNotEmpty) {
      Uri url = Uri.parse('tel: ${checkCountryCodeInNumber(number: contacts?.callingNumber ?? '')}');
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
      log("Direct to: $url");
    }
  }

  Future<void> clickOnWhatsappNumber() async {
    if (contacts?.whatsapp != null && contacts!.whatsapp!.isNotEmpty) {
       Uri url = Uri.parse("https://wa.me/${checkCountryCodeInNumber(number: contacts?.whatsapp ?? '')}");
      if (await launchUrl(url)) {
        throw url;
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  Future<void> clickOnTelegram() async {
    if (contacts?.telegram != null && contacts!.telegram!.isNotEmpty) {
      // Uri url = Uri.parse('tg://resolve?domain=+${Uri.encodeComponent(checkCountryCodeInNumber(number: contacts?.telegram ?? ''))}');
      Uri url = Uri.parse('https://t.me/${contacts?.telegram}');
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
      log("Direct to: $url");
    }
  }

  Future<void> clickOnEmail() async {
    if (contacts?.email != null && contacts!.email!.isNotEmpty) {

      String email = contacts?.email ?? '';
      String subject = "Hello";
      String body = "This is a test email.";

      Uri url = Uri.parse("mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}");
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
      log("Direct to: $url");
    }
  }

  Future<void> clickOnSocialUrlIcons({required int index}) async {
    if (followUsList?[index].links != null && followUsList![index].links!.isNotEmpty) {
      Uri url = Uri.parse('${followUsList?[index].links}');
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
      log("Direct to: $url");
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
        contacts = appSettingModal.value?.contacts;
        followUsList = appSettingModal.value?.followUs;
      }
    } catch (e) {
      print('callingGetAchievementApi::::  ERROR::::: $e');
      apiResValue.value = false;
      KNPMethods.error();
    }
    apiResValue.value = false;
  }

}
