import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HackerNewsWebView extends StatefulWidget {
  final String url;

  HackerNewsWebView({Key key, this.url}) : super(key: key);

  @override
  HackerNewsWebViewState createState() => HackerNewsWebViewState();
}

class HackerNewsWebViewState extends State<HackerNewsWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition: https://pub.dev/packages/webview_flutter
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
