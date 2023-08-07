import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';

Widget galleryList(BuildContext context) {
  double carouselWidth = getScreenWidth(context) - 24;

  return Container(
      color: CommonStyle.themeColor,
      padding: const EdgeInsets.only(top: 5),
      child: Container(
          padding: const EdgeInsets.only(top: 4),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          child:const Text('11111111111111')
      )
  );
}
