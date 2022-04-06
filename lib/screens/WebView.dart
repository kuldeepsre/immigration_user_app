import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewPlusController? _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: WebViewPlus(
          javascriptChannels: null,
          initialUrl: 'http://immigrationadda.com/privacy-policy/',
          onWebViewCreated: (controller) {
            this._controller = controller;
          },
    ));
  }
}
