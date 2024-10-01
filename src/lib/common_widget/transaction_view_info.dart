import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/primary_button.dart';
import 'package:financialmng/common_widget/input_field/date_input_field.dart';
import 'package:financialmng/common_widget/input_field/input_field.dart';
import 'package:financialmng/list_builder/item/transaction_item.dart';
import 'package:financialmng/list_builder/slider_builder.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionViewInfo extends StatefulWidget {
  final TransactionItem transaction;
  const TransactionViewInfo({super.key, required this.transaction});

  @override
  State<TransactionViewInfo> createState() => _TransactionViewInfoState();
}

class _TransactionViewInfoState extends State<TransactionViewInfo> {
  int _currentIndex = -1;
  int _transactionIndex = -1;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    _currentIndex = widget.transaction.type == true
        ? dataProvider.expenseIndexFind(widget.transaction)
        : dataProvider.incomeIndexFind(widget.transaction);
    _transactionIndex = widget.transaction.type == true
        ? dataProvider.expenseItemIndexFind(widget.transaction)
        : dataProvider.incomeItemIndexFind(widget.transaction);

    print(_transactionIndex);
    print(_currentIndex);
  }

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.transaction.amount.toStringAsFixed(2);
    _dateController.text =
        DateFormat('dd/MM/yyyy').format(widget.transaction.date);
    _noteController.text = widget.transaction.note;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.transaction.date,
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
      _currentIndex = index;
    });
  }

  void _saveTransactionInfo() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.modifyTransaction(
        widget.transaction.type,
        _transactionIndex,
        TransactionItem(
            type: true,
            name: dataProvider.expensesType[_currentIndex].name,
            icon: dataProvider.expensesType[_currentIndex].icon,
            amount: double.parse(_amountController.text),
            date: DateFormat('dd/MM/yyyy').parse(_dateController.text),
            color: dataProvider.expensesType[_currentIndex].color,
            note: _noteController.text));
    Navigator.pop(context);
    return;
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color(0xff282833),
                borderRadius: BorderRadius.circular(24)),
            child: Stack(
              children: [
                Column(
                  children: [
                    //display name and icon of transaction
                    Container(
                      height: media.width * 0.7,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: TColor.gray70,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    'assets/img/drop_down.png',
                                    width: 20,
                                    height: 20,
                                    color: TColor.gray30,
                                  )),
                              Text(
                                'TRANSACTION INFO',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: TColor.gray30),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (widget.transaction.type) {
                                      dataProvider
                                          .removeExpense(widget.transaction);
                                      Navigator.pop(context);
                                      return;
                                    }
                                    dataProvider
                                        .removeIncome(widget.transaction);
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    'assets/img/trash.png',
                                    width: 20,
                                    height: 20,
                                    color: TColor.gray30,
                                  )),
                            ],
                          ),
                          SliderBuilder(
                            transactionList: widget.transaction.type == true
                                ? dataProvider.expensesType
                                : dataProvider.incomesType,
                            onIndexChanged: _onIndexChanged,
                            initPage: _currentIndex,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: media.width * 1.2,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          InputField(
                            label: 'Amount',
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            prefixIcon: FontAwesomeIcons.dollarSign,
                            height: 40,
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
                                onPressed: _saveTransactionInfo),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
