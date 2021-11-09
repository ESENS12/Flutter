import 'package:flutter/material.dart';

class VerticalStack extends StatefulWidget {
  const VerticalStack({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<VerticalStack> createState() => _VerticalStackState();
}

class _VerticalStackState extends State<VerticalStack> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: 0,
          left:0,
          child: Container(
            color: Colors.deepPurple,
            width: MediaQuery.of(context).size.width * .35,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Positioned(
          top:0,
          left: MediaQuery.of(context).size.width * .25,
          width:MediaQuery.of(context).size.width * .75,
          child: Card(
            elevation: 8,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.bluetooth,
                      color: Colors.deepPurple,
                      size: 45,
                    ),
                    Text("BEACON"),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
