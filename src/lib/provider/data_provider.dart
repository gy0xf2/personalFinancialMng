// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financialmng/message/notification_message.dart';
import 'package:financialmng/transaction/item/transaction_item.dart';
import 'package:financialmng/transaction/item/transaction_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataProvider extends ChangeNotifier {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  List _expenses = [];
  List _incomes = [];
  final List _expenseType = [
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
  final List _incomeType = [
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
  List get expenses => _expenses;
  List get expensesType => _expenseType;
  List get incomes => _incomes;
  List get incomesType => _incomeType;

  Future<void> removeExpense(expense, context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc(currentUser?.uid)
          .collection('expenses')
          .doc(expense.id)
          .delete();
      NotificationMessage.showNotificationMessage(context,
          'Thêm giao dịch thành công!', Colors.green[400], Icons.check_circle);
    } catch (e) {
      print('some err');
    }
  }

  Future<void> removeIncome(income, context) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc(currentUser?.uid)
          .collection('incomes')
          .doc(income.id)
          .delete();
      NotificationMessage.showNotificationMessage(
          context, 'Thêm thành công', Colors.green[400], Icons.check_circle);
    } catch (e) {
      NotificationMessage.showNotificationMessage(
          context, 'Có lỗi xảy ra!', Colors.red[700], Icons.error);
    }
  }

  Future<void> modifyTransaction(type, index, transaction, context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc(currentUser?.uid)
          .collection(type ? 'expenses' : 'incomes')
          .doc(transaction.id)
          .update(transaction.toJson());
      NotificationMessage.showNotificationMessage(
          context, 'Thêm thành công', Colors.green[400], Icons.check_circle);
    } catch (e) {
      NotificationMessage.showNotificationMessage(
          context, 'Có lỗi xảy ra!', Colors.red[700], Icons.error);
    }
  }

  DataProvider() {
    // Lắng nghe stream Firestore và cập nhật dữ liệu
    _listenToExpensesStream();
    _listenToIncomesStream();
  }

  void _listenToExpensesStream() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('expenses')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      _expenses = snapshot.docs.map((doc) {
        return TransactionItem.fromMap(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      notifyListeners(); // Gọi notify để cập nhật UI
    });
  }

  void _listenToIncomesStream() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('incomes')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      _incomes = snapshot.docs.map((doc) {
        return TransactionItem.fromMap(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      notifyListeners(); // Gọi notify để cập nhật UI
    });
  }

  // Các hàm khác như thêm/sửa/xóa có thể giữ nguyên
  void addExpense(TransactionItem expense, context) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('expenses')
          .add(expense.toJson());
      NotificationMessage.showNotificationMessage(
          context, 'Thêm thành công', Colors.green[400], Icons.check_circle);
    } catch (e) {
      NotificationMessage.showNotificationMessage(
          context, 'Có lỗi xảy ra!', Colors.red[700], Icons.error);
    }
  }
  // Không cần gọi notifyListeners ở đây vì Firestore sẽ cập nhật qua stream

  void addIncome(TransactionItem income, context) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('expenses')
          .add(income.toJson());
      NotificationMessage.showNotificationMessage(
          context, 'Thêm thành công', Colors.green[400], Icons.check_circle);
    } catch (e) {
      NotificationMessage.showNotificationMessage(
          context, 'Có lỗi xảy ra!', Colors.red[700], Icons.error);
    }
  }
  // Không cần gọi notifyListeners ở đây vì Firestore sẽ cập nhật qua stream

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

  Stream<List<TransactionItem>> getExpensesStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('expenses')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return TransactionItem.fromMap(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Lấy stream từ Firestore cho danh sách incomes
  Stream<List<TransactionItem>> getIncomesStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('incomes')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return TransactionItem.fromMap(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
