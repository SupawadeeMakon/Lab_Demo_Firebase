import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
//Webview in flutter
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutter extends StatefulWidget {
  final String websiteName;
  final String websiteUrl;

  const WebViewFlutter({Key key, this.websiteName,this.websiteUrl})
      : super(key: key);

  @override
  _WebViewFlutterState createState() => _WebViewFlutterState();
}

class _WebViewFlutterState extends State<WebViewFlutter> {
  final Completer<WebController> _controller =
               Completer<WebController>();

               //FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.websiteName),
      ),

      
      // body: WebView(
      //   initialUrl: widget.websiteUrl,
      //   javascriptMode: JavascriptMode.unrestricted,
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller.complete(webViewController);
      //   },
      // ),
    );
  }
}