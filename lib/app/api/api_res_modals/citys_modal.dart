class CityModal {
  String? message;
  List<Cities>? cities;

  CityModal({this.message, this.cities});

  CityModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? cityId;
  String? cityName;
  int? stateId;

  Cities({this.cityId, this.cityName, this.stateId});

  Cities.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['state_id'] = stateId;
    return data;
  }
}
