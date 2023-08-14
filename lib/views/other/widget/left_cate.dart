
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/other/other_controller.dart';
double itemHeight = 62.0;
Widget leftCate(BuildContext context, OtherController other) {
  Widget scrollTabList = ListView.builder(
      controller: other.scrollController,
      itemCount: other.classlist.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              other.selectedCategoryInfo?.current = index - 1 >= 0 ? other.classlist[index - 1] : null;
              other.selectedCategoryInfo?.current = other.classlist[index];
              other.selectedCategoryInfo?.next = index + 1 <= other.classlist.length - 1 ? other.classlist[index + 1] : null;
              other.scrollController.animateTo(calc2Top(context, index, other.classlist.length),
                  duration: const Duration(milliseconds: 200), curve: Curves.linear);
            },
            child:Obx(()=>
                Container(
                  height: itemHeight,
                  decoration: BoxDecoration(
                      color: other.isSelect.value ? Colors.white : CommonStyle.greyBgColor3,
                      borderRadius:
                      BorderRadius.only(
                          bottomRight: Radius.circular(other.isPrev.value ? 20 : 0),
                          topRight: Radius.circular(other.isNext.value ? 20 : 0)
                      )
                  ),
                  child: Center(
                    child: Text(
                        other.classlist[index].name!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ),
                )
            )
        );
      });

  return Expanded(flex: 1, child: scrollTabList);
}

double calc2Top(BuildContext context, int index, int total) {
  //展示高度，即ListView展示高度
  double displayHeight = getScreenHeight(context) - 50 - getStatusHeight(context) - 56 - getBottomSpace(context);
  //item距离ListView顶部距离
  double item2Top = itemHeight * index;
  //item总高度
  double totalItemHeight = itemHeight * total;

  //所需滚动距离
  double distance = item2Top < displayHeight / 2 ? 0.0 : item2Top - displayHeight / 2 + itemHeight;
  //如果滚动距离大于 ListView item总高度 减掉 展示高度，则只能滚动item总高度 减掉 展示高度
  if (distance > totalItemHeight - displayHeight) {
    distance = totalItemHeight - displayHeight;
  }
  return distance;
}