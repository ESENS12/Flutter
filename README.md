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
- 위 문제를 해결해줄 flutter webview 패키지가 있었다! [webviewx] (https://pub.dev/packages/webviewx) 
- Flutter webviewx Sample (https://github.com/ESENS12/Flutter/tree/main/webviewx_example)

## Flutter Device Orientation 관련
 - Android Native(이하 Native로 칭함) 의 GLSurfaceView를 감싼 platformView가 화면 전환시 마다 매번 새로 create/dispose 되는 상황
 - Native에서 ConfigChange를 직접 핸들링 하겠다고 선언을 해도, flutter widget 자체의 context가 매번 변경되어 새로 생성되므로, Native View는 이전 flutter widget의 context에 붙어있는 문제..
 - OrientationBuilder를 사용하니 context와 상관없이 Orientation으로 각각 새로운 widget을 빌드하는 방식은 가능하나.. 비용 및 두 위젯간의 상태관리를 생각하면....
 - ScreenUtil 도 해결방법이 될 수 있겠다는 생각에 우선 try 해보겠으나 해당 위젯은 dp,sp등 단말에서 해상도 대응을 손쉽게 하게 해주는 라이브러리로 보임..
 - 1. 우선 Native View는 화면 변경 시 re-rendering 되지 않도록 stateless 형태로 변경 
 - 2. 이후 glSurfaceView를 TextureView 로 변경. (핫리로드 시 glView만 멍텅구리 되는 현상도 수정할 수 있어보임)
