import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends GetView<MineController> {
  const MinePage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(MineController());
    return const Text('我的');
  }

}