import 'package:financialmng/list_builder/item/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataProvider extends ChangeNotifier {
  List _expenses = [];
  List _incomes = [];
  bool _isDataLoaded = false;

  List get expenses => _expenses;
  List get incomes => _incomes;

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

  //
  double totalExpense() {
    double sum = 0;
    for (var transaction in _expenses) {
      sum += transaction.amount;
    }
    return sum;
  }

  double totalIncome() {
    double sum = 0;
    for (var transaction in _incomes) {
      sum += transaction.amount;
    }
    return sum;
  }

  int totalTransaction() {
    return _expenses.length + incomes.length;
  }
}
