import 'package:flutter/material.dart';

///如何进行Flutter布局开发？
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何进行Flutter布局开发？',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('如何进行Flutter布局开发？'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  label: '首页'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  label: '列表')
            ]),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                      'http://www.devio.org/img/avatar.png'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  //圆角
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.6, //60%透明度
                                    child: Image.network(
                                      'http://www.devio.org/img/avatar.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const TextField(
                            //输入文本的样式
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                hintText: '请输入',
                                hintStyle: TextStyle(fontSize: 15)),
                          ),
                          Container(
                            height: 100,
                            margin: const EdgeInsets.all(10),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              clipBehavior: Clip.antiAlias, //抗锯齿
                              child: PageView(
                                children: <Widget>[
                                  _item('Page1', Colors.deepPurple),
                                  _item('Page2', Colors.green),
                                  _item('Page3', Colors.red)
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.greenAccent),
                                  child: const Text('宽度撑满'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 36,
                              height: 36,
                            ))
                      ],
                    ),
                    Wrap(
                      //创建一个wrap布局，从左向右进行排列，会自动换行
                      spacing: 8, //水平间距
                      runSpacing: 6, //垂直间距
                      children: <Widget>[
                        _chip('Flutter'),
                        _chip('进阶'),
                        _chip('实战'),
                        _chip('携程'),
                        _chip('App'),
                      ],
                    )
                  ],
                ))
            : Column(
                children: <Widget>[
                  const Text('列表'),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                    child: const Text('拉伸填满高度'),
                  ))
                ],
              ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0, 1),
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
