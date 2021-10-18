import 'package:flutter/material.dart';

import 'my_webview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Web View',
      theme: ThemeData.light(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}