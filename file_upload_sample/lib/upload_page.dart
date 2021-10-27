
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class UploadPage extends StatefulWidget {
  static const title = 'Upload';
  static const androidIcon = Icon(Icons.folder_rounded);
  static const iosIcon = Icon(CupertinoIcons.folder_circle);

  UploadPage({required this.url});

  final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}


class _UploadPageState extends State<UploadPage> {

  String state = "";

  //route,order,depot,breaks

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

            // encode bas64 example
            String plane_str = new String.fromCharCodes(bytes!);
            String encoded_str = base64.encode(utf8.encode(plane_str));
            // print("encoded_str : "  + encoded_str);

            var request = http.MultipartRequest('POST', Uri.parse(widget.url));
            var pick_file = await http.MultipartFile.fromBytes('userfile', bytes, filename: result.files.single.name);

            print("file size : " + pick_file.length.toString());
            print("file name : " + pick_file.filename.toString());

            request.files.add(pick_file);
            http.StreamedResponse response = await request.send();

            if (response.statusCode == 200) {
              print(await response.stream.bytesToString());
            }
            else {
              print(response.reasonPhrase);
            }

            // setState(() {
            //   state = res.body;
            //   print("uploadImage result : "+res.body);
            // });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}