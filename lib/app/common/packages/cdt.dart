import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cbs.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CDT {
  static Future<DateTime?> androidDatePicker({
    DateTime? lastDate,
    DateTime? firstDate,
    DateTime? initialDate,
    required BuildContext context,
  }) async {
    DateTime? pickedDate = await showDatePicker(
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime.now(),
      builder: (context, child) => Theme(
        data: ThemeData(
          primarySwatch: KNPMethods.getMaterialColor(color: Theme.of(Get.context!).colorScheme.primary),
        ),
        child: child ?? const SizedBox(),
      ),
      context: context,
    );
    return pickedDate;
  }

  static Future<TimeOfDay?> androidTimePicker({
    required BuildContext context,
    TimeOfDay? initialTime,
    bool use24HourTime = false,
  }) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primarySwatch: KNPMethods.getMaterialColor(color: Theme.of(Get.context!).colorScheme.primary),
          ),
          child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(alwaysUse24HourFormat: use24HourTime),
              child: child ?? const SizedBox()),
        );
      },
    );

    return pickedTime;
  }


  static Future<String> iosPicker(
      {DateTime? lastDate,
      DateTime? firstDate,
      DateTime? initialDate,
      int? minimumYear,
      int? maximumYear,
      required BuildContext context,
      VoidCallback? clickOnSelect,
      double? height,
      double? borderRadius,
      Color? backgroundColor,
      bool use24hFormat = false,
      bool showDayOfWeek = false,
      CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
      DatePickerDateOrder order = DatePickerDateOrder.dmy,
      TextEditingController? dateController}) async {
    String formattedDate = CMForDateTime.dateFormatForDateMonthYear(date: '${DateTime.now()}');

    CBS.commonBottomSheet(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.px, bottom: 10.px),
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(20.px),
              border: Border.all(color: Theme.of(Get.context!).colorScheme.secondary, width: 1.px),
            ),
            child: Column(
              children: [
                CupertinoTheme(
                  data:  CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(Get.context!).colorScheme.inversePrimary),
                    ),
                  ),
                  child: SizedBox(
                    height: height ?? MediaQuery.of(context).size.height / 3.5,
                    child: CupertinoDatePicker(
                      initialDateTime: initialDate ?? DateTime(DateTime.now().year - 18),
                      minimumDate: firstDate ?? DateTime(1900),
                      maximumDate: lastDate ?? DateTime.now(),
                      onDateTimeChanged: (value) {
                        formattedDate = CMForDateTime.dateFormatForDateMonthYear(date: '$value');
                        // dateController?.text = formattedDate;
                      },
                      minimumYear: minimumYear ?? DateTime.now().year - 123,
                      maximumYear: maximumYear ?? DateTime.now().year,
                      showDayOfWeek: showDayOfWeek,
                      use24hFormat: use24hFormat,
                      mode: mode,
                      dateOrder: order,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        KNPWidgets.commonElevatedButton(
          borderRadius: 4.px,
          height: 40.px,
          onPressed: clickOnSelect ?? () {
                dateController?.text = formattedDate;
                Get.back();
              },
          progressBarWidth: 20.px,
          progressBarHeight: 20.px,
          buttonText: 'Select'
        ),
        SizedBox(height: 20.px),
      ],
      backGroundColor: Colors.transparent,
      showDragHandle: false,
      isDismissible: false,
    );

    return formattedDate;
  }

  static Future<String> iosPicker1(
      {DateTime? lastDate,
      DateTime? firstDate,
      DateTime? initialDate,
      int? minimumYear,
      int? maximumYear,
      required BuildContext context,
      VoidCallback? clickOnSelect,
      double? height,
      double? borderRadius,
      Color? backgroundColor,
      bool use24hFormat = false,
      bool showDayOfWeek = false,
      CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
      DatePickerDateOrder order = DatePickerDateOrder.dmy,
      TextEditingController? dateController}) async {
    String? formattedDate;
    if (dateController?.text == null || dateController!.text.isEmpty) {
      if (mode == CupertinoDatePickerMode.time) {
        formattedDate = CMForDateTime.timeFormatForHourMinuetAmPm(dateAndTime: '${DateTime.now()}');
      } else {
        formattedDate = CMForDateTime.dateFormatForDateMonthYear(date: '$lastDate');
      }
    }
    await CBS.commonBottomSheet(
      children: [
        // Center(child: Text('Select Date', style: Theme.of(Get.context!).textTheme.displaySmall)),
        Padding(
          padding: EdgeInsets.only(top: 10.px, bottom: 10.px),
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(20.px),
              border: Border.all(color: Theme.of(Get.context!).colorScheme.secondary, width: 1.px),
            ),
            child: Column(
              children: [
                CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  child: SizedBox(
                    height: height ?? MediaQuery.of(context).size.height / 3.5,
                    child: CupertinoDatePicker(
                      initialDateTime: initialDate ?? DateTime(DateTime.now().year - 18),
                      minimumDate: firstDate ?? DateTime(1900),
                      maximumDate: lastDate ?? DateTime.now(),
                      onDateTimeChanged: (value) {
                        if (mode == CupertinoDatePickerMode.time) {
                          formattedDate = CMForDateTime.timeFormatForHourMinuetAmPm(dateAndTime: '$value');
                        } else {
                          formattedDate = CMForDateTime.dateFormatForDateMonthYear(date: '$value');
                        }
                        // dateController?.text = formattedDate;
                      },
                      minimumYear: minimumYear ?? DateTime.now().year - 150,
                      maximumYear: maximumYear ?? DateTime.now().year,
                      showDayOfWeek: showDayOfWeek,
                      use24hFormat: use24hFormat,
                      mode: mode,
                      dateOrder: order,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        KNPWidgets.commonElevatedButton(
          borderRadius: 4.px,
          height: 40.px,
          onPressed: clickOnSelect ?? () {
                dateController?.text = formattedDate ?? dateController.text;
                Get.back();
              },
          progressBarWidth: 20.px,
          progressBarHeight: 20.px,
          buttonText: 'Select'
        ),
        SizedBox(height: 20.px),
      ],
      backGroundColor: Colors.transparent,
      showDragHandle: false,
      isDismissible: false,
    );

    if (mode == CupertinoDatePickerMode.time) {
      return formattedDate ?? dateController?.text ?? CMForDateTime.timeFormatForHourMinuetAmPm(dateAndTime: '${DateTime.now()}');
    } else {
      return formattedDate ?? dateController?.text ?? CMForDateTime.dateFormatForDateMonthYear(date: '${DateTime.now()}');
    }
  }
}
