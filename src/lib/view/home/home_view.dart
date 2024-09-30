import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/custom_arc_painter.dart';
import 'package:financialmng/common_widget/segment_button.dart';
import 'package:financialmng/common_widget/status_button.dart';
import 'package:financialmng/list_builder/item/transaction.dart';
import 'package:financialmng/list_builder/row_builder.dart';
import 'package:financialmng/view/speding_budgets/spending_budget_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  //functions
  double _totalAmount() {
    double sum = 0;
    for (var transaction in expenseList) {
      sum += transaction.amount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/img/home_bg.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: media.width * 0.1),
                    width: media.width * 0.7,
                    height: media.width * 0.7,
                    child: CustomPaint(
                      painter: CustomArcPainter(end: 220, blurWidth: 6),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/img/phenikaa.png',
                        width: media.width * 0.2,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${_totalAmount().toString()}đ',
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'This month bills',
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: StatusButton(
                                    title: 'Active subs',
                                    value: '12',
                                    statusColor: TColor.secondary,
                                    onPressed: () {})),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                                    title: 'Highest subs',
                                    value: '\$6.99',
                                    statusColor: TColor.primary10,
                                    onPressed: () {})),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                                    title: 'Lowest sub',
                                    value: '\$5.99',
                                    statusColor: TColor.secondaryG,
                                    onPressed: () {})),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
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
            if (_isExpense) RowBuilder(transactionList: expenseList),
            const SizedBox(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
