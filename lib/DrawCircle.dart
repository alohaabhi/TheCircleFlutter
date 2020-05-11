import 'package:flutter/material.dart';

class DrawCircle extends CustomPainter {
  Paint circlePaint;
  final radius;
  DrawCircle(Color color, this.radius) {
    this.circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(radius, radius), radius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}