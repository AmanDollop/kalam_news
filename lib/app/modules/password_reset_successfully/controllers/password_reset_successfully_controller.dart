import 'package:get/get.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';

class PasswordResetSuccessfullyController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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

  void clickOnLogInButtonView() {
    Get.offAllNamed(Routes.LOG_IN);
  }
}
