import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  const SecondaryButton(
      {super.key,
      required this.title,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/secodry_btn.png'))),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize, color: TColor.white, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
