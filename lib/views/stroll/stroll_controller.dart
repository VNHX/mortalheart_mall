
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StrollController extends GetxController{
  final ScrollController scrollController = ScrollController();
  final isSelected = RxInt(0);

  onTabTap(int i) {
    isSelected.value = i;
    print('我是点击：${isSelected.value}');
    update();
  }
}