import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/routes/routing_constants.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {

  @override
  void dispose() {
    // TODO: implement dispose
  }
  @override
  void onInit() {
    // TODO: implement onInit
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    navigationPage();
  }

  @override
  void onClose() {
    // TODO: implement clone
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  void navigationPage() {
    Get.offAllNamed(Routes.homeRoute);
  }
}