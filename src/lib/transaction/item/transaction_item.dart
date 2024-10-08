import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem {
  final String id;
  final bool type;
  final String name;
  final IconData icon;
  final DateTime date;
  final double amount;
  final Color? color;
  final String note;
  TransactionItem(
      {required this.type,
      required this.id,
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
      'icon': {
        'codePoint': icon.codePoint,
        'fontFamily': icon.fontFamily,
        'fontPackage': icon.fontPackage
      },
      'amount': amount,
      'date': DateFormat('dd/MM/yyyy').format(date),
      'color': color!.value,
      'note': note
    };
  }

  factory TransactionItem.fromMap(Map<String, dynamic> transaction, String id) {
    return TransactionItem(
        id: id,
        type: transaction['type'],
        name: transaction['name'],
        icon: IconData(transaction['icon']['codePoint'] as int,
            fontFamily: transaction['icon']['fontFamily'] as String,
            fontPackage: transaction['icon']['fontPackage'] as String),
        amount: transaction['amount'] as double,
        date: DateFormat('dd/MM/yyyy').parse(transaction['date']),
        color: Color(transaction['color']));
  }
}
