import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/provider/data_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartPlot extends StatefulWidget {
  final bool type;

  const ChartPlot({super.key, required this.type});

  @override
  State<ChartPlot> createState() => _ChartPlotState();
}

class _ChartPlotState extends State<ChartPlot> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(_chartPlot());
  }

  Map<dynamic, dynamic> _mergeTransaction(type) {
    var res = {};
    for (var transaction in _fetchTransactionsThisWeek(type)) {
      //check whether weekday is exist in map, else: init
      if (!res.containsKey(transaction.date.weekday)) {
        res[transaction.date.weekday] = transaction.amount ?? 0.0;
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

  List<BarChartGroupData> _transactionData() {
    List<BarChartGroupData> res = [];
    Map _transactionMerged = _mergeTransaction(widget.type);
    for (int i = 1; i <= 7; ++i) {
      res.add(_columnData(i, _transactionMerged[i] ?? 0.0));
    }
    return res;
  }

  BarChartGroupData _columnData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          borderRadius: BorderRadius.circular(4),
          toY: y,
          width: 24,
          color: Colors.grey.shade200,
          backDrawRodData: BackgroundBarChartRodData(
              show: true, toY: 1000, color: TColor.gray60))
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
        color: TColor.gray30, fontSize: 9, fontWeight: FontWeight.w600);
    Widget label;
    if ((value > 0) && (value <= 1000)) {
      if (((value ~/ 100) < 10) && (value ~/ 100) & 1 == 0) {
        label = Text(
          '${(value ~/ 100).toInt()}00',
          style: style,
        );
      } else if ((value ~/ 100) == 10) {
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

  DateTime _startOfWeek() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day - now.weekday + 1, 0, 0, 0);
  }

  DateTime _endOfWeek() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day + (7 - now.weekday), 0, 0, 0);
  }

  List _fetchTransactionsThisWeek(type) {
    return (type
            ? Provider.of<DataProvider>(context).expenses
            : Provider.of<DataProvider>(context).incomes)
        .where((transaction) {
      return transaction.date
              .isAfter(_startOfWeek().subtract(const Duration(seconds: 1))) &&
          transaction.date
              .isBefore(_endOfWeek().add(const Duration(seconds: 1)));
    }).toList();
  }
}
