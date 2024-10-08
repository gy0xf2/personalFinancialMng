import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/button/segment_button.dart';
import 'package:financialmng/view/dashboard_view/statistics_view/item/chart_plot.dart';
import 'package:flutter/material.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  bool _isExpense = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'THỐNG KÊ LỊCH SỬ GIAO DỊCH',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _isExpense == true
                      ? 'Thống kê các khoản chi tiêu'
                      : 'Thống kê các khoản thu nhập',
                  style: TextStyle(
                      color: TColor.gray30,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: media.width,
              height: media.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ChartPlot(type: _isExpense),
            )
          ],
        ),
      ),
    );
  }
}
