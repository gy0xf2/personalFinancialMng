import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger, color: Colors.white),
    'color': Colors.yellow[700],
    'name': 'Đồ ăn',
    'totalAmount': 'đ -45.000',
    'date': 'Hôm nay'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping, color: Colors.white),
    'color': Colors.purple[800],
    'name': 'Mua sắm',
    'totalAmount': 'đ -200.000',
    'date': 'Hôm nay'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane, color: Colors.white),
    'color': Colors.blue[400],
    'name': 'Du lịch',
    'totalAmount': 'đ -500.000',
    'date': 'Tuần trước'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.heartCircleBolt, color: Colors.white),
    'color': Colors.red[500],
    'name': 'Sức khỏe',
    'totalAmount': 'đ -500.000',
    'date': 'Hôm qua'
  }
];
