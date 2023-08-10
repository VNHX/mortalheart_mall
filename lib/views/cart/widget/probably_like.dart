

import 'package:flutter/cupertino.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/cart/cart_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget probablyLikeImage(BuildContext context, CartController cart) {
  return SliverToBoxAdapter(
      child: Container(
        color: CommonStyle.colorF3F3F3,
        child: assetImage(
            'images/probably_like.png',
            getScreenWidth(context),
            50
        ),
      ));
}