import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_detail.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class KNPRazorpayMethods{

  // static String razorpayKeyName = "rzp_test_sBIiiURrNWQRTc";
  // static String razorpayKeyPassword = "UeGbEmzqYSb3tBjT7Mcphb2V";

  // static String razorpayKeyName = "rzp_test_jk0xGqxJWDAXMD";
  // static String razorpayKeyPassword = "fQyNNa1s8r7eA0btP6daWQlP";

  static String razorpayKeyName = "rzp_live_fJThF6pqzqAxrt";
  static String razorpayKeyPassword = "Cp9iqqBFdBXkMIw2KneHRn10";


  static final userDataFromLocalDataBaseValue = false.obs;
  static final userDataFromLocalDataBase = ''.obs;
  static UserDataModal? userData;

  static Map<String, dynamic> bodyParamsForPurchasePackageApi = {};
  static List<PackageDetails>? packageDetailsSingleData;

  static Future<UserDataModal?> getUserDataDataBaseCalling() async {
    try {
      userDataFromLocalDataBaseValue.value = await DataBaseHelper().isDatabaseHaveData(db: DataBaseHelper.dataBaseHelper, tableName: DataBaseConstant.tableNameForUserDetail);
      if (!userDataFromLocalDataBaseValue.value) {
        userDataFromLocalDataBase.value = await DataBaseHelper().getParticularData(key: DataBaseConstant.userDetail, tableName: DataBaseConstant.tableNameForUserDetail);
        userData = UserDataModal.fromJson(jsonDecode(userDataFromLocalDataBase.value));
        return userData;
      }
    } catch (e) {
      print('dataBaseCalling:::: ERROR::::::  $e');
    }
    return userData;
  }

  static Future<void> clickOnMakePaymentButton({required int purchaseAmount, required String traTypeValue,required List<PackageDetails> packageDetails}) async {
    Razorpay razorpay = Razorpay();
    try{
      packageDetailsSingleData = packageDetails;
      var options = {
        'key': razorpayKeyName,
        'amount': purchaseAmount * 100,
        'name': '${userData?.userDetails?.initials}. ${userData?.userDetails?.firstName} ${userData?.userDetails?.lastName}',
        'description': 'Testing ',
        'timeout': 60 * 2,
        'prefill': {'contact': userData?.userDetails?.mobileNumber, 'email': userData?.userDetails?.email},
      };
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorResponse);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessResponse);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletSelected);
      razorpay.open(options);
    }catch(e){
      if (kDebugMode) {
        print('Razorpay:::  ERROR:::: $e');
      }
      KNPMethods.showSnackBar(message: 'Payment Failed');
    }
  }

  static _handlePaymentErrorResponse(PaymentSuccessResponse response) {
    if (kDebugMode) {
      print('Payment Failed::::::  ');
    }
    KNPMethods.showSnackBar(message: 'Payment Failed');
  }

  static _handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    if (kDebugMode) {
      print('Payment Successful::::::  ');
    }
    KNPMethods.showSnackBar(message: 'Payment Transection Successful');
    bodyParamsForPurchasePackageApi.clear();
    bodyParamsForPurchasePackageApi = {
      ApiConstantVar.packageId: '${packageDetailsSingleData?[0].packageId}',
      ApiConstantVar.isTcAccept: '1',
      ApiConstantVar.transactionType: 'online',
      ApiConstantVar.transactionId: '${response.paymentId}',
      ApiConstantVar.paymentStatus: 'success',
    };
    await callingPurchasePackageApi(bodyParams:bodyParamsForPurchasePackageApi);
  }

  static _handleExternalWalletSelected(ExternalWalletResponse response) {
    if (kDebugMode) {
      print('External Wallet Selected');
    }
    KNPMethods.showSnackBar(message: 'External Wallet Selected');
  }

  static callingPurchasePackageApi({required Map<String, dynamic> bodyParams}) async {
    try{
      http.Response? res = await ApiIntrigation.purchasePackageApi(bodyParams: bodyParams);
      if(res != null && res.statusCode == 200){
        Get.offAllNamed(Routes.BOTTOM_BAR);
      }
    }catch(e){
      print('callingPurchasePackageApi::: ERROR::::  $e');
      KNPMethods.error();
    }
  }

}