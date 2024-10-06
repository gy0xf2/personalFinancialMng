import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/view/dashboard_view/add_transaction_view/add_transaction_view.dart';
import 'package:financialmng/view/dashboard_view/statistics_view/statistics_view.dart';
import 'package:financialmng/view/dashboard_view/home/home_view.dart';
import 'package:financialmng/view/dashboard_view/transaction_history_view/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget _currentTabView = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: _currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/img/bottom_bar_bg.png'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedTab = 0;
                                      _currentTabView = const HomeView();
                                    });
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.house,
                                    size: 20,
                                    color: _selectedTab == 0
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedTab = 1;
                                      _currentTabView =
                                          const TransactionHistoryView();
                                    });
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.list,
                                    size: 20,
                                    color: _selectedTab == 1
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                              const SizedBox(
                                width: 50,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedTab = 2;
                                      _currentTabView = const StatisticsView();
                                    });
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.chartColumn,
                                    size: 20,
                                    color: _selectedTab == 2
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedTab = 3;
                                      _currentTabView = Container();
                                    });
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.gear,
                                    size: 20,
                                    color: _selectedTab == 3
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddTransactionView()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: TColor.secondary.withOpacity(0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 4))
                          ], borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            'assets/img/center_btn.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
