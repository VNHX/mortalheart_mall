
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/constant/index.dart';
import 'package:mortalheart_mall/models/goods_page_adders.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController = RefreshController();
  /// 加载
  final isLoading = RxBool(false);
  // 配送默认地址
  final isCheckAdders = RxString('北京市海淀区西四环北路123号');
  // 是否编辑
  final isAdders = RxBool(false);
  // 地址数据
  final addersList = RxList([]);
  int currentPage = 1;
  final isAncive = RxInt(1);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intPage();
    print('初始化2');
  }
  intPage() async{
    var list = {
      'list': [{
        'address': '北京市地质矿产勘查院',
        'detailed': '北京市海淀区西四环北路123号',
        'phone': '13847929103',
        'mobile': '(010)51560123',
        'name': '段蔚漪'
      }, {
        'address': '古城小街五号院-特钢小区',
        'detailed': '古城小街5号',
        'phone': '15762283442',
        'mobile': '',
        'name': '解习舒'
      }, {
        'address': '白庙村-停车场',
        'detailed': '北京市昌平区海白路北七家镇白庙村民委员会',
        'phone': '15171166435',
        'mobile': '',
        'name': '范忆葵'
      }, {
        'address': '中央戏剧学院(昌平校区)',
        'detailed': '北京市昌平区宏福中路4号',
        'phone': '17041782453',
        'mobile': '',
        'name': '倪瑜蒙'
      }, {
        'address': '育新花园',
        'detailed': '北京市海淀区育新花园西路与建材城西路东南角',
        'phone': '15762283442',
        'mobile': '',
        'name': '卫言雅'
      }
      ]
    };
   final lists = GoogsPageAdders.fromJson(list ?? {});
   print(lists.list);
    addersList.value = lists.list??[];
  }
  isAddersOnTap(bool bool) {
    print(bool);
    isAdders.value = bool;
  }

  void refreshSuccess(RefreshController refreshController) {
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  void refreshFail(RefreshController refreshController) {
    refreshController.refreshFailed();
    refreshController.resetNoData();
  }

}