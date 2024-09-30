import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class SubscriptionCell extends StatelessWidget {
  final Map subObject;
  final VoidCallback onPressed;

  const SubscriptionCell(
      {super.key, required this.subObject, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: TColor.gray60.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: TColor.border.withOpacity(0.15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //       color: TColor.gray50,
            //       borderRadius: BorderRadius.circular(10)),
            //   alignment: Alignment.center,
            //   width: 40,
            //   height: 40,
            //   child: FaIcon(
            //     FontAwesomeIcons.burger,
            //     color: TColor.white,
            //   ),
            // ),
            Image.asset(
              subObject['icon'],
              width: 40,
              height: 40,
            ),
            const Spacer(),
            Text(
              subObject['name'],
              style: TextStyle(
                  color: TColor.white.withOpacity(0.9),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${subObject['price']}đ",
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
