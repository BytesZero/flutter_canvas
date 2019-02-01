import 'package:flutter/material.dart';

class AddAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AddAnimation',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new AddAnimationPage(),
    );
  }
}

class AddAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddAnimationPageState();
}

class _AddAnimationPageState extends State<AddAnimationPage>
    with SingleTickerProviderStateMixin {
  double progress = 0.5;

  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    ///创建控制器
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);

    ///创建动画
    animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          progress = animation.value;
        });
      });

    ///开始动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('添加动画'),
      ),
      body: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('///点击进度条可重复播放'),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: CustomPaint(
                size: Size(200, 200),
                painter: AnimationPainter(progress: progress),
              ),
              onTap: () {
                ///开始动画
                _controller.forward(from: 0.0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

///进度条画家
class AnimationPainter extends CustomPainter {
  double progress = 1.0;

  AnimationPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    ///创建画笔 🖌
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    ///绘制灰色背景
    paint..color = Colors.grey;
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    ///绘制蓝色进度
    paint..color = Colors.blue;
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width * progress, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(AnimationPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
