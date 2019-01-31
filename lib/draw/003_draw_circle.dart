import 'package:flutter/material.dart';

///绘制圆形 Widget
class DrawCircle extends StatefulWidget {
  final double height;
  final double width;

  ///半径
  final double radius;

  ///颜色
  final Color color;

  ///样式是否填充
  final bool isFill;

  ///画笔宽度
  final double strokeWidth;

  DrawCircle(
      {this.height = 0,
      this.width = 0,
      @required this.radius,
      @required this.color,
      this.isFill = true,
      this.strokeWidth = 0.0});

  @override
  State<StatefulWidget> createState() => new _DrawCircleState();
}

class _DrawCircleState extends State<DrawCircle> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width, widget.height),
      painter: CirclePainter(
        radius: widget.radius,
        color: widget.color,
        isFill: widget.isFill,
        strokeWidth: widget.strokeWidth,
      ),
    );
  }
}

///圆形画家
class CirclePainter extends CustomPainter {
  ///半径
  double radius;

  ///颜色
  Color color;

  ///样式是否填充
  bool isFill;

  ///画笔宽度
  double strokeWidth;

  CirclePainter({
    @required this.radius,
    @required this.color,
    this.isFill,
    this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔🖌
    var paint = Paint()
      //开启抗锯齿
      ..isAntiAlias = true
      //设置样式
      ..style = isFill ? PaintingStyle.fill : PaintingStyle.stroke
      //设置画笔宽度
      ..strokeWidth = strokeWidth
      //设置颜色
      ..color = color;

    ///绘制圆形
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
