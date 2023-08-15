

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/type/webview_type.dart';
import 'package:mortalheart_mall/views/webView/widget/floating_header.dart';
import 'package:mortalheart_mall/widgets/loading_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  bool isInit = false;
  bool isLoading = false;
  String title = '';

  void initView() {
    WebViewPageArguments params = ModalRoute.of(context)?.settings.arguments as WebViewPageArguments;
    if (isInit) return;

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel("ARTICLE_SCROLL_CHANNEL", onMessageReceived: (msg) {
        if (double.parse(msg.message) > 100) {
        } else {}
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            controller.getTitle().then((value) => setState(() {
              title = value!.replaceAll("京东", "");
            }));
            controller.runJavaScript(
              '''
                window.addEventListener('scroll', function() {
                window.ARTICLE_SCROLL_CHANNEL.postMessage(this.scrollY);
                });
              ''',
            );
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
              code: ${error.errorCode}
              description: ${error.description}
              errorType: ${error.errorType}
              isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(params.url));
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    initView();

    Widget floatingLoading = Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            width: getScreenWidth(context),
            height: getScreenHeight(context),
            child: loadingWidget(context),
          ),
        ),
        floatingHeader(context, title: title)
      ],
    );

    Widget webView = Stack(
      children: [WebViewWidget(controller: controller), floatingHeader(context, title: title)],
    );

    return Scaffold(body: isLoading ? floatingLoading : webView);
  }
}
