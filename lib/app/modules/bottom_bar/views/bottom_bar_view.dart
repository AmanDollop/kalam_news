import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/bottom_bar/GButton.dart';
import 'package:kalam_news_publication/app/common/packages/bottom_bar/GnavStyle.dart';
import 'package:kalam_news_publication/app/common/packages/model_progress_bar.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/bottom_bar_controller.dart';

final selectedBottomNavigationIndex = 0.obs;

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: controller.pageCalling(
          selectedIndex: selectedBottomNavigationIndex.value.toInt(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.px),
              topRight: Radius.circular(12.px),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 24.px,
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(.2),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18 .px, horizontal: 14.px),
            child: GNav(
              padding: EdgeInsets.zero,
              duration: const Duration(milliseconds: 50),
              tabBackgroundColor: Colors.transparent,
              tabs: [
                GButton(
                  icon: selectedBottomNavigationIndex.value == 0
                      ? selectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/d_home_icon.png',
                      title: PageConstVar.home.tr)
                      : unSelectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/l_home_icon.png',
                      title: PageConstVar.home.tr),
                ),
                GButton(
                  icon: selectedBottomNavigationIndex.value == 1
                      ? selectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/d_profile_icon.png',
                      title: PageConstVar.profile.tr)
                      : unSelectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/l_profile_icon.png',
                      title: PageConstVar.profile.tr),
                ),
                GButton(
                  icon: selectedBottomNavigationIndex.value == 2
                      ? selectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/d_genealogy_icon.png',
                      title: PageConstVar.genealogy.tr)
                      : unSelectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/l_genealogy_icon.png',
                      title: PageConstVar.genealogy.tr),
                ),
                GButton(
                  icon: selectedBottomNavigationIndex.value == 3
                      ? selectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/d_wallet_icon.png',
                      title: PageConstVar.wallet.tr)
                      : unSelectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/l_wallet_icon.png',
                      title: PageConstVar.wallet.tr),
                ),
                GButton(
                  icon: selectedBottomNavigationIndex.value == 4
                      ? selectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/d_achievements_icon.png',
                      title: PageConstVar.achievements.tr)
                      : unSelectedCommonButtonView(
                      imagePath: 'assets/bottom_bar_icon/l_achievements_icon.png',
                      title: PageConstVar.achievements.tr),
                ),
              ],
              selectedIndex: selectedBottomNavigationIndex.value,
              onTabChange: (index) {
                print('${controller.packageModal.value?.isUserPackage ?? 0}');
                if(controller.packageModal.value?.isUserPackage == 0){
                  KNPMethods.showSnackBar(message: 'Purchase package.');
                }else{
                  selectedBottomNavigationIndex.value = index;
                }
                controller.count.value++;
              },
            ),
          ),
        ),
      );
    });
  }

  Widget selectedCommonButtonView({required String imagePath, required String title}) => Column(
    children: [
      Image.asset(
        imagePath,
        width: 24.px,
        height: 24.px,
        // color: Col.gBottom,
      ),
      SizedBox(height: 4.px),
      selectedTitleTextView(title: title,),
    ],
  );

  Widget selectedTitleTextView({required String title}) => Text(
    title,
    style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(color: Theme.of(Get.context!).colorScheme.inversePrimary),
  );

  Widget unSelectedCommonButtonView({required String imagePath, required String title}) => Column(
        children: [
          Image.asset(
            imagePath,
            width: 20.px,
            height: 20.px,
          ),
          SizedBox(height: 4.px),
          unSelectedTitleTextView(title: title),
        ],
      );

  Widget unSelectedTitleTextView({required String title}) => Text(
    title,
    style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(color: Theme.of(Get.context!).colorScheme.inversePrimary),
  );

}
