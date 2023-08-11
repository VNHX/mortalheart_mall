

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/mine/mine_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget orderCard(BuildContext context, MineController mieController) {
  return Container(
          height: 142,
          width: getScreenWidth(context) - 20,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  horizontalItem("images/goods_star.png", "商品收藏0"),
                  line(1, 12),
                  horizontalItem("images/store_focus.png", "店铺关注16"),
                  line(1, 12),
                  horizontalItem("images/look_history.png", "浏览记录20")
                ],
              ),
              line(getScreenWidth(context) - 50, 1),
              Flex(direction: Axis.horizontal, children: [
                verticalItem("images/todo_pay.png", "待付款"),
                verticalItem("images/todo_get.png", "待收货"),
                verticalItem("images/todo_evaluate.png", "待评价"),
                verticalItem("images/todo_exchange.png", "退换/售后")
              ])
            ],
          )
  );
}

Widget horizontalItem(String iconPath, String text) {
  return Expanded(
      flex: 1,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            assetImage(iconPath, 20, 20),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ));
}

Widget verticalItem(String iconPath, String text) {
  return Expanded(
      flex: 1,
      child: SizedBox(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            assetImage(iconPath, 42, 42),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ));
}

Widget line(double w, double h) {
  return Container(
    width: w,
    height: h,
    color: CommonStyle.colorF1F1F1,
  );
}