

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/util/color_util.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/models/goods_page_info.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget subsidySlider(BuildContext context, HomeController controller){
  return  Container(
      margin: const EdgeInsets.only(left: 5, right: 5,bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 0), // 偏移量
                blurRadius: 5,
              )
            ]),
        child:subsidy(context),
      ),
      );
}
Widget subsidy(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 50.0,
        height: 50.0,
        margin: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
        child:  CachedNetworkImage(
          imageUrl:'https://m15.360buyimg.com/mobilecms/jfs/t1/102632/18/20350/13255/61e131feE788947ef/c391b8590cdf427e.png!q70.jpg',
          placeholder: (context, url) =>
              assetImage("images/default.png", 73.0, 86.0),
          errorWidget: (context, url, error) =>
              assetImage("images/default.png", 73.0, 86.0),
          fit: BoxFit.fill,
        ),
      ),
      Expanded(flex: 1, child: subsidyPageList(context)),
    ],
  );
}
Widget subsidyPageList(BuildContext context) {
  var res = {
    "data": {
      "goodsList": [
        {
          "imgUrl":
          "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/223778/18/6959/168828/622cc318E47c3b663/753cd44c08858430.jpg!q70.dpg.webp",
          "tag": "时尚运动",
          "des1": "活动惊爆价",
          "des2": "实惠好货等你抢",
          "price": "199.00",
        },
        {
          "imgUrl":
          "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/208465/36/8682/93776/618a6339E208f6217/44fbee25f6b7d872.jpg",
          "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
          "price": "799.00",
        },
        {
          "imgUrl":
          "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/185796/23/23365/154983/625d9644E96e93807/0e30192ad676f8a8.jpg!q70.jpg.webp",
          "tag": "好物集市",
          "des1": "专业运动装备",
          "des2": "运动与你相伴",
          "price": "799.00",
        },
        {
          "imgUrl":
          "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/106053/8/25901/375428/622cc43dE7be3f2c7/8de7c9f9f9691068.jpg",
          "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
          "price": "590.00",
        },
      ],
      "totalCount": 48,
      "totalPageCount": 3
    }
  };
  final value = GoodsPageInfo.fromJson(res['data'] ?? {});
  List<GoodsList> goods = value.goodsList ?? [];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:MainAxisAlignment.center,
      children: List.generate(
        goods.length,
            (index) => Container(
          width: 78,
          margin: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: goods[index].imgUrl!,
                placeholder: (context, url) =>
                    assetImage("images/default.png", 78.0, 78.0),
                errorWidget: (context, url, error) =>
                    assetImage("images/default.png", 78.0, 78.0),
                fit: BoxFit.fill,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getScreenWidth(context),
                    decoration: BoxDecoration(
                      color: ColorUtil.hex2Color('#ED4637'),
                      gradient: LinearGradient(colors: [
                        ColorUtil.hex2Color("#E44746"),
                        ColorUtil.hex2Color("#E3909B")
                      ]),
                    ),
                    child: Text('已补贴${goods[index].price.toString()}',
                        style:
                        const TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                  Text('￥${goods[index].price.toString()}',
                      style: TextStyle(
                          color: ColorUtil.hex2Color('#ED4637'),
                          fontSize: 12
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
}
