import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/list_builder/item/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionRow extends StatelessWidget {
  final TransactionItem transaction;
  final VoidCallback onPressed;

  const TransactionRow(
      {super.key, required this.transaction, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 65,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: TColor.gray70.withOpacity(0.35),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: transaction.color,
                    borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: FaIcon(
                  transaction.icon,
                  color: TColor.white,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      transaction.name,
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat('dd/MM/yy').format(transaction.date),
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Text(
                "${transaction.amount}đ",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
