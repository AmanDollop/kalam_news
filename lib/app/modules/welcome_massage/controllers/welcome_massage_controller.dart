import 'package:get/get.dart';

class WelcomeMassageController extends GetxController {

  final count = 0.obs;
  final apiResValue = true.obs;

  @override
  void onInit() {
    super.onInit();
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
