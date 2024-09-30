import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String imageIcon;
  final VoidCallback onPressed;

  const ImageButton(
      {super.key, required this.imageIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: TColor.border.withOpacity(0.15)),
            color: TColor.gray60.withOpacity(0.2),
          ),
          child: Image.asset(imageIcon, width: 50, height: 50, color: TColor.gray70,),),
    );
  }
}
