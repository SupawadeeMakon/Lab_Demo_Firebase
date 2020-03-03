import 'package:flutter/material.dart';
import 'package:piwfirebase/home.dart';
import 'package:piwfirebase/utility/sitting.dart';
import 'package:piwfirebase/utility/test_url.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piw FireBase',
      home: MyHomePage(),
      //home: MyService(),
      //home: WebViewInFlutter(),
    );
  }
}

