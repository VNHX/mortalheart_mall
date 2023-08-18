import 'dart:async';
import 'package:get/get.dart';
import 'package:mortalheart_mall/navigation/nav_page.dart';

class SplashController extends GetxController{
  final time = RxInt(0);
  late Timer _timer;
  @override
  void onInit() {
    // TODO: implement onInit
   init();
  }
  init() async{
    await floorStartTime();
  }
  late int count = 0;
  floorStartTime() async {
    const Duration(milliseconds: 2000);
    _timer = Timer.periodic(const Duration(milliseconds:1000), (timer) {
      ///自增
      count++;
      ///到3秒后停止
      time.value = count;
      print(count);
      if (count == 3) {
        navigationPage();
        _timer.cancel();
      }
    });
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
    print('我要去首页');
    Get.to(const NavPage());
    _timer.cancel();
  }

  void splashPageToName() async{
    print('我要去详情页');
  }
}