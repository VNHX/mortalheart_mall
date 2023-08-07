

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/marquee_widget.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget searchHeader(BuildContext context) {
    // TODO: implement build
   Get.put(HomeController());
   return SliverPersistentHeader(
     pinned: true,
     delegate: SliverHeaderDelegate(
       maxHeight: 88 + getStatusHeight(context),
       minHeight: 44 + getStatusHeight(context),
       child: Container(
         color: CommonStyle.themeColor,
         padding: EdgeInsets.only(top: getStatusHeight(context)),
         child:  Stack(
           alignment: Alignment.center,
           fit: StackFit.expand,
             children: <Widget>[
               const Positioned(
                 top: 0,
                 left: 18,
                 child: Text('LOGO'),
               ),
               const Positioned(
                 top: 0,
                 right: 18,
                 child: Text('扫码'),
               ),
               Positioned(
                   top:calc2Top(HomeController.pageScrollY.value),
                   child: Container(
                     height: 35,
                     width: MediaQuery.of(context).size.width -
                         calcWidth(HomeController.pageScrollY.value),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
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
                               child: buildMarqueeWidget(),
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
MarqueeWidget buildMarqueeWidget() {
  List itemStr =HomeController.searchList ?? [];

  ///上下轮播 安全提示
  return MarqueeWidget(
    //子Item构建器
    itemBuilder: (BuildContext context, int index) {
      //通常可以是一个 Text文本
      return Text(
        itemStr[index],
        textAlign: TextAlign.left,
        style: TextStyle(color: CommonStyle.selectedTabColor, height: 2.0),
      );
    },
    //循环的提示消息数量
    count: itemStr.length,
  );
}