import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myStack extends StatefulWidget {
  myStack({Key? key}) : super(key: key);

  @override
  _myStackState createState() => _myStackState();
}

class _myStackState extends State<myStack> with SingleTickerProviderStateMixin{

  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  bool _bIsShowSubContent = false;

  int _counter = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          _bIsShowSubContent = !_bIsShowSubContent;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget Example'),
      ),
      body: Center(
        child: Scaffold(
          appBar: PreferredSize(
            // 상단 tabbar height size
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              // title: Text('FATOS map'),
              bottom: TabBar(
                controller: _tabController,
                tabs: myTabs,
              ),
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Positioned(
                top: 0,
                height: MediaQuery.of(context).size.height,
                left: MediaQuery.of(context).size.width * .05,
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width * .05,
                child: GestureDetector(
                    onTap: (){
                      print("onTap content [center] ");
                    },
                    child: Container(
                    child: const Center(
                      child: Text('Content # center(lower level)'),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * .05,
                child : GestureDetector(
                  onTap: (){
                    print("onTap content[mid]");
                  },
                  child: Container(
                  child: const Center(
                    child: Text('Content # 2 [mid]'),
                  ),
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                height: MediaQuery.of(context).size.height,
                left: MediaQuery.of(context).size.width * .05,
                width: MediaQuery.of(context).size.width * .20,
                child: GestureDetector(
                  onTap: (){
                    print("onTap content[top]");
                  },
                  child: Visibility(
                    child: Container(
                      child: const Center(
                        child: Text('Content [TOP]'),
                      ),
                      color: Colors.greenAccent,
                    ),
                    visible: _bIsShowSubContent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
