import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  const SettingRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 16,
            height: 16,
            color: TColor.gray20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14, color: TColor.white, fontWeight: FontWeight.w600),
          ),
          Expanded(
              child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 12,
                color: TColor.gray30,
                fontWeight: FontWeight.w500),
          )),
          const SizedBox(
            width: 8,
          ),
          Image.asset(
            'assets/img/next.png',
            width: 12,
            height: 12,
            color: TColor.gray30,
          )
        ],
      ),
    );
  }
}
