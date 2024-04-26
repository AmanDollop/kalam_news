import 'package:get/get.dart';

import '../controllers/add_bank_detail_controller.dart';

class AddBankDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBankDetailController>(
      () => AddBankDetailController(),
    );
  }
}
