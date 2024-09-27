import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubscriptionHomeRow extends StatelessWidget {
  final Map subObject;
  final VoidCallback onPressed;

  const SubscriptionHomeRow(
      {super.key, required this.subObject, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
          ),
          child: Row(
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
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  subObject['name'],
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "${subObject['price']}đ",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
