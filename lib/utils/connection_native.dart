import 'package:flutter/services.dart';

class ConnectionNative {
  static const platform = MethodChannel('com.example.native/channel');

  Future<String> getName() async {
    try {
      Map<String, dynamic> parms = {
        'firstName': 'Mohamed',
        'lastName': 'Elbehairy'
      };

      return await platform.invokeMethod("sayMyName", parms);
    } on PlatformException catch (e) {
      throw 'Failed to get the name: $e';
    }
  }

  Future<double> getNumber() async {
    try {
      Map<String, dynamic> parms = {
        'num1': 10.5,
        'num2': 9.5,
      };

      return await platform.invokeMethod("countNumbers", parms);
    } on PlatformException catch (e) {
      throw 'Failed to get the name: $e';
    }
  }
}
