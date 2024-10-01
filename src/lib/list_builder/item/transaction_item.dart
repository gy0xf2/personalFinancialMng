import 'package:flutter/material.dart';

class TransactionItem {
  final bool type;
  final String name;
  final IconData icon;
  final DateTime date;
  final double amount;
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
}
