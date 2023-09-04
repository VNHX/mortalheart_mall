import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/views/stroll/widget/srtoll_hader.dart';
import 'package:mortalheart_mall/views/stroll/widget/stroll_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'stroll_controller.dart';

class StrollPage extends GetView<StrollController> {
  const StrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stroll =  Get.put(StrollController());
    return Scaffold(
      body: NotificationListener(
        child: Column(
          children: [
            strollHeader(context,stroll),
            Obx(() => strollWidget(context,stroll))
          ],
        ),
      )
    );
  }
}