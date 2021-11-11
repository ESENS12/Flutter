import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/counter.dart';

class background extends StatefulWidget {
  const background({Key? key}) : super(key: key);

  @override
  _backgroundState createState() => _backgroundState();
}

class _backgroundState extends State<background> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, child) => Text(
        '${counter.value}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  @override
  void initState() {
    print('[background] called init state!');
    // print("background value : "+ context.watch<Counter>().value.toString());
  }
}

