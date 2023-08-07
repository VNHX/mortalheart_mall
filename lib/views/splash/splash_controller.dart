import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/routes/routing_constants.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
   init();
  }
  init() async{
    await Future.delayed(const Duration(milliseconds:  2000));
    navigationPage();
    print('跳转首页');
  }
  @override
  Future<void> onReady() async {
    // TODO: implement onReady

  }

  @override
  void onClose() {
    // TODO: implement clone
  }

  void navigationPage() {
    Get.offAllNamed(Routes.homeRoute);
  }
}