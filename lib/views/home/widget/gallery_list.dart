import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/carousel/carousel_widget.dart';
import 'package:mortalheart_mall/widgets/carousel/helpers/flutter_carousel_options.dart';
import 'package:mortalheart_mall/widgets/carousel/indicators/circular_wave_slide_indicator.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget galleryList(BuildContext context, HomeController controller) {
  double carouselWidth = getScreenWidth(context) - 24;
  if(controller.bannerList.value.isEmpty){
    return Container();
  }
  return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8)
        ),
      ),
      child:Carousel(
        options: CarouselOptions(
          height: 180,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 8),
          slideIndicator: CircularWaveSlideIndicator(
              itemSpacing: 13,
              indicatorRadius: 4,
              indicatorBorderWidth: 0,
              currentIndicatorColor: CommonStyle.themeColor,
              indicatorBackgroundColor: Colors.grey
          ),
        ),
        items: controller.bannerList.value.map((item) {
          return GestureDetector(
              onTap: () => {

              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: CachedNetworkImage(
                      imageUrl: item.imgUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => assetImage("images/default.png", carouselWidth, 168),
                      errorWidget: (context, url, error) => assetImage("images/default.png", carouselWidth, 168),
                    ),
                  )
              )
          );
        }).toList(),
      )
  );
}
