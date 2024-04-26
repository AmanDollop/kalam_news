import 'package:get/get.dart';

import '../controllers/welcome_massage_controller.dart';

class WelcomeMassageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeMassageController>(
      () => WelcomeMassageController(),
    );
  }
}
