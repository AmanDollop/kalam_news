import 'package:get/get.dart';

import '../controllers/manage_bank_detail_controller.dart';

class ManageBankDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageBankDetailController>(
      () => ManageBankDetailController(),
    );
  }
}
