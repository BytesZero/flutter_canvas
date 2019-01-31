import 'package:flutter/material.dart';
import 'package:flutter_canvas/draw/001_draw_line.dart';
import 'package:flutter_canvas/draw/002_draw_arc.dart';

class CanvasDrawAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CanvasDrawAll',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new CanvasDrawAllPage(),
    );
  }
}

class CanvasDrawAllPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CanvasDrawAllPageState();
}

class _CanvasDrawAllPageState extends State<CanvasDrawAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Canvas API'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleTips(title: '线'),
              DrawLineWidget(
                color: Colors.red,
                height: 5,
                width: 200,
                round: false,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 红色、5px线宽、200px线长'),
              ),
              DrawLineWidget(
                color: Colors.yellow,
                height: 10,
                width: 200,
                round: true,
              ),
              SizedBox(
                height: 50,
                child: Text(
                  '/// 黄色、10px线宽、200px线长\n（注意这里增加了头部圆角，所以两边各多出 5px）',
                  textAlign: TextAlign.center,
                ),
              ),
              DrawLineWidget(
                color: Colors.blue,
                height: 20,
                width: 200,
                round: false,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 蓝色、20px线宽、200px线长'),
              ),
              TitleTips(title: '弧'),
              DrawArc(
                width: 100,
                height: 100,
                color: Colors.red,
                angle: 270,
                isFill: true,
                useCenter: true,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 100x100px、红色、填充、270°、使用中心闭环'),
              ),
              DrawArc(
                width: 100,
                height: 100,
                color: Colors.red,
                angle: 270,
                isFill: false,
                useCenter: true,
                strokeWidth: 2,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 100x100px、红色、不填充、270°、使用中心闭环、画笔宽度 2px'),
              ),
              DrawArc(
                width: 100,
                height: 100,
                color: Colors.blue,
                angle: 270,
                isFill: false,
                useCenter: false,
                strokeWidth: 5,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 100x100px、蓝色、不填充、270°、不使用中心闭环、画笔宽度 5px'),
              ),
              DrawArc(
                width: 100,
                height: 100,
                color: Colors.blue,
                angle: 270,
                isFill: true,
                useCenter: false,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 100x100px、蓝色、填充、270°、不使用中心闭环'),
              ),
              DrawArc(
                width: 100,
                height: 100,
                color: Colors.yellow,
                angle: 90,
                isFill: true,
                useCenter: false,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 100x100px、黄色、填充、90°、不使用中心闭环'),
              ),
              DrawArc(
                width: 100,
                height: 100,
                color: Colors.yellow,
                angle: 90,
                isFill: false,
                useCenter: false,
                strokeWidth: 4,
              ),
              SizedBox(
                height: 30,
                child: Text('/// 100x100px、黄色、不填充、90°、不使用中心闭环'),
              ),
              TitleTips(title: '圆'),
              TitleTips(title: '方'),
              TitleTips(title: '图'),
            ],
          ),
        ),
      ),
    );
  }
}

///标题提示
class TitleTips extends StatefulWidget {
  ///标题
  final String title;

  TitleTips({@required this.title});

  @override
  State<StatefulWidget> createState() => new _TitleTipsState();
}

class _TitleTipsState extends State<TitleTips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        '# ${widget.title} #',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
