import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  const PrimaryButton(
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
            boxShadow: [
              BoxShadow(
                  color: TColor.secondary.withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 7))
            ],
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/primary_btn.png'))),
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
