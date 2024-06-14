import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/citys_modal.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/states_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cbs.dart';
import 'package:kalam_news_publication/app/common/packages/cdt.dart';
import 'package:kalam_news_publication/app/common/packages/common_methods_for_date_time.dart';
import 'package:kalam_news_publication/app/common/packages/lm.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:kalam_news_publication/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalDetailsController extends GetxController {
  final count = 0.obs;

  final apiResValue = true.obs;

  final key = GlobalKey<FormState>();

  final rightLeftValue = '' .obs;
  final referralCode = '' .obs;

  final initialsController = TextEditingController();
  FocusNode initialsFocusNode = FocusNode();
  final isInitialsDropDownValue = false.obs;
  final selectedInitialsValue = ''.obs;
  List<String> initialsList = [
    PageConstVar.mr.tr,
    PageConstVar.mrs.tr,
    PageConstVar.ms.tr,
    PageConstVar.mst.tr,
  ];

  final firstNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  final lastNameController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  final middleNameController = TextEditingController();
  FocusNode middleNameFocusNode = FocusNode();

  final dobController = TextEditingController();
  FocusNode dobFocusNode = FocusNode();

  final emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  final mobileNumberController = TextEditingController();
  FocusNode mobileNumberFocusNode = FocusNode();

  final whatsappNumberController = TextEditingController();
  FocusNode whatsappNumberFocusNode = FocusNode();

  final sameAsMobileNumberValue = false.obs;

  final completeAddressController = TextEditingController();
  FocusNode completeAddressFocusNode = FocusNode();

  final stateController = TextEditingController();
  FocusNode stateFocusNode = FocusNode();

  final searchStateController = TextEditingController();
  FocusNode focusNodeForSearchState = FocusNode();

  final cityController = TextEditingController();
  FocusNode cityFocusNode = FocusNode();

  final searchCityController = TextEditingController();
  FocusNode focusNodeForSearchCity = FocusNode();

  final pinCodeController = TextEditingController();
  FocusNode pinCodeFocusNode = FocusNode();

  final passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  final confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  final statesModal = Rxn<StatesModal>();
  List<States> statesList = [];
  List<States> statesListSearch = [];
  String? stateId;
  String limitForState = '20';
  final offsetForState = 0.obs;
  final isLastPageForState = false.obs;
  Map<String, dynamic> bodyParamsState = {};


  final cityModal = Rxn<CityModal>();
  List<Cities> cityList = [];
  List<Cities> cityListSearch = [];
  String? cityId;
  String limitForCity = '20';
  final offsetForCity = 0.obs;
  final isLastPageForCity = false.obs;
  Map<String, dynamic> bodyParamsCity = {};

  Map<String, dynamic> bodyParamsRegister = {};

  final confirmButtonValue = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    apiResValue.value = true;
    rightLeftValue.value = Get.arguments[0];
    referralCode.value = Get.arguments[1];
    await callingGetStateApi();
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

  Future<void> clickOnInitialsListOfDropDown({required value}) async {
    KNPMethods.unFocsKeyBoard();
    isInitialsDropDownValue.value = false;
    selectedInitialsValue.value = value ?? '';
    initialsController.text = value ?? '';
  }

  Future<void> clickOnDObTextField() async {
    KNPMethods.unFocsKeyBoard();
    await CDT.iosPicker1(
      context: Get.context!,
      dateController: dobController,
      initialDate: dobController.text.isNotEmpty
          ? DateFormat('dd MMM yyyy').parse(dobController.text)
          : DateTime(DateTime.now().year - 18),
      lastDate: DateTime(DateTime.now().year - 18),
        maximumYear: DateTime.now().year - 18
    );
  }

  Future<void> callingGetStateApi() async {
    try {
      bodyParamsState = {
        ApiConstantVar.limit: limitForState.toString(),
        ApiConstantVar.offset: offsetForState.value.toString(),
      };
      statesModal.value = await ApiIntrigation.getStateApi(bodyParams: bodyParamsState);
      if (statesModal.value != null) {
        if (statesModal.value?.states != null && statesModal.value!.states!.isNotEmpty) {
          statesList.addAll(statesModal.value?.states ?? []);
        } else {
          isLastPageForState.value = true;
        }
        apiResValue.value = false;
      }
    } catch (e) {
      KNPMethods.error();
      apiResValue.value = false;
      print('callingGetStateApi:::: ERROR::::  $e');
    }
  }

  Future<void> callingGetCityApi({required String stateId}) async {
    try {
      bodyParamsCity = {
        ApiConstantVar.stateId: stateId,
        ApiConstantVar.limit: limitForCity.toString(),
        ApiConstantVar.offset: offsetForCity.value.toString(),
      };
      cityModal.value = await ApiIntrigation.getCityApi(bodyParams: bodyParamsCity);
      if (cityModal.value != null) {
        if(cityModal.value?.cities != null && cityModal.value!.cities!.isNotEmpty) {
          cityList.addAll(cityModal.value?.cities ?? []);
        }else{
          isLastPageForCity.value = true;
        }
      }
    } catch (e) {
      KNPMethods.error();
      apiResValue.value = false;
      print('callingGetCityApi:::: ERROR::::  $e');
    }
    apiResValue.value = false;
  }

  Future<void> clickOnStateTextFormFiled() async {
    KNPMethods.unFocsKeyBoard();
    await CBS.commonBottomSheetForCountry(
      hintText: 'Search state',
      isSearchEnable: false,
      focusNode: focusNodeForSearchState,
      searchController: searchStateController,
      onChanged: (value) {
        statesListSearch.clear();
        if (value.isEmpty) {
          return;
        } else {
          statesList.forEach((stateAllData) {
            if (stateAllData.stateName!.toLowerCase().contains(value.toLowerCase().trim())) {
              if (stateAllData.stateName?.toLowerCase().trim().contains(value.toLowerCase().trim()) != null) {
                statesListSearch.add(stateAllData);
              } else {
                statesListSearch = [];
              }
            }
          });
          count.value++;
        }
      },
      child: Obx(() {
        count.value;
        return SizedBox(
          height: 300.px,
          child: LM(
            isLastPage: isLastPageForState.value,
            onLoadMore: () => onLoadMoreForState(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: 20.px),
              shrinkWrap: true,
              itemCount: searchStateController.text.isNotEmpty
                  ? statesListSearch.length
                  : statesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => clickOnStateDropDownValue(index: index),
                  borderRadius: BorderRadius.circular(2.px),
                  splashColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.px),
                        child: Row(
                          children: [
                            Text(searchStateController.text.isNotEmpty
                                  ? '${statesListSearch[index].stateId}'
                                  : '${statesList[index].stateId}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(width: 10.px),
                            Flexible(
                              child: Text(searchStateController.text.isNotEmpty
                                    ? '${statesListSearch[index].stateName}'
                                    : '${statesList[index].stateName}',
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      KNPWidgets.commonDividerView(height: 0.px),
                    ],
                  ),
                );
              },
            ),
          ),
        );
       },
      ),
    ).whenComplete(() {
      searchStateController.clear();
      isLastPageForState.value = false;
      statesListSearch.clear();
    });
  }

  Future<void> clickOnStateDropDownValue({required int index}) async {
    if (searchStateController.text.isNotEmpty) {
      stateController.text = '${statesListSearch[index].stateName}';
      stateId = '${statesListSearch[index].stateId}';
      Get.back();
      await callingGetCityApi(stateId: '${statesListSearch[index].stateId}');
    } else {
      offsetForCity.value = 0;
      limitForCity = '20';
      cityController.clear();
      cityList.clear();
      cityListSearch.clear();
      isLastPageForCity.value = false;
      stateController.text = '${statesList[index].stateName}';
      stateId = '${statesList[index].stateId}';
      Get.back();

      await callingGetCityApi(stateId: '${statesList[index].stateId}');
      count.value++;
    }
  }

  Future<void> onLoadMoreForState() async {
    KNPMethods.unFocsKeyBoard();
    offsetForState.value = offsetForState.value + 1;
    try {
      if (int.parse(limitForState) <= statesList.length) {
        await callingGetStateApi();
        count.value++;
      }
    } catch (e) {
      KNPMethods.error();
    }
  }

  Future<void> clickOnCityTextFormFiled() async {
    KNPMethods.unFocsKeyBoard();
    if(cityList.isNotEmpty){
      await CBS.commonBottomSheetForCountry(
        isSearchEnable: false,
        hintText: 'Search state',
        focusNode: focusNodeForSearchCity,
        searchController: searchCityController,
        onChanged: (value) {
          statesListSearch.clear();
          if (value.isEmpty) {
            return;
          } else {
            statesList.forEach((stateAllData) {
              if (stateAllData.stateName!.toLowerCase().contains(value.toLowerCase().trim())) {
                if (stateAllData.stateName?.toLowerCase().trim().contains(value.toLowerCase().trim()) != null) {
                  statesListSearch.add(stateAllData);
                } else {
                  statesListSearch = [];
                }
              }
            });
            count.value++;
          }
        },
        child: Obx(() {
          count.value;
          return SizedBox(
            height: 300.px,
            child: LM(
              isLastPage: isLastPageForCity.value,
              onLoadMore: () => onLoadMoreForCity(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20.px),
                shrinkWrap: true,
                itemCount: searchCityController.text.isNotEmpty
                    ? cityListSearch.length
                    : cityList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:  () => clickOnCityDropDownValue(index: index),
                    borderRadius: BorderRadius.circular(2.px),
                    splashColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.px),
                          child: Row(
                            children: [
                              Text(
                                searchCityController.text.isNotEmpty
                                    ? '${cityListSearch[index].cityId}'
                                    : '${cityList[index].cityId}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(width: 10.px),
                              Flexible(
                                child: Text(
                                  searchCityController.text.isNotEmpty
                                      ? '${cityListSearch[index].cityName}'
                                      : '${cityList[index].cityName}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        KNPWidgets.commonDividerView(height: 0.px),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ).whenComplete(() {
        searchCityController.clear();
        cityListSearch.clear();
      });
    }
  }

  void clickOnCityDropDownValue({required int index}) {
    if (searchStateController.text.isNotEmpty) {
      cityController.text = '${cityListSearch[index].cityName}';
      cityId = '${cityListSearch[index].cityId}';
      Get.back();
    } else {
      cityController.text = '${cityList[index].cityName}';
      cityId = '${cityList[index].cityId}';
      Get.back();
    }
  }

  Future<void> onLoadMoreForCity() async {
    KNPMethods.unFocsKeyBoard();
    offsetForCity.value = offsetForCity.value + 1;
    try {
      if (int.parse(limitForCity) <= cityList.length) {
        await callingGetCityApi(stateId: stateId ?? '');
        count.value++;
      }
    } catch (e) {
      KNPMethods.error();
    }
  }

  Future<void> callingRegisterApi() async {
    try {
      bodyParamsRegister = {
        ApiConstantVar.initials: initialsController.text.trim().toString(),
        ApiConstantVar.firstName: firstNameController.text.trim().toString(),
        ApiConstantVar.lastName: lastNameController.text.trim().toString(),
        ApiConstantVar.middleName: middleNameController.text.trim().toString(),
        ApiConstantVar.dob: CMForDateTime.dateTimeFormatForApi(dateTime: dobController.text.trim().toString()),
        ApiConstantVar.mobileNumber: mobileNumberController.text.trim().toString(),
        ApiConstantVar.whatsappNumber: whatsappNumberController.text.trim().toString(),
        ApiConstantVar.email: emailController.text.trim().toString(),
        ApiConstantVar.password: confirmPasswordController.text.trim().toString(),
        ApiConstantVar.address: completeAddressController.text.trim().toString(),
        ApiConstantVar.stateId: stateId,
        ApiConstantVar.cityId: cityId,
        ApiConstantVar.pinCode: pinCodeController.text.trim().toString(),
        ApiConstantVar.referredBy: /*'AYU81YQO'*/referralCode.value,
        ApiConstantVar.branch: rightLeftValue.value.toLowerCase(),
      };
      http.Response? res = await ApiIntrigation.registrationApi(bodyParams: bodyParamsRegister);
      if (res != null && res.statusCode == 200) {
        Map<String, dynamic> responseMap = jsonDecode(res.body);
        Get.toNamed(Routes.OTP, arguments: ['Personal Details', mobileNumberController.text.trim(), '${responseMap[ApiConstantVar.otp]}']);
        confirmButtonValue.value = false;
      } else {
        confirmButtonValue.value = false;
      }
    } catch (e) {
      KNPMethods.error();
      print('callingRegisterApi:::: ERROR::::  $e');
      confirmButtonValue.value = false;
    }
  }

  Future<void> clickOnContinueButtonView() async {
    KNPMethods.unFocsKeyBoard();
    if (key.currentState!.validate()) {
      confirmButtonValue.value = true;
      await callingRegisterApi();
    }
  }
}
