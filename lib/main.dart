import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenderBox',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RenderBox'),
          elevation: 0,
          foregroundColor: Colors.cyanAccent,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.greenAccent[100],
        body: BBB(),
        // body: AAA(),
      ),
    );
  }
}

class BBB extends StatefulWidget {
  const BBB({Key? key}) : super(key: key);

  @override
  State<BBB> createState() => _BBBState();
}

class _BBBState extends State<BBB> {
  final GlobalKey _widgetKey = GlobalKey();
  late double _width;
  late double _height;
  List<Widget> _widgets = [];
  void _addContainer() {
    _widgets.add(Container(width: 50, height: 50, color: Colors.blue));
  }

  @override
  void initState() {
    super.initState();
    _width = 100;
    _height = 100;
  }

  double _getWidgetHeight() {
    final RenderBox renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size;
    // print(size.width);
    print('위젯의 높이: ${size.height}');
    return size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 700,
        height: 700,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    // onTap: _getWidgetInfo,
                    // onTap: xx,
                    child: Container(
                      width: _width,
                      height: _height,
                      key: _widgetKey,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: _widgets,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: () async {
                      setState(() {
                        print(_getWidgetHeight());
                        _width += 100;
                        _height += 100;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      print(_getWidgetHeight());
                    },
                    child: Text('사각형 길이 늘리기'),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _width -= 100;
                        _height -= 100;
                        print(_getWidgetHeight());
                      });
                    },
                    child: Text('사각형 길이 줄이기'),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        print(_getWidgetHeight());
                      });
                    },
                    child: Text('현재길이'),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _addContainer();
                        print(_getWidgetHeight());
                      });
                    },
                    child: Text('사각형 추가'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AAA extends StatelessWidget {
  AAA({Key? key}) : super(key: key);
  final GlobalKey _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 700,
        height: 700,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _getWidgetInfo,
                  // onTap: xx,
                  child: Container(
                    width: 100,
                    height: 100,
                    key: _widgetKey,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '메뉴 소개',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void xx() {
    print('xx');
  }

  void _getWidgetInfo() {
    print('_getWidgetInfo');
    final RenderBox renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    print(size.width);
    print(size.height);
    // print('${size.width}, ${size.height}');
    // print('Size: ${size.width}, ${size.height}');

    // final Offset offset = renderBox.localToGlobal(Offset.zero);
    // print('Offset: ${offset.dx}, ${offset.dy}');
    // print('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  }
}
