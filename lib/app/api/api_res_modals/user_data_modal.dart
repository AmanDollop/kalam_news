class UserDataModal {
  String? message;
  String? accessToken;
  int? profilePercentage;
  UserDetails? userDetails;
  List<ProfilePercentageArr>? profilePercentageArr;

  UserDataModal({this.message, this.accessToken, this.userDetails,this.profilePercentageArr});

  UserDataModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    profilePercentage = json['profile_percentage'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
    profilePercentage = json['profile_percentage'];
    if (json['profile_percentage_arr'] != null) {
      profilePercentageArr = <ProfilePercentageArr>[];
      json['profile_percentage_arr'].forEach((v) {
        profilePercentageArr!.add(ProfilePercentageArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['access_token'] = accessToken;
    data['profile_percentage'] = profilePercentage;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    if (profilePercentageArr != null) {
      data['profile_percentage_arr'] =
          profilePercentageArr!.map((v) => v.toJson()).toList();
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
  int? cityId;
  int? stateId;
  String? address;
  String? profile;
  String? otp;
  String? referredBy;
  int? rUserId;
  int? lUserId;
  int? isMobileVerify;
  int? isEmailVerify;
  String? createdAt;
  String? updatedAt;
  String? cityName;
  String? stateName;

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
        this.cityId,
        this.stateId,
        this.address,
        this.profile,
        this.otp,
        this.referredBy,
        this.rUserId,
        this.lUserId,
        this.isMobileVerify,
        this.isEmailVerify,
        this.createdAt,
        this.updatedAt,
        this.cityName,
        this.stateName});

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
    cityId = json['city_id'];
    stateId = json['state_id'];
    address = json['address'];
    profile = json['profile'];
    otp = json['otp'];
    referredBy = json['referred_by'];
    rUserId = json['r_user_id'];
    lUserId = json['l_user_id'];
    isMobileVerify = json['is_mobile_verify'];
    isEmailVerify = json['is_email_verify'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityName = json['city_name'];
    stateName = json['state_name'];
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
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['address'] = address;
    data['profile'] = profile;
    data['otp'] = otp;
    data['referred_by'] = referredBy;
    data['r_user_id'] = rUserId;
    data['l_user_id'] = lUserId;
    data['is_mobile_verify'] = isMobileVerify;
    data['is_email_verify'] = isEmailVerify;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['city_name'] = cityName;
    data['state_name'] = stateName;
    return data;
  }
}

class ProfilePercentageArr {
  String? title;
  int? isEmpty;

  ProfilePercentageArr({this.title, this.isEmpty});

  ProfilePercentageArr.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isEmpty = json['isEmpty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isEmpty'] = isEmpty;
    return data;
  }
}