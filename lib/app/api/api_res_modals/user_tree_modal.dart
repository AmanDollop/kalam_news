class UserTreeModal {
  String? message;
  String? parentUserId;
  UserDetailsForUserTree? userDetailsForUserTree;
  RUser? rUser;
  LUser? lUser;
  UserBVCount? userBVCount;

  UserTreeModal(
      {this.message,
      this.parentUserId,
      this.userDetailsForUserTree,
      this.rUser,
      this.lUser,
      this.userBVCount});

  UserTreeModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    parentUserId = json['parentUserId'];
    userDetailsForUserTree = json['user_details'] != null
        ? UserDetailsForUserTree.fromJson(json['user_details'])
        : null;
    rUser = json['rUser'] != null ? RUser.fromJson(json['rUser']) : null;
    lUser = json['lUser'] != null ? LUser.fromJson(json['lUser']) : null;
    userBVCount = json['userBVCount'] != null
        ? UserBVCount.fromJson(json['userBVCount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['parentUserId'] = parentUserId;
    if (userDetailsForUserTree != null) {
      data['user_details'] = userDetailsForUserTree!.toJson();
    }
    if (rUser != null) {
      data['rUser'] = rUser!.toJson();
    }
    if (lUser != null) {
      data['lUser'] = lUser!.toJson();
    }
    if (userBVCount != null) {
      data['userBVCount'] = userBVCount!.toJson();
    }
    return data;
  }
}

class UserDetailsForUserTree {
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
  String? lBvCount;
  String? rBvCount;
  int? userLevel;
  int? isPaidUser;

  UserDetailsForUserTree(
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
      this.lBvCount,
      this.userLevel,
      this.isPaidUser,
      this.rBvCount});

  UserDetailsForUserTree.fromJson(Map<String, dynamic> json) {
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
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
    userLevel = json['user_level'];
    isPaidUser = json['is_paid_user'];
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
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
    data['user_level'] = userLevel;
    data['is_paid_user'] = isPaidUser;
    return data;
  }
}

class RUser {
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
  int? userLevel;
  String? lBvCount;
  String? rBvCount;
  int? isPaidUser;

  RUser(
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
      this.userLevel,
      this.lBvCount,
      this.isPaidUser,
      this.rBvCount});

  RUser.fromJson(Map<String, dynamic> json) {
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
    userLevel = json['user_level'];
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
    isPaidUser = json['is_paid_user'];
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
    data['user_level'] = userLevel;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
    data['is_paid_user'] = isPaidUser;
    return data;
  }
}

class LUser {
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
  int? userLevel;
  String? lBvCount;
  String? rBvCount;
  int? isPaidUser;

  LUser(
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
      this.userLevel,
      this.lBvCount,
      this.isPaidUser,
      this.rBvCount});

  LUser.fromJson(Map<String, dynamic> json) {
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
    userLevel = json['user_level'];
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
    isPaidUser = json['is_paid_user'];
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
    data['user_level'] = userLevel;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
    data['is_paid_user'] = isPaidUser;
    return data;
  }
}

class UserBVCount {
  String? totalBvCount;
  String? lBvCount;
  String? rBvCount;

  UserBVCount({this.totalBvCount, this.lBvCount, this.rBvCount});

  UserBVCount.fromJson(Map<String, dynamic> json) {
    totalBvCount = json['total_bv_count'];
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_bv_count'] = totalBvCount;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
    return data;
  }
}