

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/models/home/home_page_info.dart';
import 'package:mortalheart_mall/views/home/service.dart';

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
   /// homebj
  final homebj = RxString('');
  /// tabs
   final tabs = RxList([]);
   /// 当前选中Tabs
  final currentTab = '1'.obs;
  /// 判断 tabs 是否选中
  final isSelect = false.obs;
  // 轮播图
   final bannerList = RxList([]);
  // 菜单
   final menuList = RxList([]);
   /// 菜单 index
   final menuSliderIndex = 0.obs;
   /// 广告条
  final adUrl = RxString('');
  /// 首页数据
  late HomePageInfo  homePageInfo;

  @override
  void onInit() {
    // TODO: implement onInit
    intPage();
  }
  @override
  void dispose() {
    super.dispose();
    freshController.dispose();
  }
  intPage() async {
    Future initData = Future.wait([HomeApi.queryHomeInfo()]);
    await initData.then((res) => {
      homePageInfo = res[0],
      tabs.value = homePageInfo.tabList ?? [],
      bannerList.value = homePageInfo.bannerList ?? [],
      adUrl.value = homePageInfo.adUrl ?? '',
      menuList.value = homePageInfo.nineMenuList ?? [],
    });
  }


  Future<void> easyRefreshSuccess(EasyRefreshController freshController) async {
    freshController.finishRefresh(IndicatorResult.success);
    intPage();
  }



  Future<void> easyRefreshFail(EasyRefreshController freshController) async {
    freshController.finishRefresh(IndicatorResult.fail);
  }
  // 滚动距离
  Future<void> onScroll(ScrollNotification notification) async {
    double distance = notification.metrics.pixels;
    if (notification.depth == 0) {
      // pageScrollY =distance.obs as double;
    }
  }
  /// 首页tabs分类
  Future<void> onTabChange(code, List tabs) async {
    isTabClick.value = true;
    currentTab.value = code;
    int tabIndex = tabs.indexWhere((element) => element.code == code);
    pageController.animateToPage(
        tabIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear
    ).then((value) => isTabClick.value = false);

  }
 /// 菜单 滑动
  Future<void> setMenuSliderIndex(int index) async {
    print('这是Menu$index');
    menuSliderIndex.value = index;
    print('这是滑动的值：${ menuSliderIndex.value}');
  }






}

class RefreshAction {
  late VoidCallback freshSuccess;
  late VoidCallback freshFail;
  RefreshAction(this.freshSuccess, this.freshFail);
}
typedef VoidCallback = void Function();

typedef ValueCallback<T> = void Function(T value);