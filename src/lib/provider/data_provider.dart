import 'package:financialmng/list_builder/item/transaction_item.dart';
import 'package:financialmng/list_builder/item/transaction_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataProvider extends ChangeNotifier {
  List _expenses = [];
  List _incomes = [];
  List _expenseType = [];
  List _incomeType = [];
  bool _isDataLoaded = false;

  List get expenses => _expenses;
  List get expensesType => _expenseType;
  List get incomes => _incomes;
  List get incomesType => _incomeType;

  // Load data once
  Future<void> loadData() async {
    if (!_isDataLoaded) {
      // Simulate fetching data from a database or API
      await Future.delayed(const Duration(seconds: 2)); // Simulate a delay
      _expenses = [
        TransactionItem(
            name: "Food",
            type: true,
            icon: FontAwesomeIcons.burger,
            color: Colors.orange.shade500,
            date: DateTime.now(),
            amount: 2.55),
        TransactionItem(
            name: "Shopping",
            type: true,
            icon: FontAwesomeIcons.cartShopping,
            color: Colors.greenAccent,
            date: DateTime.now(),
            amount: 2.55),
        TransactionItem(
            name: "Travel",
            type: true,
            icon: FontAwesomeIcons.plane,
            color: Colors.blue[300],
            date: DateTime.now(),
            amount: 2.55),
        TransactionItem(
            name: "Medical",
            type: true,
            icon: FontAwesomeIcons.heartPulse,
            color: Colors.pink[300],
            date: DateTime.now(),
            amount: 2.55)
      ];
      _incomes = [
        TransactionItem(
            name: "Achievement",
            type: false,
            icon: FontAwesomeIcons.medal,
            color: Colors.orange[500],
            date: DateTime.now(),
            amount: 2.55),
        TransactionItem(
            name: "Salary",
            type: false,
            icon: FontAwesomeIcons.coins,
            color: Colors.greenAccent,
            date: DateTime.now(),
            amount: 2.55),
        TransactionItem(
            name: "Sales",
            type: false,
            icon: FontAwesomeIcons.salesforce,
            color: Colors.blue[300],
            date: DateTime.now(),
            amount: 2.55),
        TransactionItem(
            name: "Gift",
            type: false,
            icon: FontAwesomeIcons.gift,
            color: Colors.pink[300],
            date: DateTime.now(),
            amount: 2.55)
      ];

      _expenseType = [
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
      _incomeType = [
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
      _isDataLoaded = true;
      notifyListeners();
    }
  }

  // Add more functions for managing expenses (e.g., add, remove, edit)
  void addExpense(expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void addIncome(income) {
    _incomes.add(income);
    notifyListeners();
  }

  void removeExpense(expense) {
    _expenses.remove(expense);
    notifyListeners();
  }

  void removeIncome(income) {
    _incomes.remove(income);
    notifyListeners();
  }

  void modifyTransaction(type, index, transaction) {
    if (type) {
      _expenses[index] = transaction;
      notifyListeners();
      return;
    }
    _incomes[index] = transaction;
    notifyListeners();
  }

  //
  double totalExpense() {
    double sum = 0;
    for (var transaction in _expenses) {
      sum += transaction.amount;
    }
    return sum.roundToDouble();
  }

  double totalIncome() {
    double sum = 0;
    for (var transaction in _incomes) {
      sum += transaction.amount;
    }
    return sum.roundToDouble();
  }

  int totalTransaction() {
    return _expenses.length + incomes.length;
  }

  int expenseIndexFind(expense) {
    return _expenseType
        .indexWhere((transaction) => transaction.name == expense.name);
  }

  int expenseItemIndexFind(expense) {
    return _expenses
        .indexWhere((transaction) => transaction.name == expense.name);
  }

  int incomeIndexFind(income) {
    return _incomeType
        .indexWhere((transaction) => transaction.name == income.name);
  }

  int incomeItemIndexFind(income) {
    return _incomes
        .indexWhere((transaction) => transaction.name == income.name);
  }
}
