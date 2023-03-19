// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class myweb extends StatefulWidget {
  const myweb({Key? key}) : super(key: key);

  @override
  State<myweb> createState() => _mywebState();
}

class _mywebState extends State<myweb> {
  double _progress = 0;

  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: WillPopScope(
          onWillPop: () async {
            if (await webView.canGoBack()) {
              webView.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "https://saintgitsengineering.linways.com/student/index.php?next=%2Fstudent%2Fstudent.php%3Fmenu%3Dhome")),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = _progress / 100;
                });
              })),
    );
  }
}
