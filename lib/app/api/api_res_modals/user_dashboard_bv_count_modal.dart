class UserDashboardBVCountModal {
  String? message;
  UserDashboardBVCount? userDashboardBVCount;

  UserDashboardBVCountModal({this.message, this.userDashboardBVCount});

  UserDashboardBVCountModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userDashboardBVCount = json['userDashboardBVCount'] != null
        ? UserDashboardBVCount.fromJson(json['userDashboardBVCount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (userDashboardBVCount != null) {
      data['userDashboardBVCount'] = userDashboardBVCount!.toJson();
    }
    return data;
  }
}

class UserDashboardBVCount {
  String? leftCommission;
  String? rightCommission;
  String? totalWithdrawal;
  String? totalWalletBalance;
  String? lUserNodeCount;
  String? rUserNodeCount;

  UserDashboardBVCount(
      {this.leftCommission,
        this.rightCommission,
        this.totalWithdrawal,
        this.totalWalletBalance,
        this.lUserNodeCount,
        this.rUserNodeCount});

  UserDashboardBVCount.fromJson(Map<String, dynamic> json) {
    leftCommission = json['left_commission'];
    rightCommission = json['right_commission'];
    totalWithdrawal = json['total_withdrawal'];
    totalWalletBalance = json['total_wallet_balance'];
    lUserNodeCount = json['l_user_node_count'];
    rUserNodeCount = json['r_user_node_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['left_commission'] = leftCommission;
    data['right_commission'] = rightCommission;
    data['total_withdrawal'] = totalWithdrawal;
    data['total_wallet_balance'] = totalWalletBalance;
    data['l_user_node_count'] = lUserNodeCount;
    data['r_user_node_count'] = rUserNodeCount;
    return data;
  }
}
