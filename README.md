# Flutter
Flutter Example, Recipe , Study

# Snippets

## Flutter WebView 관련
- 기본적으로 AOS, iOS, Web(Chrome) 3가지 플랫폼을 기준으로 한다
- Mobile OS 는 Flutter 에서 기본으로 제공하는 WebView를 사용 하면 됨 (https://pub.dev/packages/webview_flutter)
- Web에서는 어떻게 써야 하느냐..가 문제인데 2가지 방법이 있다
- 1. easy-webview 사용 (https://github.com/ESENS12/Flutter/tree/main/flutter_webview_sample)
- 2. 클라이언트 자체가 web Client이기 때문에 layout을 SizedBox나 Container로 영역만 잡은 뒤 platformViewRegistry를 사용하여 Control 한다. (https://stackoverflow.com/questions/58150503/webview-in-flutter-web)
- 2번방법을 사용하기 위한 예제 추가 예정.., 최대한 Platform.OS 체크하는 로직 사용해서 WebView Widget에서 각각 필요한 껍데기 위젯을 제공하는 방식으로