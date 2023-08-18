
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget activitySlider(BuildContext context, HomeController controller){
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5,bottom: 5),
    child: activity(context),
  );
}

Widget activity(BuildContext context) {
  return Row(
    children: [
      Container(
        width: getScreenWidth(context) - 204,
        margin: const EdgeInsets.only(right: 2),
        padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            flashKilling(context),
            freeShipping(context),
          ],
        ),
      ),
      Container(
        width: getScreenWidth(context) - 204,
        margin: const EdgeInsets.only(left: 2),
        padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            liveBroadcast(context),
            buyVegetables(context),
          ],
        ),
      )
    ],
  );
}
// 包邮
Widget freeShipping(BuildContext context) {
  return Column(
    children: [
      const Text('包邮'),
      Container(
        width: 75,
        height: 90,
        margin: const EdgeInsets.only(top: 3),
        child: CachedNetworkImage(
          imageUrl:'https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/223778/18/6959/168828/622cc318E47c3b663/753cd44c08858430.jpg!q70.dpg.webp',
          placeholder: (context, url) =>
              assetImage("images/default.png", 73.0, 86.0),
          errorWidget: (context, url, error) =>
              assetImage("images/default.png", 73.0, 86.0),
          fit: BoxFit.fill,
        ),
      )
    ],
  );
}
/// 秒杀
Widget flashKilling(BuildContext context) {
  return Column(
      children: [
        const Text('秒杀'),
        Container(
          width: 75,
          height: 90,
          margin: const EdgeInsets.only(top: 3),
          child: CachedNetworkImage(
            imageUrl:'https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/208465/36/8682/93776/618a6339E208f6217/44fbee25f6b7d872.jpg',
            placeholder: (context, url) =>
                assetImage("images/default.png", 73.0, 86.0),
            errorWidget: (context, url, error) =>
                assetImage("images/default.png", 73.0, 86.0),
            fit: BoxFit.fill,
          ),
        )
      ],
  );
}
// 买菜
Widget buyVegetables(BuildContext context) {
  return Column(
      children: [
      const Text('买菜'),
      Container(
      width: 75,
      height: 90,
      margin: const EdgeInsets.only(top: 3),
        child: CachedNetworkImage(
          imageUrl:'https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/185796/23/23365/154983/625d9644E96e93807/0e30192ad676f8a8.jpg!q70.jpg.webp',
          placeholder: (context, url) =>
              assetImage("images/default.png", 73.0, 86.0),
          errorWidget: (context, url, error) =>
              assetImage("images/default.png", 73.0, 86.0),
          fit: BoxFit.fill,
        ),
      )
      ],
  );
}
/// 直播
Widget liveBroadcast(BuildContext context) {
  return Column(
    children: [
      const Text('直播'),
      Container(
        width: 75,
        height: 90,
        margin: const EdgeInsets.only(top: 3),
        child: CachedNetworkImage(
          imageUrl:'https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/106053/8/25901/375428/622cc43dE7be3f2c7/8de7c9f9f9691068.jpg',
          placeholder: (context, url) =>
              assetImage("images/default.png", 73.0, 86.0),
          errorWidget: (context, url, error) =>
              assetImage("images/default.png", 73.0, 86.0),
          fit: BoxFit.fill,
        ),
      )
    ],
  );
}