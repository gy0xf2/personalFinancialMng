import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';

class NotificationMessage {
  static void showNotificationMessage(
      BuildContext context, String msg, Color? color, IconData icon) {
    final SnackBar noti = SnackBar(
      content: Container(
        padding: const EdgeInsets.all(12),
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: TColor.white,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(msg,
                style: TextStyle(
                    fontSize: 12,
                    color: TColor.white,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 3,
    );

    ScaffoldMessenger.of(context).showSnackBar(noti);
  }
}
