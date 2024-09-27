import 'package:dotted_border/dotted_border.dart';
import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/budget_row.dart';
import 'package:financialmng/common_widget/custom_arc_180.dart';
import 'package:financialmng/common_widget/custom_arc_painter.dart';
import 'package:financialmng/common_widget/segment_button.dart';
import 'package:financialmng/common_widget/status_button.dart';
import 'package:financialmng/common_widget/subscription_home_row.dart';
import 'package:financialmng/common_widget/upcoming_bill.dart';
import 'package:flutter/material.dart';

class SpendingBudgetView extends StatefulWidget {
  const SpendingBudgetView({super.key});

  @override
  State<SpendingBudgetView> createState() => _SpendingBudgetViewState();
}

class _SpendingBudgetViewState extends State<SpendingBudgetView> {
  List budgetArr = [
    {
      "name": "Auto & Transport",
      "icon": "assets/img/auto_&_transport.png",
      "spend_amount": "25.99",
      "total_budget": "400",
      "left_amount": "250.01",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spend_amount": "50.99",
      "total_budget": "600",
      "left_amount": "300.01",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/img/security.png",
      "spend_amount": "5.99",
      "total_budget": "600",
      "left_amount": "250.01",
      "color": TColor.primary10
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: media.width * 0.5,
                  height: media.height * 0.25,
                  child: CustomPaint(
                    painter: CustomArc180(end: 50, width: 12, bgWidth: 8),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$52.25",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "of \$2,300 budget",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgetArr.length,
              itemBuilder: (context, index) {
                var budObject = budgetArr[index] as Map? ?? {};
                return BudgetRow(budObject: budObject, onPressed: () {});
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [3, 3],
                  radius: const Radius.circular(20),
                  borderType: BorderType.RRect,
                  strokeWidth: 2,
                  color: TColor.border.withOpacity(0.1),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 64,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new budget",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          'assets/img/add.png',
                          width: 12,
                          height: 12,
                          color: TColor.gray30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
