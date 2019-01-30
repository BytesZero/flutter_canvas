import 'package:flutter/material.dart';

class LineCircleSquareSurface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PointLineSurface',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LineCircleSquarePage(),
    );
  }
}

class LineCircleSquarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LineCircleSquarePageState();
}

class _LineCircleSquarePageState extends State<LineCircleSquarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('创建线圆面'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Text('///绘制 【蓝色、宽度 5px】 的线'
                  '\n///绘制 【红色、宽度 10px】 的线'
                  '\n///绘制 【绿色、宽度 8px、圆角】 的线'),
              SizedBox(height: 20),
              CustomPaint(
                painter: LinePainter(),
                size: Size(100, 100),
              ),
              SizedBox(height: 20),
              Text('///绘制【蓝色、半径 20px、实心】的圆形'
                  '\n///绘制【绿色、半径 30px、空心、笔画宽度为 5px】的圆形'),
              SizedBox(height: 20),
              CustomPaint(
                painter: CirclePainter(),
                size: Size(200, 200),
              ),
              SizedBox(height: 20),
              Text('///绘制【蓝色、Size 大小相同】的矩形'
                  '\n///绘制【绿色、半径 30px、空心、笔画宽度为 5px】的圆形'),
              SizedBox(height: 20),
              CustomPaint(
                painter: RectPainter(),
                size: Size(100, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///线画家
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    ///绘制 【蓝色、宽度 5px】 的线
    paint..color = Colors.blue;
    paint..strokeWidth = 5;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);

    ///绘制 【红色、宽度 10px】 的线
    paint..color = Colors.red;
    paint..strokeWidth = 10;
    canvas.drawLine(Offset(0, 10), Offset(size.width, 10), paint);

    ///绘制 【绿色、宽度 8px、圆角】 的线
    paint.color = Colors.green;
    paint..strokeWidth = 8;
    paint..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(0, 25), Offset(size.width, 25), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///创建圆形画家
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    ///绘制【蓝色、半径 20px、实心】的圆形
    paint..color = Colors.blue;
    canvas.drawCircle(Offset(size.width / 2, 10), 20, paint);

    ///绘制【绿色、半径 30px、空心、笔画宽度为 5px】的圆形
    paint..color = Colors.green;
    paint..style = PaintingStyle.stroke;
    paint..strokeWidth = 5;
    canvas.drawCircle(Offset(size.width / 2, 20 + 30 + 20.0), 30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///创建矩形画家
class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔 🖌
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    ///绘制【蓝色、Size 大小相同】的矩形
    paint..color = Colors.blue;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
