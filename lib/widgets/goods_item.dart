import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/common_controller.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/color_util.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/widgets/carousel/carousel_widget.dart';
import 'package:mortalheart_mall/widgets/carousel/helpers/flutter_carousel_options.dart';
import 'package:mortalheart_mall/widgets/carousel/indicators/circular_wave_slide_indicator.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:mortalheart_mall/widgets/video_widget.dart';

Widget goodsItem(BuildContext context,  item, double width) {
  final common = Get.put(CommonController());
  double carouselWidth = getScreenWidth(context) - 24;
  final bannerList =[{
    "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/218369/27/14203/132191/6226a702E5a0b9236/a11294e884bc7635.jpg!cr_1053x420_4_0!q70.jpg",
    "type": "1"
  },
    {
      "imgUrl": "https://m15.360buyimg.com/mobilecms/jfs/t1/158791/25/27003/106834/620c4bc2Efb15fc57/7c89841a597ce41b.jpg!cr_1053x420_4_0!q70.jpg",
      "type": "2"
    },
    ];
  if (item.type == "4") {
    return  GestureDetector(
        onTap: ()=> common.goodsDetailPage(item),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(left: 3, right: 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 0), // 偏移量
                  blurRadius: 10,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(
               width:width,
               height:width,
               child:VideoWidget(url: item.imgUrl!,),
             ),
            Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6,left: 6),
                    child: Text(
                        item.description.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtil.hex2Color('#737473'),
                            fontSize: 14
                        )
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("￥${item.price.toString()}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: ColorUtil.hex2Color('#ED4637'), fontSize: 14)),
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                              color: ColorUtil.hex2Color('#F4F4F5'),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
                            ),
                            child: Text("看相似", style: TextStyle(color: ColorUtil.hex2Color('#A4A5A4'), fontSize: 12)),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        )
    );
  } else if (item.type == "3") {
      return Container(
        width: getScreenWidth(context),
          decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
        ),
    child:Carousel(
          options: CarouselOptions(
            height: 230,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            slideIndicator: CircularWaveSlideIndicator(
                itemSpacing: 13,
                indicatorRadius: 4,
                indicatorBorderWidth: 12,
                currentIndicatorColor: CommonStyle.themeColor,
                indicatorBackgroundColor: Colors.grey
            ),
          ),
          items: bannerList.map((item) {
            return GestureDetector(
                onTap:  ()=> common.goodsbannerDetailPage(item),
                child: SizedBox(
                    width: width,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl: item['imgUrl']!,
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
  }else{
    return GestureDetector(
        onTap: ()=> common.goodsDetailPage(item),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(left: 3, right: 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 0), // 偏移量
                  blurRadius: 10,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                child: CachedNetworkImage(
                  imageUrl: item.imgUrl!,
                  placeholder: (context, url) => assetImage("images/default.png", width, width),
                  errorWidget: (context, url, error) => assetImage("images/default.png", width, width),
                  fit: BoxFit.fill,
                ),
              ),
              item.type == "2"
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10,left: 10),
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: ColorUtil.hex2Color('#ED4637'),
                      gradient: LinearGradient(colors: [ColorUtil.hex2Color("#E44746"), ColorUtil.hex2Color("#E3909B")]),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(item.tag.toString(), style: const TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2,left: 10),
                    padding: const EdgeInsets.only(left: 0, right: 6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Text(item.des1.toString(), style: TextStyle(color: ColorUtil.hex2Color('#ED4637'), fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2,left: 10),
                    padding: const EdgeInsets.only(left: 0, right: 6),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Text(item.des2.toString(), style: TextStyle(color: ColorUtil.hex2Color('#737473'), fontSize: 14)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2,left: 10),
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    decoration: BoxDecoration(
                      color: ColorUtil.hex2Color('#FDF4F0'),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Text("点击进入", style: TextStyle(color: ColorUtil.hex2Color('#ED4637'), fontSize: 12)),
                  ),
                ],
              )
                  : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6,left: 6),
                    child: Text(
                        item.description.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: ColorUtil.hex2Color('#737473'),
                            fontSize: 14
                        )
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("￥${item.price.toString()}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: ColorUtil.hex2Color('#ED4637'), fontSize: 14)),
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                              color: ColorUtil.hex2Color('#F4F4F5'),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
                            ),
                            child: Text("看相似", style: TextStyle(color: ColorUtil.hex2Color('#A4A5A4'), fontSize: 12)),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        )
    );
  }

}
