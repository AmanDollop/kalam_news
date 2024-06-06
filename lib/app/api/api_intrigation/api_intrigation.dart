import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/app_setting_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/bank_account_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/banner_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/citys_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_detail.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/referral_user_data_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/states_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_dashboard_bv_count_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_tree_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/withdraw_history_modal.dart';
import 'package:kalam_news_publication/app/common/http/my_http.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:kalam_news_publication/app/db/data_base_helper/data_base_helper.dart';

class ApiIntrigation{

  static userToken({bool stringToken = false}) async {
    final userDataFromLocalDataBase = ''.obs;
    UserDataModal? userData;
    final token = ''.obs;
    Map<String, String> authorization = {};

    userDataFromLocalDataBase.value = await DataBaseHelper().getParticularData(key:DataBaseConstant.userDetail,tableName: DataBaseConstant.tableNameForUserDetail);

    userData = UserDataModal.fromJson(jsonDecode(userDataFromLocalDataBase.value));

    token.value = '${ApiConstantVar.bearer} ${userData.accessToken}';

    authorization = {
      ApiConstantVar.authorization: token.value,
      'Accept' : 'application/json'
    };

    if(stringToken){
      return token.value;
    }else{
      return authorization;
    }
  }

  static Future<http.Response?> registrationApi({required Map<String, dynamic> bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointRegister}',
      bodyParams: bodyParams,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<StatesModal?> getStateApi({required Map<String, dynamic> bodyParams}) async {
    StatesModal? statesModal;
    http.Response? response = await MyHttp.getMethodForParams(
      queryParameters: bodyParams,
      baseUri: ApiUrls.baseUrlForGet,
      endPointUri: ApiUrls.apiEndPointGetStateList,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        statesModal = StatesModal.fromJson(jsonDecode(response.body));
        return statesModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<CityModal?> getCityApi({required Map<String, dynamic> bodyParams}) async {
    CityModal? cityModal;
    http.Response? response = await MyHttp.getMethodForParams(
      queryParameters: bodyParams,
      baseUri: ApiUrls.baseUrlForGet,
      endPointUri: ApiUrls.apiEndPointGetCityList,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        cityModal = CityModal.fromJson(jsonDecode(response.body));
        return cityModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<UserDataModal?> loginApi({required Map<String, dynamic> bodyParams}) async {
    UserDataModal? userDataModal;
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointLogin}',
      bodyParams: bodyParams,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        userDataModal = UserDataModal.fromJson(jsonDecode(response.body));
        return userDataModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> sendOtpApi({required Map<String, dynamic> bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointResendOtp}',
      bodyParams: bodyParams,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> resetPassword({required Map<String, dynamic> bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointResetPassword}',
      bodyParams: bodyParams,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> changePassword({required Map<String, dynamic> bodyParams}) async {
    Map<String, String> authorization = await userToken();
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointChangePassword}',
      bodyParams: bodyParams,
      context: Get.context!,
      token: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<UserDataModal?> matchOtp({required Map<String, dynamic> bodyParams}) async {
    UserDataModal? userDataModal;
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointMatchOtp}',
      bodyParams: bodyParams,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        userDataModal = UserDataModal.fromJson(jsonDecode(response.body));
        return userDataModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<UserDataModal?> getUserDataApi() async {

    UserDataModal? userDataModal;

    Map<String, String> authorization = await userToken();

    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetProfile}',
      context: Get.context!,
      token: authorization
    );

    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        userDataModal = UserDataModal.fromJson(jsonDecode(response.body));
        return userDataModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<ReferralUserDataModal?> referralUserDataApi({required Map<String, dynamic> bodyParams}) async {

    ReferralUserDataModal? referralUserDataModal;
    http.Response? response = await MyHttp.postMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointCheckReferral}',
      bodyParams: bodyParams,
      context: Get.context!,
      showSnackBar: true,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        referralUserDataModal = ReferralUserDataModal.fromJson(jsonDecode(response.body));
        return referralUserDataModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<PackageModal?> getPackageApi() async {

    Map<String, String> authorization = await userToken();

    PackageModal? packageModal;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetPackage}',
      context: Get.context!,
      token: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        packageModal = PackageModal.fromJson(jsonDecode(response.body));
        return packageModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<PackageDetailModal?> getPackageDetailApi({required Map<String, dynamic> bodyParams}) async {

    Map<String, String> authorization = await userToken();

    PackageDetailModal? packageDetailModal;
    http.Response? response = await MyHttp.getMethodForParams(
      queryParameters: bodyParams,
      baseUri: ApiUrls.baseUrlForGet,
      endPointUri: ApiUrls.apiEndPointGetPackageDetail,
      context: Get.context!,
      authorization: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        packageDetailModal = PackageDetailModal.fromJson(jsonDecode(response.body));
        return packageDetailModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> updateProfileApi({required Map<String, dynamic> bodyParams, File? image}) async {
    String? token = await userToken(stringToken: true);

    http.Response? response = await MyHttp.multipartRequest(
        url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointUpdateProfile}',
        bodyParams: bodyParams,
        context: Get.context!,
        userProfileImageKey: ApiConstantVar.profile,
        image: image,
        multipartRequestType: 'POST',
        token: '$token'
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> addBankDetailApi({required Map<String, dynamic> bodyParams, required String endPoint}) async {

    Map<String, String> authorization = await userToken();

    http.Response? response = await MyHttp.postMethod(
        url: '${ApiUrls.baseUrl}$endPoint',
        bodyParams: bodyParams,
        context: Get.context!,
        token: authorization,
        showSnackBar: true
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> deleteBankAccountApi({required Map<String, dynamic> bodyParams}) async {

    Map<String, String> authorization = await userToken();

    http.Response? response = await MyHttp.deleteMethod(
        url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointDeleteBankAccount}',
        bodyParams: bodyParams,
        context: Get.context!,
        token: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<BankAccountsModal?> getBankAccountsApi() async {

    Map<String, String> authorization = await userToken();

    BankAccountsModal? bankAccountsModal;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetBankAccount}',
      token: authorization,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        bankAccountsModal = BankAccountsModal.fromJson(jsonDecode(response.body));
        return bankAccountsModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<BannerModal?> getBannerApi() async {

    Map<String, String> authorization = await userToken();

    BannerModal? bannerModal;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetBannerList}',
      token: authorization,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        bannerModal = BannerModal.fromJson(jsonDecode(response.body));
        return bannerModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> purchasePackageApi({required Map<String, dynamic> bodyParams}) async {

    Map<String, String> authorization = await userToken();

    http.Response? response = await MyHttp.postMethod(
        url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointPurchasePackage}',
        bodyParams: bodyParams,
        context: Get.context!,
        token: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<AppSettingModal?> getAppSettingApi() async {

    Map<String, String> authorization = await userToken();

    AppSettingModal? appSettingModal;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetAppSetting}',
      token: authorization,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        appSettingModal = AppSettingModal.fromJson(jsonDecode(response.body));
        return appSettingModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<UserTreeModal?> getUserTreeApi({required Map<String, dynamic> bodyParams}) async {

    Map<String, String> authorization = await userToken();

    UserTreeModal? userTreeModal;
    http.Response? response = await MyHttp.getMethodForParams(
        queryParameters: bodyParams,
        baseUri: ApiUrls.baseUrlForGet,
        endPointUri: ApiUrls.apiEndPointGetUserTree,
        context: Get.context!,
        authorization: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        userTreeModal = UserTreeModal.fromJson(jsonDecode(response.body));
        return userTreeModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<UserDashboardBVCountModal?> getUserDashboardBVCountApi() async {

    Map<String, String> authorization = await userToken();

    UserDashboardBVCountModal? userDashboardBVCountModal;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetUserDashboardBVCount}',
      token: authorization,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        userDashboardBVCountModal = UserDashboardBVCountModal.fromJson(jsonDecode(response.body));
        return userDashboardBVCountModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<WithdrawHistoryModal?> getWithdrawHistoryApi() async {

    Map<String, String> authorization = await userToken();

    WithdrawHistoryModal? withdrawHistoryModal;
    http.Response? response = await MyHttp.getMethod(
      url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointGetWalletHistory}',
      token: authorization,
      context: Get.context!,
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true)) {
        withdrawHistoryModal = WithdrawHistoryModal.fromJson(jsonDecode(response.body));
        return withdrawHistoryModal;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> withdrawAmountApi({required Map<String, dynamic> bodyParams}) async {

    Map<String, String> authorization = await userToken();

    http.Response? response = await MyHttp.postMethod(
        url: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointWithdrawCommission}',
        bodyParams: bodyParams,
        context: Get.context!,
        token: authorization
    );
    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true,wantShowSuccessResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<http.Response?> addEKycApi({
    required Map<String, dynamic> bodyParams,
    Map<String, List<File>>? imageMap,
  }) async {

    String? token = await userToken(stringToken: true);

    http.Response? response = await MyHttp.uploadMultipleImagesWithBody(
        uri: '${ApiUrls.baseUrl}${ApiUrls.apiEndPointUserKycDocument}',
        bodyParams: bodyParams,
        context: Get.context!,
        imageMap: imageMap,
        multipartRequestType: 'POST',
        token: '$token'
    );

    if (response != null) {
      if (await KNPMethods.checkResponse(response: response, wantInternetFailResponse: true, wantShowFailResponse: true,wantShowSuccessResponse: true)) {
        return response;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

}