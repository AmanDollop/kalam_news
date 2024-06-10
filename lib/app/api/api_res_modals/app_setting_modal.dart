class AppSettingModal {
  String? message;
  Contacts? contacts;
  List<FollowUs>? followUs;
  String? termCondition;
  String? welcomeMessage;
  String? inviteMessage;
  String? kycAddOrNot;
  KycDocument? kycDocument;

  AppSettingModal(
      {this.message,
        this.contacts,
        this.followUs,
        this.termCondition,
        this.welcomeMessage,
        this.inviteMessage,
        this.kycAddOrNot,
        this.kycDocument,
      });

  AppSettingModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    kycAddOrNot = json['kyc_add_or_not'];
    contacts = json['contacts'] != null
        ? Contacts.fromJson(json['contacts'])
        : null;
    if (json['followUs'] != null) {
      followUs = <FollowUs>[];
      json['followUs'].forEach((v) {
        followUs!.add(FollowUs.fromJson(v));
      });
    }
    kycDocument = json['kycDocument'] != null
        ? KycDocument.fromJson(json['kycDocument'])
        : null;
    termCondition = json['termCondition'];
    welcomeMessage = json['welcomeMessage'];
    inviteMessage = json['inviteMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['kyc_add_or_not'] = kycAddOrNot;
    if (contacts != null) {
      data['contacts'] = contacts!.toJson();
    }
    if (followUs != null) {
      data['followUs'] = followUs!.map((v) => v.toJson()).toList();
    }
    if (kycDocument != null) {
      data['kycDocument'] = kycDocument!.toJson();
    }
    data['termCondition'] = termCondition;
    data['welcomeMessage'] = welcomeMessage;
    data['inviteMessage'] = inviteMessage;
    return data;
  }
}

class Contacts {
  String? callingNumber;
  String? whatsapp;
  String? telegram;
  String? email;

  Contacts({this.callingNumber, this.whatsapp, this.telegram, this.email});

  Contacts.fromJson(Map<String, dynamic> json) {
    callingNumber = json['calling_number'];
    whatsapp = json['whatsapp'];
    telegram = json['telegram'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calling_number'] = callingNumber;
    data['whatsapp'] = whatsapp;
    data['telegram'] = telegram;
    data['email'] = email;
    return data;
  }
}

class FollowUs {
  int? socialId;
  String? platform;
  String? links;
  String? createdAt;
  String? updatedAt;
  String? icon;

  FollowUs(
      {this.socialId,
        this.platform,
        this.links,
        this.createdAt,
        this.updatedAt,
        this.icon});

  FollowUs.fromJson(Map<String, dynamic> json) {
    socialId = json['social_id'];
    platform = json['platform'];
    links = json['links'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['social_id'] = socialId;
    data['platform'] = platform;
    data['links'] = links;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['icon'] = icon;
    return data;
  }
}

class KycDocument {
  int? docsId;
  int? userId;
  String? aadharCardNo;
  String? aadharCardPhotoFront;
  String? aadharCardPhotoBack;
  String? panCardNo;
  String? panCardPhoto;
  int? isAadharVerified;
  int? isPanVerified;
  String? createdAt;
  String? updatedAt;

  KycDocument(
      {this.docsId,
        this.userId,
        this.aadharCardNo,
        this.aadharCardPhotoFront,
        this.aadharCardPhotoBack,
        this.panCardNo,
        this.panCardPhoto,
        this.isAadharVerified,
        this.isPanVerified,
        this.createdAt,
        this.updatedAt});

  KycDocument.fromJson(Map<String, dynamic> json) {
    docsId = json['docs_id'];
    userId = json['user_id'];
    aadharCardNo = json['aadhar_card_no'];
    aadharCardPhotoFront = json['aadhar_card_photo_front'];
    aadharCardPhotoBack = json['aadhar_card_photo_back'];
    panCardNo = json['pan_card_no'];
    panCardPhoto = json['pan_card_photo'];
    isAadharVerified = json['is_aadhar_verified'];
    isPanVerified = json['is_pan_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docs_id'] = docsId;
    data['user_id'] = userId;
    data['aadhar_card_no'] = aadharCardNo;
    data['aadhar_card_photo_front'] = aadharCardPhotoFront;
    data['aadhar_card_photo_back'] = aadharCardPhotoBack;
    data['pan_card_no'] = panCardNo;
    data['pan_card_photo'] = panCardPhoto;
    data['is_aadhar_verified'] = isAadharVerified;
    data['is_pan_verified'] = isPanVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

}
