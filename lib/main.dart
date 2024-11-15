import 'package:flutter/material.dart';
import 'package:native_integration_in_flutter/utils/connection_native.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ConnectionNative connectionNative = ConnectionNative();
  String fullName = '';
  double numbers = 0.0;

  @override
  void initState() {
    _initNativeChannel();
    super.initState();
  }

  void _initNativeChannel() async {
    var result = await connectionNative.getName();
    var nums = await connectionNative.getNumber();

    setState(() {
      fullName = result;
      numbers = nums;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$fullName \n $numbers',
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }
}
