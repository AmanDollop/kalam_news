import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalam_news_publication/app/api/api_constant_var/api_constant_var.dart';
import 'package:kalam_news_publication/app/api/api_intrigation/api_intrigation.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_detail.dart';
import 'package:kalam_news_publication/app/api/api_res_modals/package_modal.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:kalam_news_publication/app/common/packages/cbs.dart';
import 'package:kalam_news_publication/app/common/widgets/knp_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeController extends GetxController {

  final count = 0.obs;
  final apiResValue = true.obs;

  final packageClickValue = false.obs;

  final bannerIndex = 0.obs;
  final bannerList = [
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYRNamIIDEJN4sHp3UuQVpYfwhrsNUZEld0aTCqAs4qMG-X9Wb3IGmvN3CbeSnvDzl_4c&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6g3P5972LeN4_5J9Dua6oCYn3cBzjSUGys5dhj4qerMbHQY5-TRyMzrmuRe3m6SPz4WU&usqp=CAU'
  ];

  final packageModal = Rxn<PackageModal>();
  List<PackageList>? packageList;

  final packageDetailModal = Rxn<PackageDetailModal>();
  List<PackageDetails>? packageDetails;
  Map<String, dynamic> bodyParamsForPackageDetailApi = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    await callingPackageApi();
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

  Future<void> clickOnPackage({required int index}) async {
    packageClickValue.value = true;
    count.value++;
    try{
      await callingPackageDetailApi(packageId: '${packageList?[index].packageId}');
      await CBS.commonDraggableBottomSheet(
        isDismissible: false,
        enableDrag: false,
        isDragOn: false,
        minChildSize: 1,
        initialChildSize: 1,
        maxChildSize: 1,
        children: [
          KNPWidgets.commonNetworkImageView(
            path: '${ApiUrls.baseUrlForImage}${packageDetailModal.value?.packageImage}',
            isAssetImage: false,
            height: 200.px,
          ),
          SizedBox(height: 10.px),
          Text(
            '${packageDetailModal.value?.packageName}',
            style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(fontSize: 20.px),
          ),
          if(packageDetails != null && packageDetails!.isNotEmpty)
            SizedBox(height: 10.px),
          if(packageDetails != null && packageDetails!.isNotEmpty)
            KNPWidgets.commonContainerView(
              child: Column(
                children: [
                  commonRowForBottomSheet(titleValue: true,text1: 'Stage', text2: 'Member', text3: 'Commission'),
                  SizedBox(height: 10.px),
                  KNPWidgets.commonDividerView(),
                  SizedBox(height: 10.px),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: packageDetails?.length,
                    itemBuilder: (context, index) {
                      return commonRowForBottomSheet(
                          text1 : '${packageDetails?[index].stageNumber}',
                          text2 : '${packageDetails?[index].numberOfMembers}',
                          text3 : '${packageDetails?[index].commission}');
                    },
                  ),
                ],
              ),
            ),
          SizedBox(height: 10.px),
          KNPWidgets.commonElevatedButton(onPressed: (){},buttonText: 'Purchase now'),
          SizedBox(height: 20.px),
        ],
      );
    }catch(e){
      packageClickValue.value = false;
    }
    packageClickValue.value = false;
    count.value++;
  }

  Widget commonTitleTextView({required String text,TextAlign? textAlign}) => Expanded(
    child: Text(
      text,
      style: Theme.of(Get.context!).textTheme.bodySmall,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    ),
  );

  Widget commonSubTitleTextView({required String text,TextAlign? textAlign}) => Expanded(
    child: Text(
      text,
      style: Theme.of(Get.context!).textTheme.titleMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    ),
  );

  Widget commonRowForBottomSheet({bool titleValue = false,required String text1, required String text2, required String text3}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      titleValue
          ? commonTitleTextView(text: text1)
          : commonSubTitleTextView(text: text1),
      titleValue
          ? commonTitleTextView(text: text2,textAlign: TextAlign.center)
          : commonSubTitleTextView(text: text2,textAlign: TextAlign.center),
      titleValue
          ? commonTitleTextView(text: text3,textAlign: TextAlign.end)
          : commonSubTitleTextView(text: text3,textAlign: TextAlign.end),
    ],
  );

  Future<void> callingPackageApi() async {
    apiResValue.value = true;
    try{
      packageModal.value = await ApiIntrigation.getPackageApi();
      if(packageModal.value != null){
        packageList = packageModal.value?.packageList;
      }
    }catch(e){
      print('callingPackageApi::::  ERROR::::: $e');
      apiResValue.value =  false;
      KNPMethods.error();
    }
    apiResValue.value =  false;
  }

  Future<void> callingPackageDetailApi({required String packageId}) async {
    try{
      bodyParamsForPackageDetailApi = {
        ApiConstantVar.packageId : packageId
      };
      packageDetailModal.value = await ApiIntrigation.getPackageDetailApi(bodyParams: bodyParamsForPackageDetailApi);
      if(packageDetailModal.value != null){
        packageDetails = packageDetailModal.value?.packageDetails;
      }
    }catch(e){
      print('callingPackageDetailApi::::  ERROR::::: $e');
      apiResValue.value =  false;
      KNPMethods.error();
    }
  }

}
