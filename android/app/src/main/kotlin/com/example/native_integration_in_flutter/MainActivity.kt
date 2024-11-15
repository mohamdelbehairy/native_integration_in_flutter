package com.example.native_integration_in_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.native/channel"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler {call,result ->
            if(call.method == "sayMyName") {
                val firstName: String = call.argument<String>("firstName") ?: ""
                val lastName: String = call.argument<String>("lastName") ?: ""

                val fullName = firstName + " " + lastName

                result.success(fullName)
            } else if(call.method == "countNumbers") {
                val num1: Double = call.argument<Double>("num1") ?: 0.0
                val num2: Double = call.argument<Double>("num2") ?: 0.0

                val nums = num1 + num2

                result.success(nums)
            } else {
                result.notImplemented()
            }
        }
    }
}
