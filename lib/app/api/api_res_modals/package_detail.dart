class PackageDetailModal {
  String? message;
  String? packageName;
  String? packageImage;
  String? packageAmount;
  List<PackageDetails>? packageDetails;
  int? isUserPackage;

  PackageDetailModal(
      {this.message,
        this.packageName,
        this.packageImage,
        this.packageAmount,
        this.packageDetails,
        this.isUserPackage});

  PackageDetailModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    packageName = json['package_name'];
    packageImage = json['package_image'];
    packageAmount = json['package_amount'];
    if (json['package_details'] != null) {
      packageDetails = <PackageDetails>[];
      json['package_details'].forEach((v) {
        packageDetails!.add(PackageDetails.fromJson(v));
      });
    }
    isUserPackage = json['is_user_package'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['package_name'] = packageName;
    data['package_image'] = packageImage;
    data['package_amount'] = packageAmount;
    if (packageDetails != null) {
      data['package_details'] =
          packageDetails!.map((v) => v.toJson()).toList();
    }
    data['is_user_package'] = isUserPackage;
    return data;
  }
}

class PackageDetails {
  int? stageId;
  int? packageId;
  int? stageNumber;
  String? commission;
  int? numberOfMembers;
  String? businessValue;
  String? createdAt;
  String? updatedAt;
  String? packageName;
  String? packageImage;
  String? packagePrice;

  PackageDetails(
      {this.stageId,
        this.packageId,
        this.stageNumber,
        this.commission,
        this.numberOfMembers,
        this.businessValue,
        this.createdAt,
        this.updatedAt,
        this.packageName,
        this.packageImage,
        this.packagePrice});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    stageId = json['stage_id'];
    packageId = json['package_id'];
    stageNumber = json['stage_number'];
    commission = json['commission'];
    numberOfMembers = json['number_of_members'];
    businessValue = json['business_value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    packageName = json['package_name'];
    packageImage = json['package_image'];
    packagePrice = json['package_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stage_id'] = stageId;
    data['package_id'] = packageId;
    data['stage_number'] = stageNumber;
    data['commission'] = commission;
    data['number_of_members'] = numberOfMembers;
    data['business_value'] = businessValue;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['package_name'] = packageName;
    data['package_image'] = packageImage;
    data['package_price'] = packagePrice;
    return data;
  }
}
