import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/views/stroll/widget/srtoll_hader.dart';
import 'package:mortalheart_mall/views/stroll/widget/stroll_widget.dart';

import 'stroll_controller.dart';

class StrollPage extends GetView<StrollController> {
  const StrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stroll =  Get.put(StrollController());
    print('我是点击之后的值2：${stroll.isSelected.value}');
    return  Column(
      children: [
        strollHeader(context,stroll),
        strollWidget(context,stroll)
      ],
    );
  }
}