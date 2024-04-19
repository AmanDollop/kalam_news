import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/modules/home/controllers/home_controller.dart';
import 'package:kalam_news_publication/app/modules/home/views/home_view.dart';
import 'package:kalam_news_publication/app/modules/profile/controllers/profile_controller.dart';
import 'package:kalam_news_publication/app/modules/profile/controllers/profile_controller.dart';
import 'package:kalam_news_publication/app/modules/profile/controllers/profile_controller.dart';
import 'package:kalam_news_publication/app/modules/profile/views/profile_view.dart';

class BottomBarController extends GetxController {

  final count = 0.obs;


  @override
  void onInit() {
    super.onInit();
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

  Widget pageCalling({int? selectedIndex}){
    switch (selectedIndex) {
      case 0:
        Get.lazyPut<HomeController>(
              () => HomeController(),
        );
        HomeController homeController = Get.find();
        return const HomeView();

      case 1:
        Get.lazyPut<ProfileController>(
              () => ProfileController(),
        );
        ProfileController profileController = Get.find();
        return const ProfileView();

        case 2:
        Get.lazyPut<HomeController>(
              () => HomeController(),
        );
        HomeController homeController = Get.find();
        return const HomeView();

        case 3:
        Get.lazyPut<HomeController>(
              () => HomeController(),
        );
        HomeController homeController = Get.find();
        return const HomeView();

        case 4:
        Get.lazyPut<HomeController>(
              () => HomeController(),
        );
        HomeController homeController = Get.find();
        return const HomeView();
      default:
        return const SizedBox();
    }
  }

}
