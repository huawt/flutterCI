import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pageIndex = "";
  final MethodChannel _channel1 = MethodChannel('com.example.flutterModule/onechannel');
  final MethodChannel _channel2 = MethodChannel('com.example.flutterModule/twochannel');
  final BasicMessageChannel _channel3 = BasicMessageChannel(
    'com.example.flutterModule/threechannel',
    StandardMessageCodec(),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _channel1.setMethodCallHandler((call) async {
      setState(() {
        pageIndex = call.method;
      });
    });
    _channel2.setMethodCallHandler((call) async {
      setState(() {
        pageIndex = call.method;
      });
    });
    _channel3.setMessageHandler((message) async {
      print(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: _rootPage(pageIndex),
    );
  }

  Widget _rootPage(String pageIndex) {
    switch (pageIndex) {
      case 'one':
        return Scaffold(
          appBar: AppBar(title: Text(pageIndex)),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _channel1.invokeMethod("dismiss");
                },
                child: Text(pageIndex),
              ),
              TextField(
                onChanged: (value) {
                  _channel3.send(value);
                },
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: '请输入内容'),
              ),
            ],
          ),
        );
      case 'two':
        return Scaffold(
          appBar: AppBar(title: Text(pageIndex)),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                _channel2.invokeMethod("dismiss");
              },
              child: Text(pageIndex),
            ),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: Text(pageIndex)),
          body: Center(child: ElevatedButton(onPressed: () {}, child: Text(pageIndex))),
        );
    }
  }
}
