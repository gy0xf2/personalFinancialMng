import 'dart:math';

import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/segment_button.dart';
import 'package:financialmng/list_builder/row_builder.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Container(
                //style for the credit card
                width: media.width,
                height: media.width / 2,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ], transform: const GradientRotation(pi / 4)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: TColor.gray10.withOpacity(0.3),
                          offset: const Offset(5, 5))
                    ]),
                //elements inside credit card
                child: Column(
                  //this column contain balance, income, expense
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //elements inside the card
                    Text(
                      'Tháng ${DateTime.now().month}',
                      style: TextStyle(
                          fontSize: 20,
                          color: TColor.white,
                          fontWeight: FontWeight.bold),
                    ),
                    //space between balance label and balance amount
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${dataProvider.totalTransaction()} giao dịch',
                      style: TextStyle(
                          fontSize: 14,
                          color: TColor.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      //element contains income and expense informations
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      child: Row(
                        //a row to contain income and expense
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white10),
                                child: const Center(
                                  child: Icon(
                                    CupertinoIcons.arrow_down,
                                    size: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Thu nhập',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: TColor.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '${dataProvider.totalIncome()}đ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: TColor.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white10),
                                child: const Center(
                                  child: Icon(
                                    CupertinoIcons.arrow_up,
                                    size: 14,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chi tiêu',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: TColor.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '${dataProvider.totalExpense()}đ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: TColor.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
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
            if (_isExpense) RowBuilder(transactionList: dataProvider.expenses),
            if (!_isExpense) RowBuilder(transactionList: dataProvider.incomes),
            const SizedBox(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
