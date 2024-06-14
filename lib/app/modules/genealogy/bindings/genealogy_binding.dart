import 'package:get/get.dart';

import '../controllers/genealogy_controller.dart';

class GenealogyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenealogyController>(
      () => GenealogyController(),
    );
  }
}
