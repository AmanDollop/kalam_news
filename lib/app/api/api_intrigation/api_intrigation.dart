import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/citys_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_detail.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/states_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/user_data_modal.dart';
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


}