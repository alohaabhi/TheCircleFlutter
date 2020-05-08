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

class CircleHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleHomePageState();
  }
}

class CircleHomePageState extends State {
  final GlobalKey<CircleState> circleState = GlobalKey<CircleState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: GestureDetector(
          child: Circle(getRandomColor(), circleState),
          onTap: onCircleTap,
        )));
  }

  void onCircleTap() {
    circleState.currentState.setColor(getRandomColor());
  }
}

class Circle extends StatefulWidget {
  final color;
  Circle(this.color, Key key) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CircleState(color);
  }
}

class CircleState extends State {
  Color color;
  CircleState(this.color);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(160.0, 160.0),
      painter: DrawCircle(color, 80.0),
    );
  }

  void setColor(Color color) {
    setState(() {
      this.color = color;
    });
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
    canvas.drawCircle(Offset(radius, radius), radius, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
