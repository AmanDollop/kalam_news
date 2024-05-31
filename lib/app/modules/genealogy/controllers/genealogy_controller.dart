import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_tree_modal.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/razorpay.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/methods/knp_methods.dart';

class GenealogyController extends GetxController {
  final count = 0.obs;
  final apiResValue = true.obs;

  UserDataModal? userData;

  final userTreeModal = Rxn<UserTreeModal>();
  final parentUserId = ''.obs;
  ParentUserData? parentUserData;
  UserDetailsForUserTree? userDetailsForUserTree;
  RUser? rUser;
  LUser? lUser;
  UserBVCount? userBVCount;

  Map<String, dynamic> bodyParamsForGetUserTreeApi = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    apiResValue.value = true;
    await dataBaseCalling();
    bodyParamsForGetUserTreeApi = {
      ApiConstantVar.userId : ''
    };
    await callingGetUserTreeApi();
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
      userData = await KNPRazorpayMethods.getUserDataDataBaseCalling();
    } catch (e) {
      print('dataBaseCalling:::: ERROR::::::  $e');
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

  Future<void> callingGetUserTreeApi() async {
    try {
      apiResValue.value = true;
      userTreeModal.value = await ApiIntrigation.getUserTreeApi(bodyParams: bodyParamsForGetUserTreeApi);
      if (userTreeModal.value != null) {
          parentUserData = userTreeModal.value?.parentUserData;
          parentUserId.value = parentUserData?.userId.toString() ?? '';
          userDetailsForUserTree = userTreeModal.value?.userDetails;
          rUser = userTreeModal.value?.rUser;
          lUser = userTreeModal.value?.lUser;
          userBVCount = userTreeModal.value?.userBVCount;
      }
    } catch (e) {
      print('callingGetUserTreeApi:::: ERROR::::::  $e');
      apiResValue.value = false;
    }
    apiResValue.value = false;
  }

  Future<void> clickOnGoBackButton() async {
    if(userDetailsForUserTree?.userLevel != 0){
      bodyParamsForGetUserTreeApi.clear();
      bodyParamsForGetUserTreeApi = {
        ApiConstantVar.userId : parentUserId.value.toString() ?? ''
      };
      await callingGetUserTreeApi();
    }
  }

  Future<void> clickOnLeftUser() async {
    if(lUser?.lBvCount != '0' || lUser?.rBvCount != '0'){
      bodyParamsForGetUserTreeApi.clear();
      bodyParamsForGetUserTreeApi ={
        ApiConstantVar.userId : lUser?.userId.toString() ?? ''
      };
      await callingGetUserTreeApi();
    }
  }

  Future<void> clickOnRightUser() async {
    if(rUser?.lBvCount != '0' || rUser?.rBvCount != '0'){
      bodyParamsForGetUserTreeApi.clear();
      bodyParamsForGetUserTreeApi = {
        ApiConstantVar.userId : rUser?.userId.toString() ?? ''
      };
      await callingGetUserTreeApi();
    }
  }

  Future<void> clickOnTopUser() async {
    if(userDetailsForUserTree?.userLevel != null && userDetailsForUserTree?.userLevel != 0) {
      await showDialog(
        context: Get.context!,
        useSafeArea: true,
        barrierDismissible: true,
        builder: (context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Theme.of(Get.context!).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.px),
          side: BorderSide(
            width: 2.px,
            color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.2),
          ),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 30.px),
        child: Padding(
          padding: EdgeInsets.all(20.px),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 76.px,
                width: 76.px,
                margin: EdgeInsets.only(bottom: 16.px),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: KNPWidgets.commonNetworkImageView(
                    path: KNPMethods.baseUrlForNetworkImage(imagePath: '${userDetailsForUserTree?.profile}'),
                    radius: 55.px,
                    height: 110.px,
                    width: 110.px,
                    fit: BoxFit.fill,
                    errorImage: 'assets/image/profile.png',
                  ),
                ),
              ),
              Text(
                '${userDetailsForUserTree?.initials}. ${userDetailsForUserTree?.firstName} ${userDetailsForUserTree?.lastName}',
                style: Theme.of(Get.context!).textTheme.displayMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.px),
              KNPWidgets.commonDividerView(wight: 1.px),
              SizedBox(height: 4.px),
              commonRowForDialog(text1: 'Referral code', text2: '${userDetailsForUserTree?.referralCode}'),
              SizedBox(height: 4.px),
              KNPWidgets.commonDividerView(wight: 1.px),
              SizedBox(height: 4.px),
              commonRowForDialog(text1: 'Email', text2: '${userDetailsForUserTree?.email}'),
              SizedBox(height: 4.px),
              KNPWidgets.commonDividerView(wight: 1.px),
              SizedBox(height: 4.px),
              commonRowForDialog(text1: 'Mobile number', text2: '${userDetailsForUserTree?.mobileNumber}'),
              SizedBox(height: 4.px),
              KNPWidgets.commonDividerView(wight: 1.px),
              if(userDetailsForUserTree?.dob != null && userDetailsForUserTree!.dob!.isNotEmpty)
              SizedBox(height: 4.px),
              if(userDetailsForUserTree?.dob != null && userDetailsForUserTree!.dob!.isNotEmpty)
              commonRowForDialog(text1: 'DOB', text2: CMForDateTime.dateFormatForDateMonthYear(date: '${userDetailsForUserTree?.dob}')),
            ],
          ),
        ),
       );
      },
     );
    }
  }

  Widget commonRowForDialog({required String text1,required String text2}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        flex: 2,
        child: Text(
          text1,
          style: Theme.of(Get.context!).textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ),
      Flexible(
        flex: 4,
        child: Text(
          text2,
          style: Theme.of(Get.context!).textTheme.bodySmall,
          maxLines: 1,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

}
