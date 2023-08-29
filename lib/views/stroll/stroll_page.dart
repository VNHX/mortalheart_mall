import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';

import 'stroll_controller.dart';

class StrollPage extends GetView<StrollController> {
  const StrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StrollController());
    return  Scaffold(
      backgroundColor: CommonStyle.splashColor,
      body:const Text('逛一逛')
    );
  }
}