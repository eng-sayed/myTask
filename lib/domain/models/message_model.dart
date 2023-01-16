import 'dart:convert';

class MessageModel {
  String? sender;
  String? body;
  num? amount;
  int? day;
  int? month;
  int? year;
  MessageModel({
    this.sender,
    this.body,
    this.amount,
    this.day,
    this.month,
    this.year,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (sender != null) {
      result.addAll({'sender': sender});
    }
    if (body != null) {
      result.addAll({'body': body});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (day != null) {
      result.addAll({'day': day});
    }
    if (month != null) {
      result.addAll({'month': month});
    }
    if (year != null) {
      result.addAll({'year': year});
    }

    return result;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      sender: map['sender'],
      body: map['body'],
      amount: map['amount'],
      day: map['day']?.toInt(),
      month: map['month']?.toInt(),
      year: map['year']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
