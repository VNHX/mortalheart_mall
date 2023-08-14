
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/other/other_controller.dart';
import 'package:mortalheart_mall/views/other/widget/left_cate.dart';
import 'package:mortalheart_mall/views/other/widget/right_group.dart';
import 'package:mortalheart_mall/widgets/loading_widget.dart';

class ClassificationPage extends GetView<OtherController>{
  const ClassificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final other = Get.put(OtherController());
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: const Text(
           '分类',
       ),
       backgroundColor: CommonStyle.gradientRightColor,//设置AppBar背景颜色
         actions: [
           IconButton(
             icon: const Icon(Icons.search),
             tooltip: "Search",
             onPressed: (){
               print("Search Pressed");
             },
           ),
         ],
     ),
     body: Column(
       children: [
         Expanded(
             child: other.isLoading.value
                 ? loadingWidget(context)
                 : Flex(
               direction: Axis.horizontal,
               children: [leftCate(context,other), rightGroupList(context,other)],
             )
         ),
       ],
     ),
   );
  }
  
}