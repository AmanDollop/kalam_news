import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../api/api_res_modals/user_data_modal.dart';

class SplashController extends GetxController {

  final count = 0.obs;

  Database? database;
  final userDataFromLocalDataBaseValue = false.obs;
  final userDataFromLocalDataBase = ''.obs;

  UserDataModal? userData;

  @override
  Future<void> onInit() async {
    super.onInit();
    try{
      await dataBaseCalling();
      Timer(
        const Duration(seconds: 3),
            () => callingNextScreen(),
      );
    }catch(e){
      Timer(
        const Duration(seconds: 3),
            () => callingNextScreen(),
      );
    }
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

  Future<void> dataBaseCalling() async {
    database = await DataBaseHelper().openDataBase();
    if (database != null) {
      await DataBaseHelper().createTableInDataBaseForUserDetail(db: database!);
      userDataFromLocalDataBaseValue.value = await DataBaseHelper().isDatabaseHaveData(db: DataBaseHelper.dataBaseHelper, tableName: DataBaseConstant.tableNameForUserDetail);
      if (!userDataFromLocalDataBaseValue.value) {
        userDataFromLocalDataBase.value = await DataBaseHelper().getParticularData(key:DataBaseConstant.userDetail,tableName: DataBaseConstant.tableNameForUserDetail);
        userData = UserDataModal.fromJson(jsonDecode(userDataFromLocalDataBase.value));
      }
    }
  }

  Future<void> callingNextScreen() async {
    print('userData?.accessToken:::::::: ${userData?.accessToken}');
    if (userData?.accessToken != null && userData!.accessToken!.isNotEmpty) {
      Get.offNamed(Routes.BOTTOM_BAR);
    } else {
      await DataBaseHelper().deleteDataBase(tableName: DataBaseConstant.tableNameForUserDetail);
      Get.offAllNamed(Routes.LOG_IN);
    }
  }

}
