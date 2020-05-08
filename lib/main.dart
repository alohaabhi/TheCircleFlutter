import 'package:flutter/material.dart';

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
    return Center(child: Circle());
  }
}

class Circle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleState();
  }
}

class CircleState extends State {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawCircle(context, 80.0),
    );
  }
}

class DrawCircle extends CustomPainter {
  Paint circlePaint;
  final radius;
  DrawCircle(BuildContext context, this.radius) {
    this.circlePaint = Paint()
      ..color = Theme.of(context).accentColor
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
