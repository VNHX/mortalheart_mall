
import 'package:flutter/cupertino.dart';
import 'package:mortalheart_mall/views/detail/detail_controller.dart';
import 'package:mortalheart_mall/views/detail/widget/address_info.dart';
import 'package:mortalheart_mall/views/detail/widget/img_slider.dart';
import 'package:mortalheart_mall/views/detail/widget/sku_info.dart';

Widget goodsInfo(BuildContext context, Key key, DetailController detail) {
  return SliverToBoxAdapter(
      child: Column(
        key: key,
        children:  [imgSlider(context,key,detail),skuInfo(context,key,detail),addressInfo(context,key,detail)],
      )
  );
}