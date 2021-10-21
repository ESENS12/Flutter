import 'package:flutter/material.dart';

class SideMenuScreen extends StatelessWidget {
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
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      ListTile(title: Text("Menu A")),
                      ListTile(title: Text("Menu B")),
                      ListTile(title: Text("Menu C")),
                      ListTile(title: Text("Menu D")),
                      ListTile(title: Text("Menu E")),
                      ListTile(title: Text("Menu F")),
                      ListTile(title: Text("Menu G")),
                      ListTile(title: Text("Menu H")),
                      ListTile(title: Text("Menu I")),
                      ListTile(title: Text("Menu J")),
                      ListTile(title: Text("Menu K")),
                      ListTile(title: Text("Menu L")),
                      ListTile(title: Text("Menu M")),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(child: Text('Content')),
                    color: Colors.black26,
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