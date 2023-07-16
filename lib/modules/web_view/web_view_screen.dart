// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
late final String url;

  WebViewScreen(artical);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
