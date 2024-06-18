import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/scroll_behavior.dart';
import 'package:kalam_news_publication/app/common/page_const_var/define_languages.dart';
import 'package:kalam_news_publication/app/get_material_controller/ac.dart';
import 'package:kalam_news_publication/app/theme/theme_data/theme_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app/routes/app_pages.dart';

void main() {

  const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android(M and greater): (dark icons)
      systemNavigationBarIconBrightness: Brightness.dark
  );

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
            onTap: () async {
              KNPMethods.unFocsKeyBoard();
              await Fluttertoast.cancel();
            },
            child: GetMaterialApp(
              title: "Kalam News",
              translations: LanguageTranslations(),
              locale: const Locale("en", "US"),
              theme: AppThemeData.kNPThemeData(fontFamily: 'HelveticaNeue'),
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              defaultTransition: Transition.rightToLeft,
              transitionDuration: const Duration(milliseconds: 400),
              debugShowCheckedModeBanner: false,
              scrollBehavior: ListScrollBehavior(),
            ),
          ),
        ),
      ),
    );
  });

}
