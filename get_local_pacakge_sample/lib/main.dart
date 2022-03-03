import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_webview_plugin/nativewebview.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const methodChannel = MethodChannel("flutter_webview_plugin");

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getMessage();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  Future<void> getMessage() async{
    try{
      var str_version = await FlutterWebviewPlugin.platformVersion;

      // 1.5초 후에 github.com 으로 page 변경
      Timer(const Duration(milliseconds: 1500), () {
        // 여기서 사용된 methodChannel은 FlutterWebviewPlugin 의 메소드 채널이 아닌, main.dart에서 새로 생성한 채널
        methodChannel.invokeMethod("webview@loadUrl", "https://github.com");

        //1.5초 후에 구글맵 으로 page 변경
        Timer(const Duration(milliseconds: 1500), () async {
          // 여기서 사용된 methodChannel은 import한 플러그에서 MethodChannel을 받아온것
          var fluginChannel = await FlutterWebviewPlugin.getMethodChanel;
          fluginChannel.invokeMethod("webview@loadUrl", "https://maps.google.com");
        });
      });
      print("version : $str_version");
    }catch(e){
      print("err :   ${e.toString()}");
    }
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NativeWeb(key: const Key("KEY"))

    );
  }
}
