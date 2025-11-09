/*
  MAD201 - Project 1
  Your Name - Ashishkumar Prajapati
  Model for a transaction record
*/
class Transaction {
  int? id;
  String title;
  double amount;
  String type; // 'Income' or 'Expense'
  String category;
  DateTime date;

  Transaction({
    this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'type': type,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      type: map['type'],
      category: map['category'],
      date: DateTime.parse(map['date']),
    );
  }
}
