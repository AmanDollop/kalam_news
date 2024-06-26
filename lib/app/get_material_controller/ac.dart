///flutter pub add connectivity_plus => For Check Internet on real time
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';

class AC extends GetxController {

  static final isConnect = false.obs;
  int isDialogShow = 0;
  static bool isFakeLocation = false;

  final Connectivity connectivity = Connectivity();

  Future<void> getNetworkConnectionType() async {
    try {
      ConnectivityResult connectivityResult;
      connectivityResult = await connectivity.checkConnectivity();
      return updateConnectionState(connectivityResult);
    } on PlatformException catch (e) {
      KNPMethods.error();
    }
  }

  StreamSubscription checkNetworkConnection() {
    final networkConnection = false.obs;
    return connectivity.onConnectivityChanged.listen((event) async {
      networkConnection.value = await KNPMethods.internetConnectionCheckerMethod();
      if (networkConnection.value) {
        isConnect.value = true;
        if (isDialogShow == 1) {
          // Get.back();
        }
      } else {
        isConnect.value = false;
        isDialogShow = 1;
       // CD.commonAndroidNoInternetDialog();
        KNPMethods.noInternet();
      }
      return updateConnectionState(event);
    });
  }

  void updateConnectionState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        update();
        break;
      case ConnectivityResult.mobile:
        update();
        break;
      case ConnectivityResult.none:
        update();
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }


}
