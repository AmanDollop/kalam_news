import 'package:get/get.dart';

import '../controllers/kyc_application_controller.dart';

class KycApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycApplicationController>(
      () => KycApplicationController(),
    );
  }
}
