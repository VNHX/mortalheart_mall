
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/common_service.dart';
import 'package:mortalheart_mall/common/constant/index.dart';
import 'package:mortalheart_mall/models/cart_goods.dart';
import 'package:mortalheart_mall/models/goods_page_adders.dart';
import 'package:mortalheart_mall/models/goods_page_info.dart';
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
  //购物车商品数据
  final cartGoods = RxList([]);
  // 店铺全选
  final selectCartGoodsparamList = RxList([]);
  // 选中店铺----商品
  final selectCartGoodsList =RxList([]);
  // 商品数据
  final goodsList = RxList([]);
//商品数据
  GoodsPageInfo goodsPageInfo = GoodsPageInfo.fromJson({});
  /// 购物车全选
  final selectAllShow = RxBool(false);
  int currentPage = 1;
  final num = RxInt(0);
  final totalPrice = RxDouble(0);
  final isAncive = RxInt(1);

  late  GoodsInfo?  parms = {}.obs as GoodsInfo?;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intPage();
  }
  intPage() async{
    var list = {
      'list': [{
        'address': '北京市地质矿产勘查院',
        'detailed': '北京市海淀区西四环北路123号',
        'phone': '13847929103',
        'mobile': '(010)51560123',
        'name': '段蔚漪'
      }
      ]
    };
   final lists = GoogsPageAdders.fromJson(list ?? {});
    addersList.value = lists.list??[];
    var goodsLists = {
      "data": [
        {
          "storeName": "ASICS 旗舰店",
          "storeCode": "s01",
          "h5url": "https://shop.m.jd.com/shop/home?shopId=17529",
          "goodsList": [
            {
              "code": "s01g01",
              "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/223778/18/6959/168828/622cc318E47c3b663/753cd44c08858430.jpg!q70.dpg.webp",
              "description": "ASICS 亚瑟士 休闲鞋运动鞋舒适透气",
              "price": "890.00",
              "num": 1
            },
            {
              "code": "s01g02",
              "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/106053/8/25901/375428/622cc43dE7be3f2c7/8de7c9f9f9691068.jpg",
              "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
              "price": "590.00",
              "num": 1
            }
          ]
        },
        {
          "storeName": "SALOMON 官方旗舰店",
          "storeCode": "s02",
          "h5url": "https://shop.m.jd.com/shop/home?shopId=133306",
          "goodsList": [
            {
              "code": "s02g01",
              "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/174007/12/4609/59798/607947f3Ed185a0e8/339959c1bb02c110.jpg",
              "description": "塞洛蒙（Salomon）男款 户外运动轻便舒适网布透气排水浅滩涉水溯溪鞋 AMPHIB BOLD",
              "price": "798.00",
              "num": 2
            }
          ]
        }
      ]
    };

    final goods = (goodsLists['data'])?.map((e) => CartGoods.fromJson(e)).toList() ?? [];
    cartGoods.value = goods;
    CommonServiceApi.queryGoodsListByPage('', currentPage, pageSize).then((value) {
        List<GoodsList> goods = value.goodsList ?? [];
        goodsList.value = goods;
    });
  }
  isAddersOnTap(bool bool) {
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

  void loadMoreAction() async{
    loadMoreSuccess(refreshController);
  }
  void loadMoreSuccess(RefreshController refreshController) {
    refreshController.refreshCompleted();
  }
  void loadMoreFail(RefreshController refreshController) {
    refreshController.resetNoData();
  }
  /// 店铺全选
  void selectAllStoreGoodsAction(param0, bool bool, int section){
    //找到相应店铺的商品信息
    List selectList = selectCartGoodsList;
    CartGoods cGoods = cartGoods.firstWhere((element) => element.storeCode == param0);
    cGoods.goodsList?.forEach((element) {
      if (bool && !selectList.contains(element.code!)) {
        selectList.add(element.code!);
      } else if (!bool && selectList.contains(element.code!)) {
        selectList.removeAt(selectList.indexOf(element.code!));
      }
    });
  }
  /// 单独选中购物车中商品
  void selectCartGoodsAction(param0, int section, int index) {
    List selectList = selectCartGoodsList;
    if (!selectList.contains(param0)) {
      selectList.add(param0);
    } else {
      selectList.removeAt(selectList.indexOf(param0));
    }
    print(selectList);
    print(cartGoods[section].goodsList![index]);
    print(cartGoods[section].goodsList![index].code!);
  }
  /// 购物车修改商品数量
  RxList changeCartGoodsNumAction(param0, int value) {
   cartGoods.map((element) {
      List<GoodsInfo>? filterList = element.goodsList?.where((goods) => goods.code == param0).toList();
      if (filterList!.isNotEmpty) {
        int? index = element.goodsList?.indexWhere((goods) => goods.code == param0);
        filterList[0].num = value;
        element.goodsList?[index!] = filterList[0];
        print( element.goodsList?[index!]);
      }
      return element;
    }).toList();
   print('商品数量$value');
    return cartGoods;
  }
  // 购物车全选
  void selectAll(bool bool, bool? va) {
    selectAllShow.value = va!;
   //    cartGoods.map((element) {
   //        if(bool && !selectCartGoodsparamList.contains(element.storeCode)) {
   //          selectCartGoodsparamList.add(element.storeCode);
   //        }else if (!bool && selectCartGoodsparamList.contains(element.storeCode)){
   //          selectCartGoodsparamList.removeAt(selectCartGoodsparamList.indexOf(element.storeCode!));
   //        }
   //        element.goodsList?.forEach((item) {
   //          if (bool && !selectCartGoodsList.contains(item.code!)) {
   //            selectCartGoodsList.add(item.code!);
   //          } else if (!bool && selectCartGoodsList.contains(item.code!)){
   //            selectCartGoodsList.removeAt(selectCartGoodsList.indexOf(item.code!));
   //          }
   //        });
   //    }).toList();
   // if(bool){
   //   calcPrice(cartGoods,selectCartGoodsparamList);
   // }else{
   //   totalPrice.value = 0;
   //   num.value = 0;
   // }
  }

  void calcPrice(RxList cartGoods, RxList selectCartGoodsparamList,) {
    double money = 0;
    int? nums = 0;
    for (var element in selectCartGoodsparamList) {
      GoodsInfo? goodsInfo = getGoodsInfo(cartGoods, element);
      nums = goodsInfo!.num!;
      print('商品价格2：${goodsInfo.price }');
      print('商品总价格：${totalPrice.value}');
      num.value += nums!;
    }
  }

  GoodsInfo?  getGoodsInfo(RxList cartGoods, String goodsCode) {
    CartGoods cGoods = cartGoods.firstWhere((element) => goodsCode.contains(element.storeCode!));
     cGoods.goodsList?.forEach((item) {
       print('商品价格1：${item.price}');
       parms =item;
       totalPrice.value += item.num! * double.parse(item.price!);
    });
     return parms;
  }

}