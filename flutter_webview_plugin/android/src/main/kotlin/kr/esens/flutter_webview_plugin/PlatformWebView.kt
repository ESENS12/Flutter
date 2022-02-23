package kr.esens.flutter_webview_plugin
import android.content.Context
import android.webkit.WebView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class PlatformWebView internal constructor(context: Context, id: Int, messenger: BinaryMessenger) : PlatformView {

    lateinit var mWebview: WebView;
    val TAG = "PlatformMapView"
    var METHOD_CHANNEL = "biz.fatos.mogos/mapview/$id";
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
            "map@autoScale"->{
                var params : ArrayList<Double> = call.arguments as ArrayList<Double>;
                var fTilt : Float = params[0].toFloat()
                var fLevel: Float = params[1].toFloat()

//                FatosInterface.Map_OnAutoScale(fTilt, fLevel)
                result.success(null)
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