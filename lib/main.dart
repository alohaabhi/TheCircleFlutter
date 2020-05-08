import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(CircleApp());
}

class CircleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CircleHomePage(),
    );
  }
}

class CircleHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Center(child: Circle()));
  }
}

class Circle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleState();
  }
}

class CircleState extends State {
  Color color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawCircle(getRandomColor(), 80.0),
    );
  }
}

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
    canvas.drawCircle(Offset(0.0, 0.0), radius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
