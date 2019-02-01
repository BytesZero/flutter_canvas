import 'dart:ui';

import 'package:flutter/material.dart';

///绘制点
class DrawPoints extends StatefulWidget {
  ///高度
  final double height;

  ///宽度
  final double width;

  ///画笔颜色
  final Color color;

  ///画笔粗细
  final double strokeWidth;

  ///笔头样式
  final StrokeCap strokeCap;

  ///点绘制模式
  final PointMode pointMode;

  DrawPoints(
      {this.height = 100,
      this.width = 100,
      this.color = Colors.blue,
      this.strokeWidth = 6,
      this.strokeCap = StrokeCap.butt,
      this.pointMode = PointMode.points});

  @override
  State<StatefulWidget> createState() => new _DrawPointsState();
}

class _DrawPointsState extends State<DrawPoints> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PointsPainter(
        color: widget.color,
        strokeWidth: widget.strokeWidth,
        strokeCap: widget.strokeCap,
        pointMode: widget.pointMode,
      ),
      size: Size(widget.width, widget.height),
    );
  }
}

class PointsPainter extends CustomPainter {
  Color color;
  double strokeWidth;
  StrokeCap strokeCap;
  PointMode pointMode;

  PointsPainter({this.color, this.strokeCap, this.strokeWidth, this.pointMode});

  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔🖌
    var paint = Paint()
      //设置抗锯齿
      ..isAntiAlias = true
      //设置画笔头
      ..strokeCap = strokeCap
      //设置画笔宽度
      ..strokeWidth = strokeWidth
      //设置颜色
      ..color = color;

    ///绘制 5 个点
    canvas.drawPoints(
        pointMode,
        [
          Offset(0.0, 0.0),
          Offset(size.width, 0),
          Offset(size.width, size.height),
          Offset(0, size.height),
          Offset(size.width / 2, size.height / 2),
        ],
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
