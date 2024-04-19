import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: KNPWidgets.commonElevatedButton(
          onPressed: () async {
            await DataBaseHelper().deleteDataBase(tableName: DataBaseConstant.tableNameForUserDetail);
            Get.offAllNamed(Routes.LOG_IN);
          },
          buttonText: 'Log Out'
        ),
      ),
    );
  }
}
