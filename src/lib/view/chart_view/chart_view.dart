import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/segment_button.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartView extends StatefulWidget {
  const ChartView({super.key});

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  bool _isExpense = true;
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'STATISTICS',
                  style: TextStyle(
                      color: TColor.gray30,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                )
              ],
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
          ],
        ),
      ),
    );
  }
}
