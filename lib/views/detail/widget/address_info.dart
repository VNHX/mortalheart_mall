
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/detail/detail_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

double screenWidth = 0;

Widget addressInfo(BuildContext context, Key key, DetailController detail) {
  screenWidth = getScreenWidth(context);
  return Container(
    width: getScreenWidth(context) - 24,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowItem("选择", "已选：2, 42, 1件", 1, true, null),
        rowItem("送至", "江苏省南京市江宁区东山街道丰泽路118号中粮鸿云", 1, true, "今天17:00前完成下单，预计明天送达"),
        rowItem("运费", "店铺单笔订单不满199元，收费5元(请以提交订单时为准)", 2, false, null),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: detail.tagList.map((e) => tagLabel(e)).toList(),
          ),
        )
      ],
    ),
  );
}

Widget rowItem(String label, String text, int line, bool showArrow, String? des) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: CommonStyle.color8B8C8A, fontSize: 18)),
                Container(
                    width: screenWidth - 110,
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(text, maxLines: line, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18))),
              ],
            ),
            // showArrow ? assetImage("images/detail/ic_arrow_right.png", 8, 24) : Container()
          ],
        ),
        des != null
            ? Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            des,
            style: const TextStyle(fontSize: 18),
          ),
        )
            : Container()
      ],
    ),
  );
}

Widget tagLabel(String label) {
  return Text(label, style: TextStyle(fontSize: 16, color: CommonStyle.color8B8C8A));
}
