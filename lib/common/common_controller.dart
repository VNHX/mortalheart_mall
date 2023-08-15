
import 'package:get/get.dart';
import 'package:mortalheart_mall/routes/routing_constants.dart';
import 'package:mortalheart_mall/type/webview_type.dart';

class CommonController extends GetxController{
  /// 跳转详情页
  /// ps：根据不同的 item.type 类型显示不同的功能
  /// 视频直播、跳转详情、第三方、活动页、品牌推荐等
  goodsDetailPage(item) {
    if(item.type=='1'){
      // 跳转详情
      Get.toNamed(Routes.detailRoute);
    } else if(item.type=='2'){
      // 第三方
      Get.toNamed(Routes.webViewRoute,arguments: WebViewPageArguments(item.h5url!));
    }else if(item.type=='4'){
      // 视频
      Get.toNamed(Routes.videoRoute);
    } else if(item.type=='5'){
      // 活动页
    } else if(item.type=='6'){
      // 品牌推荐
    } else{
    //
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  /// 商品轮播跳转
  goodsbannerDetailPage(Map<String, String> item) {
    print(item);
  }
}