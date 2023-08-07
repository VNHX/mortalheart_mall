

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static late EasyRefreshController freshController =  EasyRefreshController(controlFinishRefresh:true);
  static ScrollController scrollController = ScrollController();
  static PageController pageController = PageController();
  static final pageScrollY = RxDouble(0);
  static List searchList =['跑步鞋','鸡胸肉','苹果13 手机壳'];

  static final isTabClick = RxBool(false);
  @override
  void onInit() {
    // TODO: implement onInit
  }
  @override
  void dispose() {
    super.dispose();
    freshController.dispose();
  }


  //
  static easyRefreshSuccess(EasyRefreshController freshController) {
    freshController.finishRefresh(IndicatorResult.success);
  }



  static easyRefreshFail(EasyRefreshController freshController) {
    freshController.finishRefresh(IndicatorResult.fail);
  }
  /// 滚动距离
  static void onScroll(ScrollNotification notification) {
    double distance = notification.metrics.pixels;
    if (notification is ScrollUpdateNotification && notification.depth == 0) {
      pageScrollY.value =distance;
    }
  }




}
class RefreshAction {
  late VoidCallback freshSuccess;
  late VoidCallback freshFail;
  RefreshAction(this.freshSuccess, this.freshFail);
}
typedef VoidCallback = void Function();

typedef ValueCallback<T> = void Function(T value);