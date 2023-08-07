
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/routes/routes.dart';
import 'package:mortalheart_mall/routes/routing_constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerTriggerDistance: 88 + getStatusHeight(context),
      headerBuilder: () => ClassicHeader(
        spacing: 10,
        height: 68 + getStatusHeight(context),
      ),
      footerBuilder: () => const ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      enableBallisticLoad: true,
      child:  GetMaterialApp(
        title: '凡人之心',
        debugShowCheckedModeBanner: false,
        //  默认加载
        initialRoute:Routes.splashRoute,
        // 404
        unknownRoute: AppPages.unknownRoute,
        // 加载路由
        getPages: AppPages.pages,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        /// 路由监听回调
        routingCallback: (routing) {
          if (kDebugMode) {
            print('路由监听回调：${routing!.current}');
          }
        },
      ),
    );
  }
}
