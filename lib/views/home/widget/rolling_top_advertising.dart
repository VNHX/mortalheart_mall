
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget rollingTopAdvertising(BuildContext context, HomeController controller){
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeaderDelegate.fixedHeight(
        //固定高度
        height:55,
        child: Obx(() => controller.rollingTopAdvertisingShow.value? CachedNetworkImage(
          height: 120,
          imageUrl: controller.adUrl.value ?? "",
          placeholder: (context, url) => assetImage("images/default.png", getScreenWidth(context) - 24, 100),
          errorWidget: (context, url, error) => assetImage("images/default.png", getScreenWidth(context) - 24, 100),
          fit: BoxFit.fill,
        ):Container()
        )
  )
    );
}