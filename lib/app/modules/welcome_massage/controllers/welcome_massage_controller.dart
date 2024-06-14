import 'package:get/get.dart';

class WelcomeMassageController extends GetxController {

  final count = 0.obs;
  final apiResValue = true.obs;
  final pageName = ''.obs;
  final welcomeMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    pageName.value =Get.arguments[0];
    welcomeMessage.value =Get.arguments[1];
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
}
