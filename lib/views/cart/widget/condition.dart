import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget condition(BuildContext context, CartController cart) {
  return SliverPersistentHeader(
      pinned: false,
      delegate: SliverHeaderDelegate.fixedHeight(
        //固定高度
          height: 40,
          child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              color: CommonStyle.colorF1F1F1,
              child:   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Obx(()=>
                          Text(
                            "全部 0",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: cart.isAncive.value==1?CommonStyle.selectedMeuColor: CommonStyle.color333333
                            ),
                          ),
                      ),
                      onTap: ()=>{
                        cart.isAncive.value = 1
                      },
                    ),
                    InkWell(
                      child: Obx(() => Text(
                    "降价 0",
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: cart.isAncive.value==2?CommonStyle.selectedMeuColor: CommonStyle.color333333
                    ),
                    ),),
                      onTap: ()=>{
                        cart.isAncive.value =2
                      },
                    ),
                    InkWell(
                      child:  Obx(() => Text(
                        "筛选",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cart.isAncive.value==3?CommonStyle.selectedMeuColor: CommonStyle.color333333
                        ),
                      ),),
                      onTap: ()=>{
                        cart.isAncive.value =3
                      },
                    ),
                  ],
                ),
          ),
      ),
  );
}
