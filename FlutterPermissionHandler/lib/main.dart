
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter_permission_handler/permission_view.dart';

void main() {
  // Use Custom Permission UI
  runApp(MyCustomPermissionApp());

  // Use Permission_handler (default UI)
  //runApp(MyApp());
}

class MyCustomPermissionApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Custom Permission App",
      home:CustomPermissionView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  final Permission _permission = Permission.storage;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  void checkServiceStatus(BuildContext context,
      PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {

    final status = await permission.request();
    setState(() {
      // print(status);
      _permissionStatus = status;
      // print(_permissionStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the permission state is : $_permissionStatus',
            ),
            OutlinedButton(
              onPressed: () {
                requestPermission(_permission);
              },
              child: const Text('GET PERMISSION'),
            ),
          ],
        ),
      ),
    );
  }
}
