
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/detail/detail_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget skuInfo(BuildContext context, Key key, DetailController detail) {
  return Container(
    width: getScreenWidth(context) - 24,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: detail.thumbWidth.value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${detail.bannerList.length}色可选",
                style: TextStyle(color: CommonStyle.color545454, fontSize: 18),
              ),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: detail.bannerList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelect = false;

                        return GestureDetector(
                            onTap: () => {},
                            child: Container(
                              width: detail.thumbWidth.value,
                              height: detail.thumbWidth.value,
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: isSelect ? CommonStyle.themeColor : Colors.transparent, width: 0.5)),
                              child: CachedNetworkImage(
                                height: detail.thumbWidth.value,
                                width: detail.thumbWidth.value,
                                imageUrl: detail.bannerList[index].thumb!,
                                placeholder: (context, url) => assetImage("images/default.png", detail.thumbWidth.value, detail.thumbWidth.value),
                                errorWidget: (context, url, error) => assetImage("images/default.png", detail.thumbWidth.value, detail.thumbWidth.value),
                                fit: BoxFit.fill,
                              ),
                            ));
                      }))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: const Text(
            "￥",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          "",
          maxLines: 2,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}