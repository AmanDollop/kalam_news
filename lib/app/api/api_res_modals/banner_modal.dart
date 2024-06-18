class BannerModal {
  int? i0;
  String? message;
  List<BannerList>? banner;

  BannerModal({this.i0, this.message, this.banner});

  BannerModal.fromJson(Map<String, dynamic> json) {
    i0 = json['0'];
    message = json['message'];
    if (json['banner'] != null) {
      banner = <BannerList>[];
      json['banner'].forEach((v) {
        banner!.add(BannerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = i0;
    data['message'] = message;
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerList {
  int? bannerId;
  String? bannerImage;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  BannerList(
      {this.bannerId,
        this.bannerImage,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  BannerList.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerImage = json['banner_image'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['banner_image'] = bannerImage;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
