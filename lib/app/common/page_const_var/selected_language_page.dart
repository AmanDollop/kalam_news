// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/common_padding_size/common_padding_size.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectedLanguagePage extends StatelessWidget {
  String? isEn;
  final Function(String value) changeLanguage;
  final VoidCallback onPressed;
  final count = 0.obs;

  SelectedLanguagePage({
    Key? key,
    required this.isEn,
    required this.changeLanguage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      count.value;
      return ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                changeLanguageTextView(),
                SizedBox(height: CommonPaddingAndSize.size16()),
                englishCardView(),
                SizedBox(height: CommonPaddingAndSize.size10() - 5),
                hindiCardView(),
                SizedBox(height: CommonPaddingAndSize.size16()),
                Row(
                  children: [
                    Expanded(
                      child: backButtonView(),
                    ),
                    SizedBox(width: 10.px),
                    Expanded(
                      child: saveLanguageButtonView(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget changeLanguageTextView() => Text(
    PageConstVar.changeLanguage.tr,
    style: Theme.of(Get.context!).textTheme.displaySmall,
  );

  Widget englishCardView() => SelectedCard(
    showImage: true,
    imagePath: "assets/image/wxr.png",
    selected: isEn == "en",
    textTitle: PageConstVar.english.tr,
    onPressed: () => changeLanguage("en"),
  );

  Widget hindiCardView() => SelectedCard(
    showImage: true,
    imagePath: "assets/image/converted.png",
    selected: isEn == "hi",
    textTitle: PageConstVar.hindi.tr,
    onPressed: () => changeLanguage("hi"),
  );

  Widget backButtonView() => KNPWidgets.commonOutlineButton(
      onPressed: () => Get.back(),
      buttonText: PageConstVar.back.tr,
      height: 40.px,
      borderRadius: 8.px,
      fontSize: 14.px,
      buttonTextColor: Theme.of(Get.context!).colorScheme.secondary
  );

  Widget saveLanguageButtonView() => KNPWidgets.commonElevatedButton(
      onPressed: () {
        if (isEn == "en") {
          var local = const Locale("en", "US");
          Get.updateLocale(local);
        }
        else {
          var local = const Locale("hi", "IN");
          Get.updateLocale(local);
        }
        Get.back();
      },
      buttonText: PageConstVar.saveLanguage.tr,
      height: 40.px,
      fontSize: 14.px,
      borderRadius: 8.px
  );

}

class SelectedCard extends StatelessWidget {
  const SelectedCard(
      {Key? key,
      required this.imagePath,
      required this.textTitle,
      required this.selected,
      required this.showImage,
      required this.onPressed})
      : super(key: key);
  final String imagePath;
  final String textTitle;
  final bool selected;

  final bool showImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Stack(
        children: [
          if (showImage == true)
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 6.px),
                child: imageView(),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(6.px),
            child: buttonView(),
          ),
          if (selected)
          selectedIconView()
        ],
      ),
    );
  }

  Widget imageView() => Image.asset(
    imagePath,
    height: 60.px,
    width: MediaQuery.of(Get.context!).size.width * 0.7,
    alignment: Alignment.bottomCenter,
    color: selected
        ? Theme.of(Get.context!).colorScheme.primary
        : Theme.of(Get.context!).colorScheme.inverseSurface,
  );

  Widget buttonView() => OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 100.px),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
        side: BorderSide(
            width: selected
                ? 1.5.px
                : .5.px,
            color: selected
                ? Theme.of(Get.context!).colorScheme.primary
                : Theme.of(Get.context!).colorScheme.inverseSurface),
        backgroundColor: selected
            ? Theme.of(Get.context!).colorScheme.primary.withOpacity(.02)
            : Theme.of(Get.context!).colorScheme.inverseSurface.withOpacity(.02)
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
              color: selected
                  ? Theme.of(Get.context!).colorScheme.primary
                  : null,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w500
          ),
        ),
      ],
    ),
  );

  Widget selectedIconView() => Align(
    alignment: Alignment.topRight,
    child: Container(
      width: 20.px,
      height: 20.px,
      decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.primary,
          shape: BoxShape.circle),
      child: Center(
        child: Icon(
          Icons.verified,
          size: 16.px,
          color: Theme.of(Get.context!).colorScheme.inversePrimary,
        ),
      ),
    ),
  );

}
