import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData prefixIcon;
  final VoidCallback onTap;
  const DateInputField(
      {super.key,
      required this.label,
      required this.controller,
      required this.prefixIcon,
      required this.onTap,
      this.obscureText = false});
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
            onTap: onTap,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                color: TColor.white, fontSize: 12, fontWeight: FontWeight.w500),
            controller: controller,
            readOnly: true,
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
