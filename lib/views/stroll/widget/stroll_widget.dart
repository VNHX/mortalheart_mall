


import 'package:flutter/cupertino.dart';
import 'package:mortalheart_mall/views/stroll/stroll_controller.dart';

Widget strollWidget (BuildContext context, StrollController stroll){
  print('我是点击之后的值：${stroll.isSelected.value}');
  late Text strollConent;
  if(stroll.isSelected.value==0){
    strollConent =    Text('关注');
  }
  if(stroll.isSelected.value==2){
    strollConent = Text('推荐');
  }
  if(stroll.isSelected.value==3){
    strollConent = Text('视频');
  }
  return strollConent;
}