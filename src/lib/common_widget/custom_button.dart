import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final Color shadowColor;
  final String assetsPath;
  const CustomButton({
    super.key,
    required this.title,
    required this.assetsPath,
    required this.shadowColor,
    required this.onPressed,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 7))
            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(assetsPath))),
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
