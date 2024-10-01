import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/segment_button.dart';
import 'package:financialmng/common_widget/custom_arc_180.dart';
import 'package:financialmng/list_builder/row_builder.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionHistoryView extends StatefulWidget {
  const TransactionHistoryView({super.key});

  @override
  State<TransactionHistoryView> createState() => _TransactionHistoryViewState();
}

class _TransactionHistoryViewState extends State<TransactionHistoryView> {
  bool _isExpense = true;

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'TRANSACTION HISTORY',
                  style: TextStyle(
                      color: TColor.gray30,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: Row(
                children: [
                  Expanded(
                      child: SegmentButton(
                          title: 'Chi tiêu',
                          isActive: _isExpense,
                          onPressed: () {
                            setState(() {
                              _isExpense = !_isExpense;
                            });
                          })),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: SegmentButton(
                          title: 'Thu nhập',
                          isActive: !_isExpense,
                          onPressed: () {
                            setState(() {
                              _isExpense = !_isExpense;
                            });
                          })),
                ],
              ),
            ),
            if (_isExpense)
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: media.width * 0.5,
                        height: media.height * 0.15,
                        child: CustomPaint(
                          painter:
                              CustomArc180(width: 10, blurWidth: 6, drwArcs: [
                            ArcValueModel(color: TColor.secondaryG, value: 62),
                            ArcValueModel(color: TColor.secondary50, value: 62),
                            ArcValueModel(color: TColor.primary10, value: 62),
                          ]),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "${dataProvider.totalExpense()}đ",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "spent this month.",
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RowBuilder(transactionList: dataProvider.expenses),
                  const SizedBox(
                    height: 110,
                  )
                ],
              ),
            if (!_isExpense)
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: media.width * 0.5,
                        height: media.height * 0.15,
                        child: CustomPaint(
                          painter:
                              CustomArc180(width: 10, blurWidth: 6, drwArcs: [
                            ArcValueModel(color: TColor.secondaryG, value: 62),
                            ArcValueModel(color: TColor.secondary50, value: 62),
                            ArcValueModel(color: TColor.primary10, value: 62),
                          ]),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "${dataProvider.totalIncome()}đ",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "achieved this month.",
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RowBuilder(transactionList: dataProvider.incomes),
                  const SizedBox(
                    height: 110,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
