import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/modules/achievements/controllers/achievements_controller.dart';
import 'package:kalam_news_publication/app/modules/achievements/controllers/achievements_controller.dart';
import 'package:kalam_news_publication/app/modules/achievements/controllers/achievements_controller.dart';
import 'package:kalam_news_publication/app/modules/achievements/controllers/achievements_controller.dart';
import 'package:kalam_news_publication/app/modules/achievements/views/achievements_view.dart';
import 'package:kalam_news_publication/app/modules/genealogy/controllers/genealogy_controller.dart';
import 'package:kalam_news_publication/app/modules/genealogy/controllers/genealogy_controller.dart';
import 'package:kalam_news_publication/app/modules/genealogy/controllers/genealogy_controller.dart';
import 'package:kalam_news_publication/app/modules/genealogy/views/genealogy_view.dart';
import 'package:kalam_news_publication/app/modules/home/controllers/home_controller.dart';
import 'package:kalam_news_publication/app/modules/home/views/home_view.dart';
import 'package:kalam_news_publication/app/modules/profile/controllers/profile_controller.dart';
import 'package:kalam_news_publication/app/modules/profile/controllers/profile_controller.dart';
import 'package:kalam_news_publication/app/modules/profile/controllers/profile_controller.dart';
import 'package:kalam_news_publication/app/modules/profile/views/profile_view.dart';
import 'package:kalam_news_publication/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:kalam_news_publication/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:kalam_news_publication/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:kalam_news_publication/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:kalam_news_publication/app/modules/wallet/views/wallet_view.dart';

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

  Widget pageCalling({int? selectedIndex}) {
    switch (selectedIndex) {
      case 0:
        // Get.delete<HomeController>();
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
        HomeController homeController = Get.find();
        return const HomeView();

      case 1:
        // Get.delete<ProfileController>();
        Get.lazyPut<ProfileController>(
          () => ProfileController(),
        );
        ProfileController profileController = Get.find();
        return const ProfileView();

      case 2:
        // Get.delete<GenealogyController>();
        Get.lazyPut<GenealogyController>(
          () => GenealogyController(),
        );
        GenealogyController genealogyController = Get.find();
        return const GenealogyView();

      case 3:
        // Get.delete<WalletController>();
        Get.lazyPut<WalletController>(
          () => WalletController(),
        );
        WalletController walletController = Get.find();
        return const WalletView();

      case 4:
        // Get.delete<AchievementsController>();
        Get.lazyPut<AchievementsController>(
          () => AchievementsController(),
        );
        AchievementsController achievementsController = Get.find();
        return const AchievementsView();
      default:
        return const SizedBox();
    }
  }
}
