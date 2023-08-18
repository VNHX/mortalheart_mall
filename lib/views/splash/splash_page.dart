import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  /// 首次加载---
  /// 根据类型展示不同的广告模板
  /// 在最小化的时候，记录是否首次打开App：首次加载广告图否则直接进入首页
  /// 点击广告图，可以进入详情页或者打开第三方商城
  /// 如果默认倒计时结束跳转 首页
  @override
  Widget build(BuildContext context) {
   final splash =  Get.put(SplashController());
    return  Scaffold(
      body: Stack(
          alignment: const Alignment(0.95,-0.8), // 右上角对齐
          children: [
        InkWell(
          onTap: ()=>splash.splashPageToName(),
          child:   ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child:assetImage(
                "images/16pic_6048589_b.jpg",
                getScreenWidth(context),
                getScreenHeight(context)
            ),
          ),
        ),
              Container(
              width: 60,
              height: 30,
              decoration:  BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(50)
              ),
              child: InkWell(
                    onTap: ()=>splash.navigationPage(),
                    child: Obx(() =>  Text(
                      '跳过 ${splash.time.value!}',
                      style: const TextStyle(
                          color: Colors.white,
                          height: 2
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            )
        ]
      ),
    );
  }
}
