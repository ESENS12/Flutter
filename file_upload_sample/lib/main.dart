import 'package:flutter/material.dart';
import 'upload_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Upload Example',
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  void switchScreen(str, context) =>
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => UploadPage(url: str)
      ));
  @override
  Widget build(context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
            title: Text('Flutter File Upload Example')
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                onSubmitted: (str) => switchScreen(str, context),
              ),
              FlatButton(
                child: Text("Take me to the upload screen"),
                onPressed: () => switchScreen(controller.text, context),
              )
            ],
          ),
        )
    );
  }
}