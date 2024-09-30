import 'package:financialmng/common_widget/transaction_row.dart';
import 'package:flutter/material.dart';

class RowBuilder extends StatefulWidget {
  final List transactionList;
  const RowBuilder({super.key, required this.transactionList});

  @override
  State<RowBuilder> createState() => _RowBuilderState();
}

class _RowBuilderState extends State<RowBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.transactionList.length,
      itemBuilder: (context, index) {
        var transaction = widget.transactionList[index];
        return TransactionRow(transaction: transaction, onPressed: () {});
      },
    );
  }
}
