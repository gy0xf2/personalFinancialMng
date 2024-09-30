import 'package:flutter/material.dart';

class Transaction {
  final String name;
  final IconData icon;
  final DateTime date;
  final double amount;
  final Color? color;
  final String note;
  Transaction(
      {required this.name,
      required this.icon,
      required this.amount,
      required this.date,
      required this.color,
      this.note = ''});
}
