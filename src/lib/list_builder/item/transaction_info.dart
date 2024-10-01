import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/list_builder/item/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionInfo extends StatelessWidget {
  final TransactionItem transaction;
  const TransactionInfo({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                color: transaction.color,
                borderRadius: BorderRadius.circular(24)),
            alignment: Alignment.center,
            width: media.width * 0.25,
            height: media.width * 0.25,
            child: Icon(
              transaction.icon,
              color: TColor.white,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            transaction.name,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w700, color: TColor.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${transaction.amount}đ',
            style: TextStyle(
                color: TColor.gray30,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
