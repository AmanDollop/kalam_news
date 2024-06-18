import 'package:get/get.dart';

import '../controllers/registration_verification_controller.dart';

class RegistrationVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationVerificationController>(
      () => RegistrationVerificationController(),
    );
  }
}
