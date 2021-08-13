import 'package:docusign/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class WebView extends StatefulWidget {
  const WebView({Key key}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  InAppWebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Consumer<PowerFormProvider>(
      builder: (context , data , _){
        return    Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: oasBlue,
          ),
        body: InAppWebView(
        initialUrl: data.url ,
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (webViewController,  uri){
          return Center(
            child: CircularProgressIndicator(),
          );
          },
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
        ),
        );
      },

    );
  }
}
