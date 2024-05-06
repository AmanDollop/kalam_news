class WithdrawHistoryModal {
  bool? success;
  int? totalWithdrawal;
  int? totalCommission;
  List<WalletHistory>? walletHistory;

  WithdrawHistoryModal(
      {this.success,
        this.totalWithdrawal,
        this.totalCommission,
        this.walletHistory});

  WithdrawHistoryModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    totalWithdrawal = json['total_withdrawal'];
    totalCommission = json['total_commission'];
    if (json['wallet_history'] != null) {
      walletHistory = <WalletHistory>[];
      json['wallet_history'].forEach((v) {
        walletHistory!.add(WalletHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['total_withdrawal'] = totalWithdrawal;
    data['total_commission'] = totalCommission;
    if (walletHistory != null) {
      data['wallet_history'] =
          walletHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WalletHistory {
  int? walletHistoryId;
  String? uuid;
  String? paymentType;
  String? amount;
  int? userId;
  String? transactionId;
  String? transactionType;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  int? commissionByUserId;
  int? commissionLevel;

  WalletHistory(
      {this.walletHistoryId,
        this.uuid,
        this.paymentType,
        this.amount,
        this.userId,
        this.transactionId,
        this.transactionType,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.commissionByUserId,
        this.commissionLevel});

  WalletHistory.fromJson(Map<String, dynamic> json) {
    walletHistoryId = json['wallet_history_id'];
    uuid = json['uuid'];
    paymentType = json['payment_type'];
    amount = json['amount'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    transactionType = json['transaction_type'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    commissionByUserId = json['commission_by_user_id'];
    commissionLevel = json['commission_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['wallet_history_id'] = walletHistoryId;
    data['uuid'] = uuid;
    data['payment_type'] = paymentType;
    data['amount'] = amount;
    data['user_id'] = userId;
    data['transaction_id'] = transactionId;
    data['transaction_type'] = transactionType;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['commission_by_user_id'] = commissionByUserId;
    data['commission_level'] = commissionLevel;
    return data;
  }
}
