package kr.esens.flutter_vector_tile_example

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.lifecycle.Lifecycle
import io.flutter.embedding.android.*
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterShellArgs
import io.flutter.plugin.platform.PlatformPlugin

class MainActivity: FlutterActivity(){
    val TAG = "[Android] MainActivity"
    override fun onTrimMemory(level: Int) {
        super.onTrimMemory(level)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e(TAG,"onCreate Called!")
    }

    override fun onStart() {
        super.onStart()
    }

    override fun onResume() {
        super.onResume()
        Log.e(TAG,"onResume Called!")
    }

    override fun onPostResume() {
        super.onPostResume()
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        Log.e(TAG,"onSaveInstanceState Called!")
    }

    override fun onPause() {
        super.onPause()
    }

    override fun onUserLeaveHint() {
        super.onUserLeaveHint()
    }

    override fun onStop() {
        super.onStop()
    }

    override fun onDestroy() {
        super.onDestroy()
    }

    override fun onBackPressed() {
        super.onBackPressed()
        Log.e(TAG,"onBackPressed Called!")
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
    }
}
