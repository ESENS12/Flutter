import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'dart:html' as html;

class Iframe extends StatelessWidget {
  Iframe() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://maps.fatos.biz/fatos.html';

      return iframe;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("onTap content [center] ");
      },
      child: Container(
        // child: const Center(
        //   child: Text('Content # center(lower level)'),
        // ),
        child: HtmlElementView(viewType: 'iframe'),
      ),
    );
  }
}