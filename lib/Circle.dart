import 'package:flutter/material.dart';
import 'DrawCircle.dart';

const CIRCLE_RADIUS = 80.0;

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
    return ClipOval(
        child: CustomPaint(
            size: Size(CIRCLE_RADIUS * 2, CIRCLE_RADIUS * 2),
            painter: DrawCircle(color, CIRCLE_RADIUS)));
  }

  void setColor(Color color) {
    setState(() {
      this.color = color;
    });
  }
}
