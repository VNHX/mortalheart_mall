import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/util/color_util.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget goodsItem(BuildContext context,  item, double width) {
  return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        margin: const EdgeInsets.only(left: 5, right: 5),
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
                  padding: const EdgeInsets.only(left: 5, right: 6),
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
