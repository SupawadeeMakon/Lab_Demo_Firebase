
import 'package:flutter/material.dart';
//import 'package:flutter_native_web/flutter_native_web.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:flutter_youtube_view/flutter_youtube_view.dart';
//import 'package:ungmushroom/widget/test_web.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewInFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("WebView Example"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.deepPurple,
          child: Text("Visit the Webpage",
          style: TextStyle(color:Colors.blue),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}