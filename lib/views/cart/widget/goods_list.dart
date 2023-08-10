

import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/goods_item.dart';

double width = 0;

Widget goodsList(BuildContext context, CartController cart) {
  width = (getScreenWidth(context) - 20) / 2;

  return SliverMasonryGrid.count(
        childCount:0,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 0,
        itemBuilder: (context, index) => goodsItem(context, [], width),
      );
}