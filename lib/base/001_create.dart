import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Create',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new CreatePage(),
    );
  }
}

class CreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建一个 CustomPaint'),
      ),
      body: Center(
        child: CustomPaint(
          painter: CreateCustomPainter(),
          size: Size(100, 100),
        ),
      ),
    );
  }
}

///
/// 创建一个 CustomPainter
class CreateCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ///之后的代码可以看
    ///创建画笔
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 5;

    ///画一个横线
    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);

    ///上面的代码可以不看
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
