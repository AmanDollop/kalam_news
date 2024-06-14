import 'dart:async';
import 'package:kalam_news_publication/app/common/packages/scroll_behavior.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CBS {
  static Future<void> commonBottomSheet(
      {required List<Widget> children,
      bool enableDrag = true,
      bool isDismissible = true,
      bool useSafeArea = true,
      bool isFullScreen = false,
      bool showDragHandle = false,
      bool isCloseOnBack = true,
      Color? backGroundColor,
      Color? barrierColor,
      double? elevation,
      double? cornerRadius,
      double? horizontalPadding,
      BorderSide borderSide = BorderSide.none,
      Widget? unScrollWidget,
      GestureTapCallback? onTap}) async {
    await showModalBottomSheet(
      context: Get.context!,
      showDragHandle: showDragHandle,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: isFullScreen,
      useSafeArea: useSafeArea,
      backgroundColor: backGroundColor ?? Colors.transparent,
      barrierColor: barrierColor,
      elevation: elevation ?? 0.px,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cornerRadius ?? 20.px),
          topRight: Radius.circular(cornerRadius ?? 20.px),
        ),
        borderSide: borderSide,
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return isCloseOnBack;
          },
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(17.px),
                        child: Container(
                          width: 34.px,
                          height: 34.px,
                          decoration: BoxDecoration(
                            color: Theme.of(Get.context!).colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.cancel,
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornerRadius ?? 20.px),
                              topRight: Radius.circular(cornerRadius ?? 20.px),
                            ),
                            color: Theme.of(Get.context!)
                                .colorScheme
                                .inversePrimary),
                        child: SingleChildScrollView(
                          child: ClipRRect(
                            borderRadius: showDragHandle
                                ? BorderRadius.zero
                                : BorderRadius.only(
                                    topLeft:
                                        Radius.circular(cornerRadius ?? 20.px),
                                    topRight:
                                        Radius.circular(cornerRadius ?? 20.px),
                                  ),
                            child: ScrollConfiguration(
                              behavior: ListScrollBehavior(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (unScrollWidget != null)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: showDragHandle ? 0.px : 16,
                                          left: horizontalPadding ?? 16,
                                          right: horizontalPadding ?? 16,
                                          bottom: horizontalPadding ?? 16 / 2),
                                      child: unScrollWidget,
                                    ),
                                  Flexible(
                                    child: ListView(
                                      padding: EdgeInsets.only(
                                          left: horizontalPadding ?? 16,
                                          right: horizontalPadding ?? 16,
                                          top: showDragHandle ? 0.px : 16,
                                          bottom: horizontalPadding ?? 16 / 2),
                                      shrinkWrap: true,
                                      children: children,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> commonDraggableBottomSheet(
      {required List<Widget> children,
      Widget? list,
      bool enableDrag = true,
      bool isDismissible = true,
      bool useSafeArea = true,
      bool isDragOn = true,
      bool showDragHandle = false,
      bool isCloseOnBack = true,
      Color? backGroundColor,
      Color? barrierColor,
      double? elevation,
      double? initialChildSize,
      double? minChildSize,
      double? maxChildSize,
      double? cornerRadius,
      double? horizontalPadding,
      BorderSide borderSide = BorderSide.none,
      Widget? unScrollWidget}) async {
    await showModalBottomSheet(
      context: Get.context!,
      showDragHandle: showDragHandle,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: isDragOn,
      useSafeArea: useSafeArea,
      backgroundColor: backGroundColor ?? Colors.transparent,
      barrierColor: barrierColor,
      elevation: elevation ?? 0.px,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cornerRadius ?? 20.px),
          topRight: Radius.circular(cornerRadius ?? 20.px),
        ),
        borderSide: borderSide,
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          builder: (context, scrollController) => WillPopScope(
            onWillPop: () async {
              return isCloseOnBack;
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ScrollConfiguration(
                behavior: ListScrollBehavior(),
                child: Column(
                  children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(17.px),
                        child: Container(
                          width: 34.px,
                          height: 34.px,
                          decoration: BoxDecoration(
                            color: Theme.of(Get.context!).colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.cancel,
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                        ),
                      ),
                    SizedBox(height: 10.px),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(Get.context!).colorScheme.inversePrimary,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornerRadius ?? 20.px),
                              topRight: Radius.circular(cornerRadius ?? 20.px),
                            ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (unScrollWidget != null)
                              Padding(
                                padding: EdgeInsets.only(top: showDragHandle ? 0.px : 16, left: horizontalPadding ?? 16, right: horizontalPadding ?? 16, bottom: horizontalPadding ?? 16 / 2),
                                child: unScrollWidget,
                              ),
                            if (children.isNotEmpty)
                              Expanded(
                                child: ListView(
                                  controller: isDragOn ? scrollController : null,
                                  padding: EdgeInsets.only(top: showDragHandle ? 0.px : 16, left: horizontalPadding ?? 16, right: horizontalPadding ?? 16, bottom: horizontalPadding ?? 16 / 2),
                                  shrinkWrap: true,
                                  children: children,
                                ),
                              ),
                            list ?? const SizedBox()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          expand: false,
          initialChildSize: initialChildSize ?? 0.5,
          minChildSize: minChildSize ?? 0.5,
          //initial child size must be grate then minimum child size
          maxChildSize: maxChildSize ?? 0.75,
        );
      },
    );
  }

  ///  Calling Of Country Picker BottomSheet
  static Future<void> commonBottomSheetForCountry({
    required String hintText,
    required Widget child,
    required TextEditingController searchController,
    required FocusNode focusNode,
    required ValueChanged<String> onChanged,
    bool isSearchEnable = true,
    Widget? unScrollableWidget,
  }) async {
    await CBS.commonDraggableBottomSheet(
      showDragHandle: false,
      isDismissible: false,
      enableDrag: false,

      unScrollWidget: unScrollableWidget ??
          (isSearchEnable
              ? KNPWidgets.commonTextFormField(
                  title: '',
                  focusNode: focusNode,
                  hintText: hintText,
                  controller: searchController,
                  onChanged: onChanged,
                )
              : const SizedBox()),
      children: [
        child,
        // SizedBox(
        //   height: MediaQuery.of(Get.context!).viewInsets.top,
        // )
      ],
    );
  }
}
