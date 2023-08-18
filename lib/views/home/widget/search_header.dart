

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/marquee_widget.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget searchHeader(BuildContext context, HomeController controller) {
    // TODO: implement build
   return SliverPersistentHeader(
     pinned: true,
     delegate: SliverHeaderDelegate(
       maxHeight: 60 + getStatusHeight(context),
       minHeight: 60 + getStatusHeight(context),
       child: _headerBackground(context,controller)
     ),

   );
  }
Widget search(BuildContext context, HomeController controller) {
  return  Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        if(controller.headerBackgroundImage.value.isNotEmpty)
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          left: 0,
          child: CachedNetworkImage(
            width: getScreenWidth(context),
            height:60 + getStatusHeight(context),
            fit: BoxFit.cover,
            imageUrl: controller.headerBackgroundImage.value ?? '',
            placeholder: (context, url) => assetImage("images/default.png", 25, 25),
            errorWidget: (context, url, error) => assetImage("images/default.png", 25, 25),
          ),
        ),
        Positioned(
          top:45,
          left: 18,
          child: CachedNetworkImage(
            width: 25,
            height: 25,
            fit: BoxFit.cover,
            imageUrl: 'https://m15.360buyimg.com/mobilecms/jfs/t1/104637/39/25735/190791/622f3682E168960d2/2dbfbaf4147134c1.gif',
            placeholder: (context, url) => assetImage("images/default.png", 25, 25),
            errorWidget: (context, url, error) => assetImage("images/default.png", 25, 25),
          ),
        ),
        Positioned(
          top: 45,
          right: 18,
          child:  Row(
              children: <Widget>[
                // Container(
                //   margin: const EdgeInsets.only(right: 8),
                //   child: const Text('消费'),
                // ),
                SizedBox(
                  width: 25,
                  height: 25,
                  child: assetImage('images/message.png', 25, 25),
                ),
              ]
          ),
        ),
        Positioned(
            bottom: 10,
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
                  SizedBox(
                      width: 40,
                      height: 35,
                      child: UnconstrainedBox(
                          child: assetImage('images/search.png', 20, 20)
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
                  SizedBox(
                      width: 34,
                      height: 34,
                      child: UnconstrainedBox(
                        child:assetImage('images/camera.png', 20, 20),
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
                  SizedBox(
                      width: 34,
                      height: 34,
                      child: UnconstrainedBox(
                        child: assetImage('images/scan.png', 20, 20),
                      )
                  ),
                ],
              ),
            )
        )
      ]
  );
}

Widget _headerBackground(BuildContext context, HomeController controller) {
  Widget container =  controller.headerBackgroundImage.value.isNotEmpty?Container(
        child: search(context,controller),
  ):Container(
    decoration:  BoxDecoration(
      gradient: LinearGradient(
        colors: [
          CommonStyle.gradientleftColor,
          CommonStyle.gradientRightColor,
          CommonStyle.gradientbottomColor,
        ],
      ),
    ),
    // padding: EdgeInsets.only(top: getStatusHeight(context)),
    child: search(context,controller),
  );
  return  container;
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