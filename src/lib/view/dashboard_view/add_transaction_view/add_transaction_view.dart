// ignore_for_file: unused_field

import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/input_field/date_input_field.dart';
import 'package:financialmng/common_widget/input_field/input_field.dart';
import 'package:financialmng/common_widget/button/primary_button.dart';
import 'package:financialmng/common_widget/button/segment_button.dart';
import 'package:financialmng/transaction/item/transaction_item.dart';
import 'package:financialmng/list_builder/slider_builder.dart';
import 'package:financialmng/message/notification_message.dart';
import 'package:financialmng/provider/data_provider.dart';
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
  //variables
  int _currentExpenseIndex = 0;
  int _currentIncomeIndex = 0;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isExpense = true;

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

  void _saveTransaction() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);

    if (_isExpense) {
      dataProvider.addExpense(TransactionItem(
          type: true,
          name: dataProvider.expensesType[_currentExpenseIndex].name,
          icon: dataProvider.expensesType[_currentExpenseIndex].icon,
          amount: int.parse(_amountController.text),
          date: DateFormat('dd/MM/yyyy').parse(_dateController.text),
          color: dataProvider.expensesType[_currentExpenseIndex].color,
          note: _noteController.text));
      NotificationMessage.showNotificationMessage(
          context, 'Thêm thành công', Colors.green[400], Icons.check_circle);
      Navigator.pop(context);
      return;
    }
    dataProvider.addIncome(TransactionItem(
        type: false,
        name: dataProvider.incomesType[_currentIncomeIndex].name,
        icon: dataProvider.incomesType[_currentIncomeIndex].icon,
        amount: int.parse(_amountController.text),
        date: DateFormat('dd/MM/yyyy').parse(_dateController.text),
        color: dataProvider.incomesType[_currentIncomeIndex].color,
        note: _noteController.text));
    Navigator.pop(context);
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
                                  Navigator.pop(context);
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
                              'THÊM GIAO DỊCH MỚI',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: TColor.gray30,
                                  fontWeight: FontWeight.w600),
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
                        transactionList: dataProvider.expensesType,
                        onIndexChanged: _onIndexChanged,
                      ),
                    if (!_isExpense)
                      SliderBuilder(
                        transactionList: dataProvider.incomesType,
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
                              title: 'Thêm giao dịch',
                              onPressed: _saveTransaction),
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
