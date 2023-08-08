

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// 刷新
  final EasyRefreshController freshController =  EasyRefreshController(controlFinishRefresh:true);
  /// 滚动条
  final ScrollController scrollController = ScrollController();
  /// 页码
  final PageController pageController = PageController();
  /// 滚动条值
  late double pageScrollY = 0.0 ;
  /// 搜索栏广告条
  final List searchList =['跑步鞋','鸡胸肉','苹果13 手机壳'].obs;

   final isTabClick = RxBool(false);
  /// tabs
   final tabs = RxList([]);
  /// 判断 tabs 是否选中
   final isSelect = RxBool(false);
  // 轮播图
   final bannerList = RxList([]);
  // 菜单
   final menuList = RxList([]);

   final menuSliderIndex = RxInt(0);


  @override
  void onInit() {
    // TODO: implement onInit
  }
  @override
  void dispose() {
    super.dispose();
    freshController.dispose();
  }



  Future<void> easyRefreshSuccess(EasyRefreshController freshController) async {
    freshController.finishRefresh(IndicatorResult.success);
  }



  Future<void> easyRefreshFail(EasyRefreshController freshController) async {
    freshController.finishRefresh(IndicatorResult.fail);
  }
  // 滚动距离
  Future<void> onScroll(ScrollNotification notification) async {
    double distance = notification.metrics.pixels;
    if (notification.depth == 0) {
      pageScrollY =distance.obs as double;
    }
  }
  /// 首页tabs分类点击查询
  Future<void> handleTabChange(String code, tabs) async {
    isTabClick.value = true;
    int tabIndex = tabs.indexWhere((element) => element.code == code);
    pageController.animateToPage(
        tabIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear
    ).then((value) => isTabClick.value = false);
  }
  /// 首页tabs分类
  Future<void> onTabChange() async {}
 /// 菜单 滑动
  Future<void> setMenuSliderIndex(int index) async {
    menuSliderIndex.value = index;
  }






}

class RefreshAction {
  late VoidCallback freshSuccess;
  late VoidCallback freshFail;
  RefreshAction(this.freshSuccess, this.freshFail);
}
typedef VoidCallback = void Function();

typedef ValueCallback<T> = void Function(T value);