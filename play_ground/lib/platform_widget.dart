import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// A simple widget that builds different things on different platforms.
class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key? key,
    required this.androidBuilder,
    required this.iosBuilder,
    required this.macosBuilder,
  }) : super(key: key);

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;
  final WidgetBuilder macosBuilder;

  @override
  Widget build(context) {
    // platform에 따라 필요한 위젯 반환, 여기서 각각 빌더들은 별도의 클래스에서 등록하는 형태로 작성해야한다.
    // dart:html 같이 native 에서 import 할 수 없는 클래스를 포함하지 않도록 하기 위함
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      case TargetPlatform.macOS:
        return macosBuilder(context);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return const SizedBox.shrink();
    }
  }
}
