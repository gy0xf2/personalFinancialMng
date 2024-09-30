// ignore_for_file: unused_field

import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/date_input_field.dart';
import 'package:financialmng/common_widget/input_field.dart';
import 'package:financialmng/common_widget/primary_button.dart';
import 'package:financialmng/common_widget/segment_button.dart';
import 'package:financialmng/list_builder/item/transaction.dart';
import 'package:financialmng/list_builder/slider_builder.dart';
import 'package:financialmng/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
    Transaction(
        name: "Food",
        icon: FontAwesomeIcons.burger,
        color: Colors.orange.shade500,
        date: DateTime.now(),
        amount: 2.55),
    Transaction(
        name: "Shopping",
        icon: FontAwesomeIcons.cartShopping,
        color: Colors.greenAccent,
        date: DateTime.now(),
        amount: 2.55),
    Transaction(
        name: "Travel",
        icon: FontAwesomeIcons.plane,
        color: Colors.blue[300],
        date: DateTime.now(),
        amount: 2.55),
    Transaction(
        name: "Medical",
        icon: FontAwesomeIcons.heartPulse,
        color: Colors.pink[300],
        date: DateTime.now(),
        amount: 2.55)
  ];
  List incomeList = [
    Transaction(
        name: "Achievement",
        icon: FontAwesomeIcons.medal,
        color: Colors.orange[500],
        date: DateTime.now(),
        amount: 2.55),
    Transaction(
        name: "Salary",
        icon: FontAwesomeIcons.coins,
        color: Colors.greenAccent,
        date: DateTime.now(),
        amount: 2.55),
    Transaction(
        name: "Sales",
        icon: FontAwesomeIcons.salesforce,
        color: Colors.blue[300],
        date: DateTime.now(),
        amount: 2.55),
    Transaction(
        name: "Gift",
        icon: FontAwesomeIcons.gift,
        color: Colors.pink[300],
        date: DateTime.now(),
        amount: 2.55)
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

  void _addTransaction() {
    // var transactionType = 'Expense';
    // var icon = expenseList[_currentExpenseIndex].icon;
    // var name = expenseList[_currentExpenseIndex].name;
    // var color = expenseList[_currentExpenseIndex].color;
    // if (!_isExpense) {
    //   transactionType = 'Income';
    //   icon = incomeList[_currentIncomeIndex].icon;
    //   name = expenseList[_currentIncomeIndex].name;
    //   color = expenseList[_currentIncomeIndex].color;
    // }
  }

  @override
  void initState() {
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                              title: 'Add',
                              onPressed: () {
                                _addTransaction();
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
