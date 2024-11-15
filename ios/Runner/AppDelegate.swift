import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(
      name: "com.example.native/channel",
      binaryMessenger: controller.binaryMessenger)

    methodChannel.setMethodCallHandler {
      (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "sayMyName" {
        if let args = call.arguments as? [String: Any],
          let firstName = args["firstName"] as? String,
          let lastName = args["lastName"] as? String
        {
          let fullName = firstName + " " + lastName

          result(fullName)
        } else {
          result(FlutterError(code: "ERROR", message: "Invalid arguments", details: nil))
        }
      } else if call.method == "countNumbers" {
        if let args = call.arguments as? [String: Any],
          let num1 = args["num1"] as? Double,
          let num2 = args["num2"] as? Double
        {
          let nums = num1 + num2

          result(nums)
        } else {
          result(FlutterError(code: "ERROR", message: "Invalid arguments", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
