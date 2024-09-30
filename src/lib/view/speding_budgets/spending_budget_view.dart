import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/custom_arc_180.dart';
import 'package:financialmng/list_builder/item/transaction.dart';
import 'package:financialmng/list_builder/row_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpendingBudgetView extends StatefulWidget {
  const SpendingBudgetView({super.key});

  @override
  State<SpendingBudgetView> createState() => _SpendingBudgetViewState();
}

class _SpendingBudgetViewState extends State<SpendingBudgetView> {
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
                SizedBox(
                  width: media.width * 0.5,
                  height: media.height * 0.25,
                  child: CustomPaint(
                    painter: CustomArc180(width: 10, blurWidth: 6, drwArcs: [
                      ArcValueModel(color: TColor.secondaryG, value: 50),
                      ArcValueModel(color: TColor.secondary50, value: 50),
                      ArcValueModel(color: TColor.primary10, value: 50),
                    ]),
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
            RowBuilder(transactionList: expenseList)
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            //   child: InkWell(
            //     borderRadius: BorderRadius.circular(20),
            //     onTap: () {},
            //     child: DottedBorder(
            //       dashPattern: const [3, 3],
            //       radius: const Radius.circular(20),
            //       borderType: BorderType.RRect,
            //       strokeWidth: 2,
            //       color: TColor.border.withOpacity(0.1),
            //       child: Container(
            //         padding: const EdgeInsets.all(10),
            //         height: 64,
            //         alignment: Alignment.center,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Add new budget",
            //               style: TextStyle(
            //                   color: TColor.white,
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w600),
            //             ),
            //             const SizedBox(
            //               width: 8,
            //             ),
            //             Image.asset(
            //               'assets/img/add.png',
            //               width: 12,
            //               height: 12,
            //               color: TColor.gray30,
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            ,
            const SizedBox(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
