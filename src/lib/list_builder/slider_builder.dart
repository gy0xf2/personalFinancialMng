import 'package:carousel_slider/carousel_slider.dart';
import 'package:financialmng/transaction/item/transaction_option.dart';
import 'package:flutter/material.dart';

class SliderBuilder extends StatefulWidget {
  final List transactionList;
  final Function(int) onIndexChanged;
  final int initPage;
  const SliderBuilder(
      {super.key,
      required this.transactionList,
      required this.onIndexChanged,
      this.initPage = 0});

  @override
  State<SliderBuilder> createState() => _SliderBuilderState();
}

class _SliderBuilderState extends State<SliderBuilder> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SizedBox(
        width: media.width,
        height: media.width * 0.4,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            initialPage: widget.initPage,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                widget.onIndexChanged(_currentIndex);
              });
            },
            aspectRatio: 1,
            enableInfiniteScroll: true,
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.5,
            enlargeFactor: 0.5,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
          itemCount: widget.transactionList.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            var transaction = widget.transactionList[index];

            return TransactionOption(transaction: transaction);
          },
        ));
  }
}
