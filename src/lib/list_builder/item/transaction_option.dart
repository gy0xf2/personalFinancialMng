import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/list_builder/item/transaction_type.dart';
import 'package:flutter/material.dart';

class TransactionOption extends StatelessWidget {
  final TransactionType transaction;
  const TransactionOption({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: transaction.color,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            width: media.width * 0.25,
            height: media.width * 0.25,
            child: Icon(
              transaction.icon,
              color: TColor.white,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            transaction.name,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: TColor.white),
          )
        ],
      ),
    );
  }
}
