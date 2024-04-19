import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/scroll_behavior.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:kalam_news_publication/app/theme/theme_data/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  late StreamSubscription streamSubscription;

  AC().getNetworkConnectionType();
  streamSubscription = AC().checkNetworkConnection();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => ResponsiveSizer(
          builder: (buildContext, orientation, screenType) => GestureDetector(
            onTap: () => KNPMethods.unFocsKeyBoard(),
            child: GetMaterialApp(
              title: "Application",
              theme: AppThemeData.kNPThemeData(fontFamily: 'HelveticaNeue'),
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              defaultTransition: Transition.zoom,
              debugShowCheckedModeBanner: false,
              scrollBehavior: ListScrollBehavior(),
            ),
          ),
        ),
      ),
    );
  });

}
