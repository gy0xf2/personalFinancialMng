import 'package:financialmng/transaction/item/transaction_item.dart';
import 'package:financialmng/transaction/item/transaction_type.dart';
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
      await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
      _expenses = [
        TransactionItem(
            name: "Food",
            type: true,
            icon: FontAwesomeIcons.burger,
            color: Colors.orange.shade500,
            date: DateTime.now(),
            amount: 2),
        TransactionItem(
            name: "Shopping",
            type: true,
            icon: FontAwesomeIcons.cartShopping,
            color: Colors.greenAccent,
            date: DateTime.now(),
            amount: 2),
        TransactionItem(
            name: "Travel",
            type: true,
            icon: FontAwesomeIcons.plane,
            color: Colors.blue[300],
            date: DateTime.now(),
            amount: 2),
        TransactionItem(
            name: "Medical",
            type: true,
            icon: FontAwesomeIcons.heartPulse,
            color: Colors.pink[300],
            date: DateTime.now(),
            amount: 2)
      ];
      _incomes = [
        TransactionItem(
            name: "Achievement",
            type: false,
            icon: FontAwesomeIcons.medal,
            color: Colors.orange[500],
            date: DateTime.now(),
            amount: 2),
        TransactionItem(
            name: "Salary",
            type: false,
            icon: FontAwesomeIcons.coins,
            color: Colors.greenAccent,
            date: DateTime.now(),
            amount: 2),
        TransactionItem(
            name: "Sales",
            type: false,
            icon: FontAwesomeIcons.salesforce,
            color: Colors.blue[300],
            date: DateTime.now(),
            amount: 2),
        TransactionItem(
            name: "Gift",
            type: false,
            icon: FontAwesomeIcons.gift,
            color: Colors.pink[300],
            date: DateTime.now(),
            amount: 2)
      ];

      _expenseType = [
        TransactionType(
          name: "Thực phẩm",
          icon: FontAwesomeIcons.burger,
          color: Colors.orange.shade500,
        ),
        TransactionType(
          name: "Mua sắm",
          icon: FontAwesomeIcons.cartShopping,
          color: Colors.greenAccent,
        ),
        TransactionType(
          name: "Giải trí",
          icon: FontAwesomeIcons.gamepad,
          color: Colors.blueGrey,
        ),
        TransactionType(
          name: "Xăng dầu",
          icon: FontAwesomeIcons.gasPump,
          color: Colors.pink[200],
        ),
        TransactionType(
          name: "Đi lại",
          icon: FontAwesomeIcons.plane,
          color: Colors.blue[300],
        ),
        TransactionType(
          name: "Y tế",
          icon: FontAwesomeIcons.heartPulse,
          color: Colors.pink[300],
        ),
        TransactionType(
          name: "Khoản khác",
          icon: CupertinoIcons.ellipsis_circle_fill,
          color: Colors.grey,
        )
      ];
      _incomeType = [
        TransactionType(
          name: "Giải thưởng",
          icon: FontAwesomeIcons.medal,
          color: Colors.orange[500],
        ),
        TransactionType(
          name: "Lương",
          icon: FontAwesomeIcons.coins,
          color: Colors.greenAccent,
        ),
        TransactionType(
          name: "Buôn bán",
          icon: FontAwesomeIcons.salesforce,
          color: Colors.blue[300],
        ),
        TransactionType(
          name: "Quà tặng",
          icon: FontAwesomeIcons.gift,
          color: Colors.pink[300],
        ),
        TransactionType(
          name: "Khoản khác",
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

  DateTime startOfWeek() {
    int currentWeekday = DateTime.now().weekday; //obtain current weekday
    return DateTime.now().subtract(
        Duration(days: currentWeekday - 1)); //range between n and 1 is (n - 1)
  }

  DateTime endOfWeek() {
    int currentWeekday = DateTime.now().weekday;
    return DateTime.now().add(Duration(
        days: 7 - currentWeekday)); //range between x and n is n - x (x <= n)
  }

  List fetchTransactionsThisWeek(type) {
    return (type ? _expenses : _incomes).where((transaction) {
      return transaction.date
              .isAfter(startOfWeek().subtract(const Duration(seconds: 1))) &&
          transaction.date
              .isBefore(endOfWeek().add(const Duration(seconds: 1)));
    }).toList();
  }
}
