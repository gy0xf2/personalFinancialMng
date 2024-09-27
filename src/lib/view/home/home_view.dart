import 'package:financialmng/common/color_extension.dart';
import 'package:financialmng/common_widget/custom_arc_painter.dart';
import 'package:financialmng/common_widget/segment_button.dart';
import 'package:financialmng/common_widget/status_button.dart';
import 'package:financialmng/common_widget/subscription_home_row.dart';
import 'package:financialmng/common_widget/upcoming_bill.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.99"},
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99"
    },
    {"name": "NetFlix", "icon": "assets/img/netflix_logo.png", "price": "15.00"}
  ];

  List bilArr = [
    {"name": "Spotify", "date": DateTime(2023, 07, 25), "price": "5.99"},
    {
      "name": "YouTube Premium",
      "date": DateTime(2023, 07, 25),
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2023, 07, 25),
      "price": "29.99"
    },
    {"name": "NetFlix", "date": DateTime(2023, 07, 25), "price": "15.00"}
  ];

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
                      painter: CustomArcPainter(end: 220),
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
                        '\$1,8386',
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: TColor.border.withOpacity(0.15)),
                            color: TColor.gray60.withOpacity(0.3),
                          ),
                          child: Text(
                            'See your budget',
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
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
                          title: 'Hóa đơn hàng tháng',
                          isActive: isSubscription,
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          })),
                  Expanded(
                      child: SegmentButton(
                          title: 'Hóa đơn sắp tới',
                          isActive: !isSubscription,
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          })),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
                itemBuilder: (context, index) {
                  var subObject = subArr[index] as Map? ?? {};
                  return SubscriptionHomeRow(
                      subObject: subObject, onPressed: () {});
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
                itemBuilder: (context, index) {
                  var subObject = bilArr[index] as Map? ?? {};
                  return UpComingBillRow(
                      subObject: subObject, onPressed: () {});
                },
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
