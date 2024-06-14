class UserTreeModal {
  String? message;
  ParentUserData? parentUserData;
  UserDetailsForUserTree? userDetails;
  RUser? rUser;
  LUser? lUser;
  UserBVCount? userBVCount;

  UserTreeModal(
      {this.message,
        this.parentUserData,
        this.userDetails,
        this.rUser,
        this.lUser,
        this.userBVCount});

  UserTreeModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    parentUserData = json['parentUserData'] != null
        ? ParentUserData.fromJson(json['parentUserData'])
        : null;
    userDetails = json['user_details'] != null
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
    if (parentUserData != null) {
      data['parentUserData'] = parentUserData!.toJson();
    }
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
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
  int? isPaidUser;
  int? userLevel;
  String? lBvCount;
  String? rBvCount;

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
        this.isPaidUser,
        this.userLevel,
        this.lBvCount,
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
    isPaidUser = json['is_paid_user'];
    userLevel = json['user_level'];
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['is_paid_user'] = isPaidUser;
    data['user_level'] = userLevel;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
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
  int? isPaidUser;
  String? lBvCount;
  String? rBvCount;

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
        this.isPaidUser,
        this.lBvCount,
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
    isPaidUser = json['is_paid_user'];
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['is_paid_user'] = isPaidUser;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
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
  int? isPaidUser;
  String? lBvCount;
  String? rBvCount;

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
        this.isPaidUser,
        this.lBvCount,
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
    isPaidUser = json['is_paid_user'];
    lBvCount = json['l_bv_count'];
    rBvCount = json['r_bv_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['is_paid_user'] = isPaidUser;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
    return data;
  }
}

class ParentUserData {
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

  ParentUserData(
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
        this.updatedAt});

  ParentUserData.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_bv_count'] = totalBvCount;
    data['l_bv_count'] = lBvCount;
    data['r_bv_count'] = rBvCount;
    return data;
  }
}
