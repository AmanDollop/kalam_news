import 'package:get/get.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';

class AchievementsController extends GetxController {

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


  onWillPop() {
    selectedBottomNavigationIndex.value = 0;
    count.value++;
  }

}
