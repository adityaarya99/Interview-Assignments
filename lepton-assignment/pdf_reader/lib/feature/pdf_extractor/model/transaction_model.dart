class Transaction {
  final String? date;
  final String? description;
  final String? debit;
  final String? credit;
  final String? balance;

  Transaction({
    required this.date,
    required this.description,
    required this.debit,
    required this.credit,
    required this.balance,
  });

  // Factory constructor to create a Transaction instance from a map
  factory Transaction.fromMap(Map<String, String> map) {
    return Transaction(
      date: map['date'] ?? 'Not Found',
      description: map['description'] ?? 'Not Found',
      debit: map['debit'] ?? 'Not Found',
      credit: map['credit'] ?? 'Not Found',
      balance: map['balance'] ?? 'Not Found',
    );
  }

  // Convert the Transaction instance to a map
  // Map<String, String> toMap() {
  //   return {
  //     'date': date,
  //     'description': description,
  //     'debit': debit,
  //     'credit': credit,
  //     'balance': balance,
  //   };
  // }
}