import 'package:flutter/material.dart';


class MainContent extends StatelessWidget {
  final int indexContent;

  MainContent(this.indexContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Content # $indexContent'),
      ),
      color: Colors.white,
    );
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          // body: const TabBarView(
          //   children: [
          //     Icon(Icons.directions_car),
          //     Icon(Icons.directions_transit),
          //     Icon(Icons.directions_bike),
          //   ],
          // ),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex:5,
                          child: StaticDrawer(),
                        ),
                        Expanded(
                          flex: 95,  // content page flex(width)
                          child: PageView(
                            children: <Widget>[
                              MainContent(1),
                              MainContent(2),
                              MainContent(3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex:5,
                          child: StaticDrawer(),
                        ),
                        Expanded(
                          flex: 95,  // content page flex(width)
                          child: PageView(
                            children: <Widget>[
                              MainContent(4),
                              MainContent(5),
                              MainContent(6),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex:5,
                          child: StaticDrawer(),
                        ),
                        Expanded(
                          flex: 95,  // content page flex(width)
                          child: PageView(
                            children: <Widget>[
                              MainContent(7),
                              MainContent(8),
                              MainContent(9),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaticDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles( //          <-- ListTile.divideTiles
          context: context,
          tiles: [
            //todo icon platform
            ListTile(
              leading: Icon(Icons.directions_car),
              onTap: () {
                Navigator.pop(context);
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) => MainContent(1)));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_transit),
              onTap: () {
                Navigator.pop(context);
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) => MainContent(2)));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bike),
              onTap: () {
                Navigator.pop(context);
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) => MainContent(3)));
              },
            ),
          ]
      ).toList(),
    );
  }
}