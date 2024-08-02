class AccountDetailModel {
  final String? accountNumber;
  final String? statementPeriod;
  final String? closingBalance;

  AccountDetailModel({
    this.accountNumber,
    this.statementPeriod,
    this.closingBalance,
  });

  factory AccountDetailModel.fromJson(Map<String, dynamic> json) => AccountDetailModel(
    accountNumber: json["accountNumber"],
    statementPeriod: json["statementPeriod"],
    closingBalance: json["closingBalance"],
  );

  Map<String, dynamic> toJson() => {
    "accountNumber": accountNumber,
    "statementPeriod": statementPeriod,
    "closingBalance": closingBalance,
  };
}
