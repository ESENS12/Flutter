package kr.esens.flutter_webview_plugin
import android.content.Context
import android.util.Log
import android.webkit.WebView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class PlatformWebView internal constructor(context: Context, id: Int, messenger: BinaryMessenger) : PlatformView {

    lateinit var mWebview: WebView;
    val TAG = "FlutterWebview"
    var METHOD_CHANNEL = "flutter_webview_plugin";
    var channel = MethodChannel(messenger, METHOD_CHANNEL)

    override fun getView(): WebView? {
        return mWebview
    }

    override fun dispose() {
        // 객체가 소멸될때 호출 됨.
        var a = 0
    }

    val FlutterMethodChannelHandler = MethodChannel.MethodCallHandler { call, result ->
        when(call.method){
            "webview@loadUrl"->{
                try {
                    var params = call.arguments as String;
                    Log.e(TAG, "[AOS] webview@loadUrl called : $params");
                    mWebview.loadUrl(params)
                    result.success(null)
                }catch (e : Exception){
                    Log.e(TAG,"loadUrl Error ${e.message}")
                    result.error("1",e.message,null);
                }
            }

//            else -> {
//                // else 구문을 풀면 flutter에 구현되지 않은 함수가 있다면 flutter쪽에서 에러가 나게 된다.
//                result.notImplemented()
//            }
        }
    }

    init {
        channel.setMethodCallHandler(FlutterMethodChannelHandler)
        mWebview = WebView(context)
        mWebview.settings.javaScriptEnabled = true
        mWebview.loadUrl("https://google.com")
    }

}