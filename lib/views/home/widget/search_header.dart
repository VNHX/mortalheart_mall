

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/marquee_widget.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget searchHeader(BuildContext context, HomeController controller) {
    // TODO: implement build
   return SliverPersistentHeader(
     pinned: true,
     delegate: SliverHeaderDelegate(
       maxHeight: 85 + getStatusHeight(context),
       minHeight: 85 + getStatusHeight(context),
       child: Container(
         // color: CommonStyle.themeColor,
         decoration:  BoxDecoration(
           gradient: LinearGradient(
             colors: [
               CommonStyle.gradientleftColor,
               CommonStyle.gradientRightColor,
               CommonStyle.gradientbottomColor,
             ],
           ),
         ),
         padding: EdgeInsets.only(top: getStatusHeight(context)),
         child:  Stack(
           alignment: Alignment.center,
           fit: StackFit.expand,
             children: <Widget>[
                Positioned(
                 top: 10,
                 left: 18,
                 child: Container(
                   child: const Text('logo'),
                 ),
               ),
                Positioned(
                 top: 10,
                 right: 18,
                 child:  Row(
                     children: <Widget>[
                       Container(
                         margin: const EdgeInsets.only(right: 8),
                         child: const Text('消费'),
                       ),
                       Container(
                         child: const Text('消息'),
                       ),
                     ]
                 ),
               ),
               Positioned(
                   top: 40,
                   child: Container(
                     height: 35,
                     padding: const EdgeInsets.only(left: 4,right: 4),
                     width: MediaQuery.of(context).size.width - 28,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.white,
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         const SizedBox(
                             width: 40,
                             height: 35,
                             child: UnconstrainedBox(
                               child:
                               Text('搜索'),
                             )
                         ),
                         Expanded(
                           flex: 1,
                           child: Container(
                             height: 34.0,
                             alignment: Alignment.centerLeft,
                             child: InkWell(
                               onTap: () => {},
                               child: buildMarqueeWidget(controller),
                             ),
                           ),
                         ),
                         const SizedBox(
                             width: 34,
                             height: 34,
                             child: UnconstrainedBox(
                               child:Text('12'),
                             )
                         ),
                         const SizedBox(
                           width: 1,
                           height: 12,
                           child: DecoratedBox(
                             decoration:
                             BoxDecoration(color: Colors.black12),
                           ),
                         ),
                         const SizedBox(
                             width: 34,
                             height: 34,
                             child: UnconstrainedBox(
                               child: Text('扫码'),
                             )
                         ),
                       ],
                     ),
                   )
               )
             ]
         ),
       ),
     ),

   );
  }
MarqueeWidget buildMarqueeWidget(HomeController controller) {
  List itemStr =controller.searchList ?? [];

  ///上下轮播 安全提示
  return MarqueeWidget(
    //子Item构建器
    itemBuilder: (BuildContext context, int index) {
      //通常可以是一个 Text文本
      return Text(
        itemStr[index],
        textAlign: TextAlign.left,
        style: TextStyle(color: CommonStyle.searchColor, height: 2.0),
      );
    },
    //循环的提示消息数量
    count: itemStr.length,
  );
}