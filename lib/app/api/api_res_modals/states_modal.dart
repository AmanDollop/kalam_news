class StatesModal {
  String? message;
  List<States>? states;

  StatesModal({this.message, this.states});

  StatesModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (states != null) {
      data['states'] = states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  int? stateId;
  String? stateName;
  int? flag;

  States({this.stateId, this.stateName, this.flag});

  States.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['flag'] = flag;
    return data;
  }
}
