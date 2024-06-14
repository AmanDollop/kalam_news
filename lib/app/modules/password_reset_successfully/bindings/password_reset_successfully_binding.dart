import 'package:get/get.dart';

import '../controllers/password_reset_successfully_controller.dart';

class PasswordResetSuccessfullyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordResetSuccessfullyController>(
      () => PasswordResetSuccessfullyController(),
    );
  }
}
