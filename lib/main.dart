import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Circle.dart';

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

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
