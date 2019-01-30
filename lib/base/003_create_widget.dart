import 'dart:math';

import 'package:flutter/material.dart';

class CreateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CreateWidget',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new CreateWidgetPage(),
    );
  }
}

class CreateWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CreateWidgetPageState();
}

class _CreateWidgetPageState extends State<CreateWidgetPage> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('包装为 Widget'),
      ),
      body: Center(
        child: GestureDetector(
          child: SquareColorWidget(
            color: color,
          ),
          onTap: () {
            setState(() {
              color = Color.fromARGB(255, Random.secure().nextInt(255),
                  Random.secure().nextInt(255), Random.secure().nextInt(255));
            });
          },
        ),
      ),
    );
  }
}

///方形动态颜色Widget
class SquareColorWidget extends StatefulWidget {
  ///颜色修改
  final Color color;

  SquareColorWidget({this.color});

  @override
  State<StatefulWidget> createState() => new _SquareColorWidgetState();
}

class _SquareColorWidgetState extends State<SquareColorWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SquarePainter(color: widget.color),
      size: Size(200, 200),
    );
  }
}

class SquarePainter extends CustomPainter {
  ///颜色修改
  final Color color;

  SquarePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
