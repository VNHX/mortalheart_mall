import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return  Scaffold(
      backgroundColor: CommonStyle.splashColor,
      body: Stack(
          alignment: const Alignment(1.0, 1.0), // 右上角对齐
          children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child:const Text(
              "图片"
            ),
          ),
             const SizedBox(
              child: Text('跳转'),
            )
        ]
      ),
    );
  }
}
