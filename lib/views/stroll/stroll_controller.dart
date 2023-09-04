
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StrollController extends GetxController{
  final ScrollController scrollController = ScrollController();
  /// 刷新
  final RefreshController refreshController = RefreshController();
  final isSelected = RxInt(0);
  /// tabs
  final tabs = RxList([
    {
      "name": "精选",
      "code": "1"
    },
    {
      "name": "新品",
      "code": "2"
    },
    {
      "name": "直播",
      "code": "3"
    },
    {
      "name": "实惠",
      "code": "4"
    },
    {
      "name": "进口",
      "code": "5"
    },
    {
      "name": "精选",
      "code": "6"
    },
    {
      "name": "新品",
      "code": "7"
    },
    {
      "name": "直播",
      "code": "8"
    },
    {
      "name": "实惠",
      "code": "9"
    },
    {
      "name": "进口",
      "code": "10"
    }
  ]);
  /// 当前选中Tabs
  final currentTab = '1'.obs;
  onTabTap(int i) {
    isSelected.value = i;
    print('我是点击：${isSelected.value}');
    update();
  }

  void refreshSuccess(RefreshController refreshController) {
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  void refreshFail(RefreshController refreshController) {
    refreshController.refreshFailed();
    refreshController.resetNoData();
  }

  void loadMoreAction() async{
    loadMoreSuccess(refreshController);
  }
  void loadMoreSuccess(RefreshController refreshController) {
    refreshController.refreshCompleted();
  }
  void loadMoreFail(RefreshController refreshController) {
    refreshController.resetNoData();
  }

  onTabChange(code, RxList tabs) {
    currentTab.value = code;
    int tabIndex = tabs.indexWhere((element) => element.code == code);
  }
}