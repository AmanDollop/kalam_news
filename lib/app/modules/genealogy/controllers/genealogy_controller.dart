import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_tree_modal.dart';
import 'package:kalam_news_publication/app/common/packages/razorpay.dart';
import 'package:kalam_news_publication/app/modules/bottom_bar/views/bottom_bar_view.dart';

class GenealogyController extends GetxController {
  final count = 0.obs;
  final apiResValue = true.obs;

  UserDataModal? userData;

  final userTreeModal = Rxn<UserTreeModal>();
  final parentUserId = ''.obs;
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
        parentUserId.value = userTreeModal.value?.parentUserId.toString() ?? '';
        userDetailsForUserTree = userTreeModal.value?.userDetailsForUserTree;
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
    if(lUser?.lBvCount != 0 || lUser?.rBvCount != 0){
      bodyParamsForGetUserTreeApi.clear();
      bodyParamsForGetUserTreeApi ={
        ApiConstantVar.userId : lUser?.userId.toString() ?? ''
      };
      await callingGetUserTreeApi();
    }
  }

  Future<void> clickOnRightUser() async {
    if(rUser?.lBvCount != 0 || rUser?.rBvCount != 0){
      bodyParamsForGetUserTreeApi.clear();
      bodyParamsForGetUserTreeApi = {
        ApiConstantVar.userId : rUser?.userId.toString() ?? ''
      };
      await callingGetUserTreeApi();
    }
  }


}
