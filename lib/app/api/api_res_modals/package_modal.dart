class PackageModal {
  String? message;
  int? isUserPackage;
  List<PackageList>? packageList;

  PackageModal({this.message, this.packageList,this.isUserPackage});

  PackageModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isUserPackage = json['is_user_package'];
    if (json['package_list'] != null) {
      packageList = <PackageList>[];
      json['package_list'].forEach((v) {
        packageList!.add(PackageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['is_user_package'] = isUserPackage;
    if (packageList != null) {
      data['package_list'] = packageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageList {
  int? packageId;
  String? packageName;
  String? packagePrice;
  String? packageImage;

  PackageList(
      {this.packageId, this.packageName, this.packagePrice, this.packageImage});

  PackageList.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packagePrice = json['package_price'];
    packageImage = json['package_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package_id'] = packageId;
    data['package_name'] = packageName;
    data['package_price'] = packagePrice;
    data['package_image'] = packageImage;
    return data;
  }
}
