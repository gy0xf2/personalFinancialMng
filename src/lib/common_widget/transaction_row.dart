import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/list_builder/item/transaction.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionRow extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onPressed;

  const TransactionRow(
      {super.key, required this.transaction, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: transaction.color,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: FaIcon(
                  transaction.icon,
                  color: TColor.white,
                ),
              ),
              // Image.asset(
              //   subObject['icon'],
              //   width: 40,
              //   height: 40,
              // ),
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
