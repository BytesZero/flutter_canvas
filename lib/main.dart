import 'package:flutter/material.dart';
import 'package:flutter_canvas/base/001_create.dart';
import 'package:flutter_canvas/base/002_line_circle_square.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Canvas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '001_create': (BuildContext context) => CreatePage(),
        '002_point_line_surface': (BuildContext context) =>
            LineCircleSquarePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///基础模块列表
  var baseList = [
    ['创建 CustomPaint', '001_create'],
    ['绘制线、圆、方', '002_point_line_surface'],
    ['画线', '001_create'],
    ['画圆', '001_create'],
  ];

  @override
  Widget build(BuildContext context) {
    ///底部导航
    var bottomNavigationBar = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('基础'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.ac_unit),
        title: Text('进阶'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_alarm),
        title: Text('实战'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Canvas'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var item = baseList[index];

          ///构建 item 项
          return ListTile(
            title: Text(
              item[0],
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              goPage(item[1]);
            },
          );
        },
        separatorBuilder: (context, index) {
          ///构建分割线
          return Divider(
            height: 0.5,
            color: Colors.grey,
          );
        },
        itemCount: baseList.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBar,
        type: BottomNavigationBarType.fixed,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///去一个页面
  Future<void> goPage(String routeName) async {
    Navigator.pushNamed(context, routeName);
  }
}
