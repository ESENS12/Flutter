import 'package:flutter/material.dart';
import 'ui_material.dart';

class StaticSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: Column(
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
    );
  }
}

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

class StaticDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles( //          <-- ListTile.divideTiles
          context: context,
          tiles: [
            //todo icon platform
            ListTile(
              leading: aosUserIcon,
              onTap: () {
                Navigator.pop(context);
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) => MainContent(1)));
              },
            ),
            ListTile(
              leading: aosMapIcon,
              onTap: () {
                Navigator.pop(context);
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) => MainContent(2)));
              },
            ),
            ListTile(
              leading: aosSettingIcon,
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