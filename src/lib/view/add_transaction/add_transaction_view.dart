// ignore_for_file: unused_field

import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/input_field/date_input_field.dart';
import 'package:financialmng/common_widget/input_field/input_field.dart';
import 'package:financialmng/common_widget/button/primary_button.dart';
import 'package:financialmng/common_widget/button/segment_button.dart';
import 'package:financialmng/list_builder/item/transaction_item.dart';
import 'package:financialmng/list_builder/item/transaction_type.dart';
import 'package:financialmng/list_builder/slider_builder.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:financialmng/view/main_tab/main_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTransactionView extends StatefulWidget {
  const AddTransactionView({super.key});

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  int _currentExpenseIndex = 0;
  int _currentIncomeIndex = 0;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool _isExpense = true;
  List expenseList = [
    TransactionType(
      name: "Food",
      icon: FontAwesomeIcons.burger,
      color: Colors.orange.shade500,
    ),
    TransactionType(
      name: "Shopping",
      icon: FontAwesomeIcons.cartShopping,
      color: Colors.greenAccent,
    ),
    TransactionType(
      name: "Entertainment",
      icon: FontAwesomeIcons.gamepad,
      color: Colors.blueGrey,
    ),
    TransactionType(
      name: "Petrol",
      icon: FontAwesomeIcons.gasPump,
      color: Colors.pink[200],
    ),
    TransactionType(
      name: "Travel",
      icon: FontAwesomeIcons.plane,
      color: Colors.blue[300],
    ),
    TransactionType(
      name: "Medical",
      icon: FontAwesomeIcons.heartPulse,
      color: Colors.pink[300],
    ),
    TransactionType(
      name: "Others",
      icon: CupertinoIcons.ellipsis_circle_fill,
      color: Colors.grey,
    )
  ];
  List incomeList = [
    TransactionType(
      name: "Achievement",
      icon: FontAwesomeIcons.medal,
      color: Colors.orange[500],
    ),
    TransactionType(
      name: "Salary",
      icon: FontAwesomeIcons.coins,
      color: Colors.greenAccent,
    ),
    TransactionType(
      name: "Sales",
      icon: FontAwesomeIcons.salesforce,
      color: Colors.blue[300],
    ),
    TransactionType(
      name: "Gift",
      icon: FontAwesomeIcons.gift,
      color: Colors.pink[300],
    ),
    TransactionType(
      name: "Others",
      icon: CupertinoIcons.ellipsis_circle_fill,
      color: Colors.grey,
    )
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void _onIndexChanged(int index) {
    setState(() {
      if (_isExpense) {
        _currentExpenseIndex = index;
        return;
      }
      _currentIncomeIndex = index;
    });
  }

  @override
  void initState() {
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //label add new transaction and back button
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainTabView()));
                                },
                                icon: Image.asset(
                                  'assets/img/back.png',
                                  width: 20,
                                  height: 20,
                                  color: TColor.gray30,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'ADD NEW TRANSACTION',
                              style:
                                  TextStyle(fontSize: 13, color: TColor.gray10),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // segment buttons split expense and income
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
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
                      SliderBuilder(
                        transactionList: expenseList,
                        onIndexChanged: _onIndexChanged,
                      ),
                    if (!_isExpense)
                      SliderBuilder(
                        transactionList: incomeList,
                        onIndexChanged: _onIndexChanged,
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Column(children: [
                        InputField(
                          label: 'Amount',
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          prefixIcon: FontAwesomeIcons.dollarSign,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DateInputField(
                          label: 'Date',
                          controller: _dateController,
                          onTap: () => _selectDate(context),
                          prefixIcon: FontAwesomeIcons.clock,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputField(
                          label: 'Note',
                          controller: _noteController,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          prefixIcon: FontAwesomeIcons.noteSticky,
                        ),
                        //password checking progress
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: PrimaryButton(
                              title: 'Save transaction info',
                              onPressed: () {
                                if (_isExpense) {
                                  dataProvider.addExpense(TransactionItem(
                                      type: true,
                                      name: expenseList[_currentExpenseIndex]
                                          .name,
                                      icon: expenseList[_currentExpenseIndex]
                                          .icon,
                                      amount:
                                          double.parse(_amountController.text),
                                      date: DateFormat('dd/MM/yyyy')
                                          .parse(_dateController.text),
                                      color: expenseList[_currentExpenseIndex]
                                          .color,
                                      note: _noteController.text));
                                  return;
                                }
                                dataProvider.addIncome(TransactionItem(
                                    type: false,
                                    name: incomeList[_currentIncomeIndex].name,
                                    icon: incomeList[_currentIncomeIndex].icon,
                                    amount:
                                        double.parse(_amountController.text),
                                    date: DateFormat('dd/MM/yyyy')
                                        .parse(_dateController.text),
                                    color:
                                        incomeList[_currentIncomeIndex].color,
                                    note: _noteController.text));
                              }),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
