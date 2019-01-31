import 'package:flutter/material.dart';

///绘制线的Widget
class DrawLineWidget extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final bool round;

  DrawLineWidget(
      {this.color = Colors.blue,
      this.width = 0.0,
      this.height = 0.0,
      this.round = false});

  @override
  State<StatefulWidget> createState() => new _DrawLineWidgetState();
}

class _DrawLineWidgetState extends State<DrawLineWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width, widget.height),
      painter: LinePainter(
        color: widget.color,
        round: widget.round,
      ),
    );
  }
}

///线画家
class LinePainter extends CustomPainter {
  ///颜色
  Color color;

  ///是否圆角
  bool round;

  LinePainter({this.color, this.round});

  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔🖌
    var paint = Paint()
      //设置抗锯齿
      ..isAntiAlias = true
      //设置颜色
      ..color = color
      //设置画笔宽度
      ..strokeWidth = size.height
      //设置是否圆角
      ..strokeCap = round ? StrokeCap.round : StrokeCap.butt;

    ///绘制线条
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
