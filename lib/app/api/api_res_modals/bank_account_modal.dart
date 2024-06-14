class BankAccountsModal {
  String? message;
  List<BankAccounts>? bankAccounts;

  BankAccountsModal({this.message, this.bankAccounts});

  BankAccountsModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['bank_accounts'] != null) {
      bankAccounts = <BankAccounts>[];
      json['bank_accounts'].forEach((v) {
        bankAccounts!.add(BankAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (bankAccounts != null) {
      data['bank_accounts'] =
          bankAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankAccounts {
  int? bankId;
  int? userId;
  String? customerName;
  String? bankName;
  String? accountNo;
  String? ifscCode;
  String? bankBranch;
  int? isBankAccountVerify;
  String? createdAt;
  String? updatedAt;
  String? accountType;
  int? primaryBank;
  String? bankPassbook;

  BankAccounts(
      {this.bankId,
        this.userId,
        this.customerName,
        this.bankName,
        this.accountNo,
        this.ifscCode,
        this.bankBranch,
        this.isBankAccountVerify,
        this.createdAt,
        this.updatedAt,
        this.accountType,
        this.primaryBank,
        this.bankPassbook,
      });

  BankAccounts.fromJson(Map<String, dynamic> json) {
    bankId = json['bank_id'];
    userId = json['user_id'];
    customerName = json['customer_name'];
    bankName = json['bank_name'];
    accountNo = json['account_no'];
    ifscCode = json['ifsc_code'];
    bankBranch = json['bank_branch'];
    isBankAccountVerify = json['is_bank_account_verify'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountType = json['account_type'];
    primaryBank = json['primary_bank'];
    bankPassbook = json['bank_passbook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_id'] = bankId;
    data['user_id'] = userId;
    data['customer_name'] = customerName;
    data['bank_name'] = bankName;
    data['account_no'] = accountNo;
    data['ifsc_code'] = ifscCode;
    data['bank_branch'] = bankBranch;
    data['is_bank_account_verify'] = isBankAccountVerify;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['account_type'] = accountType;
    data['primary_bank'] = primaryBank;
    data['bank_passbook'] = bankPassbook;
    return data;
  }
}
