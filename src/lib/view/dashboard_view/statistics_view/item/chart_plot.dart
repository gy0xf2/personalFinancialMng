import 'dart:math';

import 'package:financialmng/common/color_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPlot extends StatefulWidget {
  final List transactionList;
  final bool type;

  const ChartPlot(
      {super.key, required this.type, required this.transactionList});

  @override
  State<ChartPlot> createState() => _ChartPlotState();
}

class _ChartPlotState extends State<ChartPlot> {
  Map<dynamic, dynamic> _transactionMerged = {};

  @override
  void initState() {
    super.initState();
    _transactionMerged = _mergeTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(_chartPlot());
  }

  Map<dynamic, dynamic> _mergeTransaction() {
    var res = {};
    for (var transaction in widget.transactionList) {
      //check whether weekday is exist in map, else: init
      if (!res.containsKey(transaction.date.weekday)) {
        res[transaction.date.weekday] = transaction.amount;
        continue;
      }
      res[transaction.date.weekday] += transaction.amount;
    }
    return res;
  }

  BarChartData _chartPlot() {
    return BarChartData(
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        barGroups: _transactionData(),
        titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: _getLeftTitle,
            )),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: _getBottomTitles))));
  }

  List<BarChartGroupData> _transactionData() => List.generate(7, (index) {
        return _columnData(index + 1, _transactionMerged[index + 1] ?? 0.0);
      });

  BarChartGroupData _columnData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          toY: y,
          width: 24,
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ], transform: const GradientRotation(pi / 4)),
          backDrawRodData: BackgroundBarChartRodData(
              show: true, toY: 10, color: TColor.gray60))
    ]);
  }

  Widget _getBottomTitles(double value, TitleMeta meta) {
    var style = TextStyle(
        color: TColor.gray30, fontSize: 12, fontWeight: FontWeight.w600);
    Widget label;
    switch (value) {
      case 1:
        label = Text(
          'T2',
          style: style,
        );
        break;
      case 2:
        label = Text(
          'T3',
          style: style,
        );
        break;
      case 3:
        label = Text(
          'T4',
          style: style,
        );
        break;
      case 4:
        label = Text(
          'T5',
          style: style,
        );
        break;
      case 5:
        label = Text(
          'T6',
          style: style,
        );
        break;
      case 6:
        label = Text(
          'T7',
          style: style,
        );
        break;
      case 7:
        label = Text(
          'CN',
          style: style,
        );
        break;
      default:
        label = Text(
          '',
          style: style,
        );
        break;
    }
    return label;
  }

  Widget _getLeftTitle(double value, TitleMeta meta) {
    var style = TextStyle(
        color: TColor.gray30, fontSize: 11, fontWeight: FontWeight.w600);
    Widget label;
    if (value > 0 && value <= 10) {
      if ((value ~/ 1 < 10) && (value ~/ 1) & 1 == 0) {
        label = Text(
          '${(value ~/ 1).toInt()}00',
          style: style,
        );
      } else if (value ~/ 1 == 10) {
        label = Text(
          '1M',
          style: style,
        );
      } else {
        label = const Text('');
      }
    } else {
      label = const Text('');
    }
    return label;
  }
}
