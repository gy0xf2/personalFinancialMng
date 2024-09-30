import 'package:financialmng/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class ArcValueModel {
  final Color color;
  final double value;
  ArcValueModel({required this.color, required this.value});
}

class CustomArc180 extends CustomPainter {
  final double start;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final double space;
  final List<ArcValueModel> drwArcs;

  CustomArc180({
    required this.drwArcs,
    this.start = 0,
    this.space = 0.7,
    this.width = 15,
    this.bgWidth = 10,
    this.blurWidth = 6,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray60.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180.0 + start;
    var startDraw = startVal;
    canvas.drawArc(
        rect, radians(startVal), radians(180), false, backgroundPaint);

    for (var drawObject in drwArcs) {
      Paint activePaint = Paint();
      activePaint.color = drawObject.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;
      Paint shadowPaint = Paint()
        ..color = drawObject.color.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      // draw shadow arc
      Path path = Path();
      canvas.drawPath(path, shadowPaint);
      path.addArc(rect, radians(startDraw), radians(drawObject.value - 8));
      canvas.drawArc(rect, radians(startDraw), radians(drawObject.value - 8),
          false, activePaint);

      startDraw += space + drawObject.value;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArc180 oldDelegate) => false;
}
