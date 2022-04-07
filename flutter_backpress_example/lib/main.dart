import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var ctime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(

            onWillPop: () {
              DateTime now = DateTime.now();
              if (ctime == null || now.difference(ctime) > Duration(seconds: 2)) {
                //add duration of press gap
                ctime = now;
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Press Back Button Again to Exit'))
                ); //scaffold message, you can show Toast message too.
                return Future.value(false);
              }

              return Future.value(true);
            },

            child: Container(
              color: Colors.lightBlue,
              //your content goes here.
            )
        )
    );
  }
}