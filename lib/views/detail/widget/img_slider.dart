
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/detail/detail_controller.dart';
import 'package:mortalheart_mall/widgets/carousel/carousel_widget.dart';
import 'package:mortalheart_mall/widgets/carousel/helpers/flutter_carousel_options.dart';
import 'package:mortalheart_mall/widgets/carousel/indicators/circular_wave_slide_indicator.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget imgSlider(BuildContext context, Key key, DetailController detail) {
  final double statusHeight = getStatusHeight(context);
  final double imgHeight = getScreenHeight(context) / 2 - statusHeight - getBottomSpace(context);
  final double screenWidth = getScreenWidth(context);
  final List<Widget> sliders = detail.imgList
      .map((url) =>
      CachedNetworkImage(
      height: imgHeight,
      width: screenWidth,
      imageUrl: url,
      placeholder: (context, url) => assetImage("images/default.png", screenWidth,imgHeight),
      errorWidget: (context, url, error) => assetImage("images/default.png", screenWidth,imgHeight),
      fit: BoxFit.fill,
    )
  ).toList();

  return Container(
      height: imgHeight,
      width: getScreenWidth(context),
      margin: EdgeInsets.only(top: statusHeight),
      child: Carousel(
        options: CarouselOptions(
          height: imgHeight,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 12),
          slideIndicator: CircularWaveSlideIndicator(
              itemSpacing: 14,
              indicatorRadius: 4,
              indicatorBorderWidth: 0,
              currentIndicatorColor: CommonStyle.themeColor,
              indicatorBackgroundColor: Colors.grey),
        ),
        items: sliders,
      )
  );
}
