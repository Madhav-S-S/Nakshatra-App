import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          title: Text('NK\'23'),
          backgroundColor: Colors.black,
        ),*/
        body: WillPopScope(
          onWillPop: () async {
            if (await _webViewController.canGoBack()) {
              _webViewController.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: WebView(
            userAgent: "random",
            initialUrl: 'https://nakshatrasgce.in/events',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _webViewController = controller;
            },
          ),
        ),
      ),
    );
  }
}
