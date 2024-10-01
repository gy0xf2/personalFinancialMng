import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData prefixIcon;
  final double width;
  final double height;
  const InputField(
      {super.key,
      required this.label,
      required this.controller,
      required this.keyboardType,
      required this.prefixIcon,
      this.obscureText = false,
      this.width = double.maxFinite,
      this.height = 58});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12,
                color: TColor.gray50,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: double.maxFinite,
          height: 58,
          decoration: BoxDecoration(
              border: Border.all(
                color: TColor.gray70,
              ),
              borderRadius: BorderRadius.circular(12),
              color: TColor.gray60.withOpacity(0.05)),
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                color: TColor.white, fontSize: 12, fontWeight: FontWeight.w500),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Icon(
                    prefixIcon,
                    color: TColor.gray60,
                  ),
                ),
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        )
      ],
    );
  }
}
