
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'utils.dart';
import 'widgets.dart';

class UploadPage extends StatefulWidget {
  static const title = 'Upload';
  static const androidIcon = Icon(Icons.folder_rounded);
  static const iosIcon = Icon(CupertinoIcons.folder_circle);

  UploadPage({required Key key, required this.url}) : super(key: key);

  final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}


class _UploadPageState extends State<UploadPage> {

  Future<Response> uploadImage(String encoded_str, String url) async {

    print("request url : " + url);

    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'data': encoded_str,
      }),
    );

    // var res = await request.send();
    // if(res != null){
    //   final response =
    //   await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    //
    //   if (response.statusCode == 200) {
    //     // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    //     // return Post.fromJson(json.decode(response.body));
    //     return response.body.toString();
    //   } else {
    //     // 만약 요청이 실패하면, 에러를 던집니다.
    //     return 'Failed to load post';
    //   }
    // }
    // return '';
    // return Post.fromJson(json.decode(response.body));
  }

  String state = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(state)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if(result != null){
            Uint8List? bytes =  result.files.single.bytes;
            String plane_str = new String.fromCharCodes(bytes!);
            String encoded_str = base64.encode(utf8.encode(plane_str));

            print("bytes : "  + encoded_str);
            var res = await uploadImage(encoded_str, widget.url);
            setState(() {
              state = res.body;
              print("uploadImage result : "+res.body);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}