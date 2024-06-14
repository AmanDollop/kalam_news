class ReferralUserDataModal {
  String? status;
  String? message;
  ReferralUserData? referralUserData;

  ReferralUserDataModal({this.status, this.message, this.referralUserData});

  ReferralUserDataModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    referralUserData = json['referral_user_data'] != null
        ? ReferralUserData.fromJson(json['referral_user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (referralUserData != null) {
      data['referral_user_data'] = referralUserData!.toJson();
    }
    return data;
  }
}

class ReferralUserData {
  String? name;
  String? mobileNumber;
  String? referralCode;
  String? city;
  bool? left;
  bool? right;

  ReferralUserData(
      {this.name,
        this.mobileNumber,
        this.referralCode,
        this.city,
        this.left,
        this.right});

  ReferralUserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNumber = json['mobile_number'];
    referralCode = json['referral_code'];
    city = json['city'];
    left = json['left'];
    right = json['right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mobile_number'] = mobileNumber;
    data['referral_code'] = referralCode;
    data['city'] = city;
    data['left'] = left;
    data['right'] = right;
    return data;
  }
}
