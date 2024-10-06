import 'package:flutter/material.dart';

class TransactionItem {
  final bool type;
  final String name;
  final IconData icon;
  final DateTime date;
  final int amount;
  final Color? color;
  final String note;
  TransactionItem(
      {required this.type,
      required this.name,
      required this.icon,
      required this.amount,
      required this.date,
      required this.color,
      this.note = ''});
  toJson() {
    return {
      'type': type,
      'name': name,
      'icon': icon.codePoint,
      'amount': amount,
      'date': date.toIso8601String(),
      'color': color!.value,
      'note': note
    };
  }

  static TransactionItem getInstance(Map<String, dynamic> document) {
    return TransactionItem(
        type: document['type'],
        name: document['name'],
        icon: IconData(document['icon']),
        amount: document['amount'],
        date: DateTime.parse(document['date']),
        color: Color(document['color']));
  }
}
