import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class C {
  /*   Font family name   */
  static const fontKumbhSans = "KumbhSans";

  /*   AutoValidate mode   */
  static const autoValidateMode = AutovalidateMode.disabled;

  /*   Margins     */
  static double margin = 16.px;
  static double radius = 6.px;
  static double buttonRadius = 18.px;
  static double textButtonRadius = 10.px;
  static double outlineButtonRadius = 12.px;
  static double textFieldRadius = 10.px;

  /*  Common String or Image constants    */
  static const iNoInternetDialog = "assets/image/no_network_connecting.png";
  static const tWellCome = "Well-Come";
  static const textNext = "Next";
  static const textReadMore = " Read More";
  static const textReadLess = " Read Less";
  static const textNoData = "No Data";
  static const textNoResultFound = "No result found";
  static const textSelect = "Select";

  static const textSelectImageTitle = "Select Image";
  static const textTakePhoto = "Take Photo";
  static const textChooseFromLibrary = "Choose From Library";
  static const textRemovePhoto = "Remove Photo";
  static const textImageDialogContent = "Pick Image From option below";
  static const textCamera = "Camera";
  static const textGallery = "Gallery";
  static const textLogOutDialogTitle = "Logout";
  static const textLogOutDialogContent = "Are you sure you want to logout?";
  static const textDeleteDialogTitle = "Delete";
  static const textDeleteDialogContent = "Are you sure you want to delete?";
  static const textCancel = "Cancel";
  static const textLogout = "Logout";
  static const textExitDialogTitle = "Exit";
  static const textExitDialogContent = "Do you want to exit this application?";
  static const textWhoops = "Whoops!";
  static const textNoInternetConnectionFound = "No internet connection found.";
  static const textPleaseCheckYourInternetConnection = "Please check your connection and try again.";
  static const textPermission = "Permission";
  static const textGivePermission = "Give Permission";
  static const textPermissionDialogContent = "Do you want to exit this application?";

}

class CD {
  static Future<void> commonIosAlertDialogBox(
      {required String title,
      String? content,
      String? leftButtonTitle,
      String? rightButtonTitle,
      TextStyle? leftTitleStyle,
      TextStyle? rightTitleStyle,
      TextStyle? titleStyle,
      TextStyle? contentStyle,
      VoidCallback? clickOnLeftButton,
      VoidCallback? clickOnRightButton,
      bool isDismiss = true,
      bool isBackOn = true}) async {
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return isBackOn;
          },
          child: CupertinoAlertDialog(
            title: Text(
              title,
              style: titleStyle ?? Theme.of(Get.context!).textTheme.displaySmall,
            ),
            content: content != null
                ? Text(
                    content,
                    style: contentStyle ?? Theme.of(Get.context!).textTheme.bodySmall,
                  )
                : const SizedBox(),
            actions: [
              if (leftButtonTitle != null)
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: clickOnLeftButton,
                  child: Text(
                    leftButtonTitle,
                    style: leftTitleStyle ?? Theme.of(Get.context!).textTheme.bodyMedium,
                  ),
                ),
              if (rightButtonTitle != null)
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: clickOnRightButton,
                  child: Text(
                    rightButtonTitle,
                    style: rightTitleStyle ?? Theme.of(Get.context!).textTheme.bodyMedium,
                  ),
                ),
            ],
            insetAnimationDuration: const Duration(milliseconds: 500),
          ),
        );
      },
      useSafeArea: true,
      barrierDismissible: isDismiss,
    );
  }

  static Future<void> commonIosLogoutDialog({required VoidCallback clickOnCancel, required VoidCallback clickOnLogout, bool isDismiss = true}) async {
    await CD.commonIosAlertDialogBox(
        title: PageConstVar.logOut.tr,
        content: C.textLogOutDialogContent.tr,
        clickOnLeftButton: clickOnCancel,
        clickOnRightButton: clickOnLogout,
        leftButtonTitle: C.textCancel.tr,
        rightButtonTitle: PageConstVar.logOut.tr,
        isDismiss: isDismiss);
  }

  static Future<void> commonIosDeleteConfirmationDialog(
      {required VoidCallback clickOnCancel,
      required VoidCallback clickOnDelete,
      bool isDismiss = true}) async {
      await CD.commonIosAlertDialogBox(
        title: C.textDeleteDialogTitle.tr,
        content: C.textDeleteDialogContent.tr,
        clickOnLeftButton: clickOnCancel,
        clickOnRightButton: clickOnDelete,
        leftButtonTitle: C.textCancel.tr,
        rightButtonTitle: C.textDeleteDialogTitle.tr,
        isDismiss: isDismiss);
  }

  static Future<void> commonIosExitAppDialog(
      {required VoidCallback clickOnCancel,
      required VoidCallback clickOnExit,
      bool isDismiss = true}) async {
    await CD.commonIosAlertDialogBox(
        title: C.textExitDialogTitle.tr,
        content: C.textExitDialogContent.tr,
        clickOnLeftButton: clickOnCancel,
        clickOnRightButton: clickOnExit,
        leftButtonTitle: C.textCancel.tr,
        rightButtonTitle: C.textExitDialogTitle.tr,
        isDismiss: isDismiss);
  }

  static Future<void> commonIosPermissionDialog(
      {required VoidCallback clickOnPermission,
      bool isDismiss = false,
      bool isBackOn = false}) async {
    await CD.commonIosAlertDialogBox(
        title: C.textPermission,
        content: C.textPermissionDialogContent,
        clickOnRightButton: clickOnPermission,
        rightButtonTitle: C.textGivePermission,
        isDismiss: isDismiss,
        isBackOn: isBackOn);
  }

  static Future<void> commonIosPickImageDialog(
      {required VoidCallback clickOnCamera,
      required VoidCallback clickOnGallery,
      bool isDismiss = true}) async {
    await CD.commonIosAlertDialogBox(
        title: C.textSelectImageTitle.tr,
        content: C.textImageDialogContent.tr,
        clickOnLeftButton: clickOnCamera,
        clickOnRightButton: clickOnGallery,
        leftButtonTitle: C.textCamera.tr,
        rightButtonTitle: C.textGallery.tr,
        isDismiss: isDismiss);
  }

  static Future<void> commonAndroidAlertDialogBox({
    Widget? titleWidget,
    String? title,
    WidgetBuilder? builder,
    String? content,
    String? leftButtonTitle,
    String? rightButtonTitle,
    TextStyle? leftTitleStyle,
    TextStyle? rightTitleStyle,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    VoidCallback? clickOnLeftButton,
    VoidCallback? clickOnRightButton,
    String? imagePath,
    double? imageHeight,
    double? imageWidth,
    double? elevation,
    double? borderRadius,
    double? borderWidth,
    Color? borderColor,
    Color? backgroundColor,
    MainAxisAlignment? actionsAlignment,
    AlignmentGeometry? dialogAlignment,
    bool isDismiss = true,
    bool isAssetImage = true,
    bool centerTitle = false,
    bool centerContent = false,
    bool isBackOn = true,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsets? insetPadding,
  }) async {
    await showDialog(
      context: Get.context!,
      builder: builder ?? (context) {
            return WillPopScope(
              onWillPop: () async {
                return isBackOn;
              },
              child: AlertDialog(
                insetPadding: insetPadding ?? EdgeInsets.zero,
                iconPadding: iconPadding ?? EdgeInsets.only(top: C.margin + C.margin, left: C.margin, right: C.margin),
                titlePadding: titlePadding ?? EdgeInsets.only(top: C.margin, left: C.margin, right: C.margin),
                contentPadding: contentPadding ?? EdgeInsets.only(top: C.margin - 6.px, left: C.margin, right: C.margin),
                actionsPadding: actionsPadding ?? EdgeInsets.only(top: C.margin / 2, left: C.margin, right: C.margin, bottom: C.margin / 2),
                backgroundColor: backgroundColor ?? Theme.of(Get.context!).colorScheme.inversePrimary,
                elevation: elevation ?? 0.px,
                alignment: dialogAlignment ?? Alignment.center,
                actionsAlignment: actionsAlignment ?? MainAxisAlignment.spaceBetween,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10.px),
                  side: BorderSide(
                      color: borderColor ?? Colors.transparent,
                      width: borderWidth ?? 1.px),
                ),
                icon: imagePath != null
                    ? Container(
                        child: KNPWidgets.commonNetworkImageView(
                            path: imagePath,
                            isAssetImage: isAssetImage,
                            height: imageHeight,
                            width: imageWidth),
                      )
                    : null,
                title: titleWidget
                    ?? Text(
                  title ?? '',
                  style: titleStyle ??
                      Theme.of(Get.context!).textTheme.displayLarge,
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                ),
                content: content != null
                    ? Text(
                        content,
                        style: contentStyle ??
                            Theme.of(Get.context!).textTheme.labelMedium,
                        textAlign:
                            centerContent ? TextAlign.center : TextAlign.start,
                      )
                    : const SizedBox(),
                actions: [
                  Row(
                    children: [
                      if (leftButtonTitle != null)
                        Expanded(
                          child: KNPWidgets.commonOutlineButton(
                            onPressed: clickOnLeftButton ?? () {},
                            height: 36.px,
                            borderRadius: 4.px,
                            borderWidth: 1.px,
                            borderColor: Theme.of(Get.context!).colorScheme.onSurface,
                            child: Text(
                              leftButtonTitle,
                              style: leftTitleStyle ?? Theme.of(Get.context!).textTheme.labelMedium,
                            ),
                          ),
                        ),
                      if (rightButtonTitle != null)
                        SizedBox(width: 10.px),
                      if (rightButtonTitle != null)
                        Expanded(
                          child: KNPWidgets.commonElevatedButton(
                            borderRadius: 4.px,
                            height: 36.px,
                            onPressed: clickOnRightButton ?? () {},
                            child: Text(
                              rightButtonTitle,
                              style: rightTitleStyle ?? Theme.of(Get.context!).textTheme.labelLarge,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            );
          },
      useSafeArea: true,
      barrierDismissible: isDismiss,
    );
  }

  static Future<void> commonAndroidLogoutDialog(
      {required VoidCallback clickOnCancel,
      required VoidCallback clickOnLogout,
      bool isDismiss = true}) async {
    await CD.commonAndroidAlertDialogBox(
        title: C.textLogOutDialogTitle,
        content: C.textLogOutDialogContent,
        clickOnLeftButton: clickOnCancel,
        clickOnRightButton: clickOnLogout,
        leftButtonTitle: C.textCancel,
        rightButtonTitle: C.textLogout,
        isDismiss: isDismiss);
  }

  static Future<void> commonAndroidExitAppDialog(
      {required VoidCallback clickOnCancel,
      required VoidCallback clickOnExit,
      bool isDismiss = true}) async {
    await CD.commonAndroidAlertDialogBox(
        title: C.textExitDialogTitle,
        content: C.textExitDialogContent,
        clickOnLeftButton: clickOnCancel,
        clickOnRightButton: clickOnExit,
        leftButtonTitle: C.textCancel,
        rightButtonTitle: C.textExitDialogTitle,
        isDismiss: isDismiss);
  }

  static Future<void> commonAndroidPermissionDialog(
      {required VoidCallback clickOnPermission,
      bool isDismiss = false,
      bool isBackOn = false}) async {
    await CD.commonAndroidAlertDialogBox(
        title: C.textPermission,
        content: C.textPermissionDialogContent,
        clickOnRightButton: clickOnPermission,
        rightButtonTitle: C.textGivePermission,
        isDismiss: isDismiss,
        isBackOn: isBackOn);
  }

  static Future<void> commonAndroidPickImageDialog(
      {required VoidCallback clickOnCamera,
      required VoidCallback clickOnGallery,
      bool isDismiss = true}) async {
    await CD.commonAndroidAlertDialogBox(
        title: C.textSelectImageTitle,
        content: C.textImageDialogContent,
        clickOnLeftButton: clickOnCamera,
        clickOnRightButton: clickOnGallery,
        leftButtonTitle: C.textCamera,
        rightButtonTitle: C.textGallery,
        isDismiss: isDismiss);
  }

  static  Future<void> commonAndroidNoInternetDialog({bool isDismiss = true}) async {
    await CD.commonAndroidAlertDialogBox(
      title: C.textWhoops,
      content: C.textNoInternetConnectionFound,
      imagePath: C.iNoInternetDialog,
      imageWidth: 200.px,
      iconPadding: EdgeInsets.only(left: C.margin + C.margin / 2),
      titlePadding: EdgeInsets.zero,
      centerTitle: true,
      centerContent: true,
      isDismiss: false,
      isBackOn: false,
    );
  }

  static  Future<void> commonAndroidFakeLocationDialog({bool isDismiss = true}) async {
    await CD.commonAndroidAlertDialogBox(
      // title: "Location",
      // content: 'Fake Location',
      imagePath: 'assets/images/fake_location_image.jpg',
      imageWidth: 200.px,
      actionsPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      // iconPadding: EdgeInsets.only(left: C.margin + C.margin / 2),
      titlePadding: EdgeInsets.zero,
      centerTitle: true,
      centerContent: true,
      isDismiss: false,
      isBackOn: false,
    );
  }



}
