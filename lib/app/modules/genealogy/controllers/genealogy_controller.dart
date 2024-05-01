import 'dart:convert';

import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';

class GenealogyController extends GetxController {

  final count = 0.obs;
  final apiResValue = true.obs;

  final userDataFromLocalDataBaseValue = false.obs;
  final userDataFromLocalDataBase = ''.obs;
  UserDataModal? userData;

  @override
  Future<void> onInit() async {
    super.onInit();
    apiResValue.value = true;
    await dataBaseCalling();
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

  onWillPop() {
    selectedBottomNavigationIndex.value = 0;
    count.value++;
  }

  Future<void> dataBaseCalling() async {
    try {
      userDataFromLocalDataBaseValue.value = await DataBaseHelper().isDatabaseHaveData(db: DataBaseHelper.dataBaseHelper, tableName: DataBaseConstant.tableNameForUserDetail);
      if (!userDataFromLocalDataBaseValue.value) {
        userDataFromLocalDataBase.value = await DataBaseHelper().getParticularData(key: DataBaseConstant.userDetail, tableName: DataBaseConstant.tableNameForUserDetail);
        userData =
            UserDataModal.fromJson(jsonDecode(userDataFromLocalDataBase.value));
      }
    } catch (e) {
      print('dataBaseCalling:::: ERROR::::::  $e');
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

}
