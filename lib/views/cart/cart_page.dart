

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/cart/widget/cart_goods.dart';
import 'package:mortalheart_mall/views/cart/widget/cart_header.dart';
import 'package:mortalheart_mall/views/cart/widget/condition.dart';
import 'package:mortalheart_mall/views/cart/widget/goods_list.dart';
import 'package:mortalheart_mall/views/cart/widget/probably_like.dart';
import 'package:mortalheart_mall/views/cart/widget/total_settlement.dart';
import 'package:mortalheart_mall/widgets/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   final cart = Get.put(CartController());
    return  Column(
      children: [
        cartHeader(context,cart),
        Expanded(
          child: cart.isLoading.value
              ? loadingWidget(context)
              : Scaffold(
            backgroundColor: CommonStyle.colorF3F3F3,
            body: SmartRefresher(
              controller:cart.refreshController,
              enablePullUp: true,
              header: const ClassicHeader(
                spacing: 10,
                height: 58,
              ),
              onRefresh: () async {
                cart.refreshSuccess(cart.refreshController);
                cart.refreshFail(cart.refreshController);
              },
              onLoading: () async {
                cart.loadMoreAction();
                cart.loadMoreSuccess(cart.refreshController);
                cart.loadMoreFail(cart.refreshController);
              },
              child: CustomScrollView(
                controller: cart.scrollController,
                slivers:  [
                  condition(context,cart),
                  cartGoods(context,cart),
                  probablyLikeImage(context,cart),
                  goodsList(context,cart),
                ],
              ),
            ),
          ),
        ),
        totalSettlement(context)
      ],
    );
  }
}

