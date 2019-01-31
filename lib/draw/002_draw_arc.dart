import 'dart:math';

import 'package:flutter/material.dart';

///绘制圆弧
class DrawArc extends StatefulWidget {
  final double height;
  final double width;

  ///角度数（0 度~ 360 度，0 度与 X轴水平）
  final double angle;

  ///颜色
  final Color color;

  ///样式是否填充
  final bool isFill;

  ///画笔宽度
  final double strokeWidth;

  ///是否使用中心部分（即是否是闭环的）
  final bool useCenter;

  DrawArc(
      {@required this.height,
      @required this.width,
      @required this.angle,
      @required this.color,
      this.isFill = true,
      this.strokeWidth = 0.0,
      this.useCenter = false});

  @override
  State<StatefulWidget> createState() => new _DrawArcState();
}

class _DrawArcState extends State<DrawArc> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArcPainter(
        angle: widget.angle,
        color: widget.color,
        isFill: widget.isFill,
        strokeWidth: widget.strokeWidth,
        useCenter: widget.useCenter,
      ),
      size: Size(100, 100),
    );
  }
}

///弧画家
class ArcPainter extends CustomPainter {
  ///角度数（0 度~ 360 度，0 度与 X轴水平）
  double angle;

  ///颜色
  Color color;

  ///样式是否填充
  bool isFill;

  ///画笔宽度
  double strokeWidth;

  ///是否使用中心部分（即是否是闭环的）
  bool useCenter;

  ArcPainter(
      {this.angle, this.color, this.isFill, this.strokeWidth, this.useCenter});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      //设置抗锯齿
      ..isAntiAlias = true
      //设置样式
      ..style = isFill ? PaintingStyle.fill : PaintingStyle.stroke
      //设置画笔宽度
      ..strokeWidth = strokeWidth
      //设置画笔颜色
      ..color = color;

    ///绘制圆弧
    canvas.drawArc(Offset.zero & size, 0, pi / 180 * angle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
