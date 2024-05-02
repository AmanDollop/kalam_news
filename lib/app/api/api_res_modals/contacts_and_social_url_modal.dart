class ContactsAndFollowSocialLinksModal {
  String? message;
  List<Contacts>? contacts;
  List<FollowUs>? followUs;

  ContactsAndFollowSocialLinksModal(
      {this.message, this.contacts, this.followUs});

  ContactsAndFollowSocialLinksModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(Contacts.fromJson(v));
      });
    }
    if (json['followUs'] != null) {
      followUs = <FollowUs>[];
      json['followUs'].forEach((v) {
        followUs!.add(FollowUs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (contacts != null) {
      data['contacts'] = contacts!.map((v) => v.toJson()).toList();
    }
    if (followUs != null) {
      data['followUs'] = followUs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  int? contactId;
  String? callingNumber;
  String? whatsapp;
  String? telegram;
  String? email;
  String? createdAt;
  String? updatedAt;

  Contacts(
      {this.contactId,
        this.callingNumber,
        this.whatsapp,
        this.telegram,
        this.email,
        this.createdAt,
        this.updatedAt});

  Contacts.fromJson(Map<String, dynamic> json) {
    contactId = json['contact_id'];
    callingNumber = json['calling_number'];
    whatsapp = json['whatsapp'];
    telegram = json['telegram'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_id'] = contactId;
    data['calling_number'] = callingNumber;
    data['whatsapp'] = whatsapp;
    data['telegram'] = telegram;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
