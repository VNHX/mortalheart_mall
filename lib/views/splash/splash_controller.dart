import 'dart:async';
import 'package:get/get.dart';
import 'package:mortalheart_mall/navigation/nav_page.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
   init();
  }
  init() async{
    await Future.delayed(const Duration(milliseconds:  2000));
    navigationPage();
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
    // const NavPage();
  }
}