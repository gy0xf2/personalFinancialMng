import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/list_builder/item/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({super.key, required this.transaction});

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
          // Image.asset(
          //   transaction['icon'],
          //   width: media.width * 0.25,
          //   height: media.width * 0.25,
          //   fit: BoxFit.fitHeight,
          // ),
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
