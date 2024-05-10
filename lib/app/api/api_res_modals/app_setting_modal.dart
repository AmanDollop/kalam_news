class AppSettingModal {
  String? message;
  Contacts? contacts;
  List<FollowUs>? followUs;
  String? termCondition;
  String? welcomeMessage;
  String? inviteMessage;

  AppSettingModal(
      {this.message,
        this.contacts,
        this.followUs,
        this.termCondition,
        this.welcomeMessage,
        this.inviteMessage,
      });

  AppSettingModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    contacts = json['contacts'] != null
        ? Contacts.fromJson(json['contacts'])
        : null;
    if (json['followUs'] != null) {
      followUs = <FollowUs>[];
      json['followUs'].forEach((v) {
        followUs!.add(FollowUs.fromJson(v));
      });
    }
    termCondition = json['termCondition'];
    welcomeMessage = json['welcomeMessage'];
    inviteMessage = json['inviteMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (contacts != null) {
      data['contacts'] = contacts!.toJson();
    }
    if (followUs != null) {
      data['followUs'] = followUs!.map((v) => v.toJson()).toList();
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
