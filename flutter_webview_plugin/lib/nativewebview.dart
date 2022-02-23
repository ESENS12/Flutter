
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NativeWeb extends StatefulWidget {
  NativeWeb({
    required Key key
  });

  @override
  _NativeWebState createState() => _NativeWebState();
}

class _NativeWebState extends State<NativeWeb> {
  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android) {
      return const AndroidView(
        viewType: 'NativeWebView',
        creationParamsCodec: StandardMessageCodec(),
      );
    }else{
      return Container();
    }
  }
}