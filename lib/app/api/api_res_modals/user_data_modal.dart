class UserDataModal {
  String? message;
  String? accessToken;
  UserDetails? userDetails;

  UserDataModal({this.message, this.accessToken, this.userDetails});

  UserDataModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['access_token'] = accessToken;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? userId;
  String? uuid;
  String? referralCode;
  String? initials;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dob;
  String? mobileNumber;
  String? whatsappNumber;
  String? email;
  String? pincode;
  String? address;
  int? stateId;
  int? cityId;
  String? profile;
  int? status;
  String? otp;
  int? isMobileVerify;
  int? isEmailVerify;
  String? referredBy;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.userId,
        this.uuid,
        this.referralCode,
        this.initials,
        this.firstName,
        this.middleName,
        this.lastName,
        this.dob,
        this.mobileNumber,
        this.whatsappNumber,
        this.email,
        this.pincode,
        this.address,
        this.stateId,
        this.cityId,
        this.profile,
        this.status,
        this.otp,
        this.isMobileVerify,
        this.isEmailVerify,
        this.referredBy,
        this.createdAt,
        this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    uuid = json['uuid'];
    referralCode = json['referral_code'];
    initials = json['initials'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    mobileNumber = json['mobile_number'];
    whatsappNumber = json['whatsapp_number'];
    email = json['email'];
    pincode = json['pincode'];
    address = json['address'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    profile = json['profile'];
    status = json['status'];
    otp = json['otp'];
    isMobileVerify = json['is_mobile_verify'];
    isEmailVerify = json['is_email_verify'];
    referredBy = json['referred_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['uuid'] = uuid;
    data['referral_code'] = referralCode;
    data['initials'] = initials;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['dob'] = dob;
    data['mobile_number'] = mobileNumber;
    data['whatsapp_number'] = whatsappNumber;
    data['email'] = email;
    data['pincode'] = pincode;
    data['address'] = address;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['profile'] = profile;
    data['status'] = status;
    data['otp'] = otp;
    data['is_mobile_verify'] = isMobileVerify;
    data['is_email_verify'] = isEmailVerify;
    data['referred_by'] = referredBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
