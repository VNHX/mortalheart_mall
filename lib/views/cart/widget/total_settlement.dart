

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/linear_button.dart';

Widget totalSettlement(BuildContext context, CartController cart) {
  return Container(
      height: 58,
      width: getScreenWidth(context),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: CommonStyle.colorE6E6E6, width: 0.5),
              bottom: BorderSide(color: CommonStyle.colorE6E6E6, width: 0.5))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Obx(() =>
                      Container(
                        width: 28,
                        margin: const EdgeInsets.only(left: 12),
                        child: Checkbox(
                            value: cart.selectAllShow.value,
                            shape: const CircleBorder(),
                            activeColor: Colors.red,
                            onChanged: (bool? va) {
                              cart.selectAll(!cart.selectAllShow.value,va);

                            }),
                      )
                  ),
                  const Text("全选"),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Text("合计："),
                  ),
                  Text("",
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ],
              )),
          Container(
            width: 150,
            height: 58,
            alignment: Alignment.center,
            child: LinearButton(
                width: 130,
                height: 42,
                btnName: '去结算',
                onTap: () {

                }),
          )
        ],
      ),
    );
}


class TotalInfo {
  double price;
  int num;

  TotalInfo(this.price, this.num);
}
