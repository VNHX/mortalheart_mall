
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/other/other_controller.dart';
import 'package:mortalheart_mall/widgets/group_grid_view.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

late double rWidth, bWidth;
//gridview的item宽和高一样
double thirdCateItemHeight = 0;

Widget rightGroupList(BuildContext context, OtherController other) {
 

  //右侧占屏幕三分之二
  rWidth = getScreenWidth(context) * 2 / 3;

  //gridview的item宽和高一样
  double thirdCateItemWidth = rWidth / 3;
  thirdCateItemHeight = thirdCateItemWidth;
  //右侧内容宽度
  bWidth = rWidth - 28;


  Widget topBanImg = other.headUrl.value != ""
      ? CachedNetworkImage(
    width: bWidth,
    height: 100,
    imageUrl: other.headUrl.value ?? '',
    placeholder: (context, url) => assetImage("images/default.png", bWidth, 100),
    errorWidget: (context, url, error) => assetImage("images/default.png", bWidth, 100),
    fit: BoxFit.cover,
  )
      : Container();


  Widget secondScrollTabCategory = Container(
      width: bWidth,
      height: 32,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
          controller: other.scrollController,
          itemCount: other.secondCateList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 32,
                  key: other.secondKeys[index],
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(right: index + 1 != other.secondCateList.length ? 8 : 0),
                  decoration: BoxDecoration(
                    color: other.isYcSelect.value ? CommonStyle.selectBgColor : CommonStyle.greyBgColor2,
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    border: Border.all(color: other.isYcSelect.value ? CommonStyle.selectedMeuColor : CommonStyle.greyBgColor2, width: 1),
                  ),
                  child: Text(
                    other.secondCateList[index].categoryName!,
                    style: TextStyle(
                        color: other.isYcSelect.value ? CommonStyle.selectedMeuColor : CommonStyle.primaryColor
                    ),
                  ),
                )
            );
          })
  );

  //使用WidgetsVisibilityProvider 、WidgetsVisibilityListener和VisibleNotifierWidget组合监听得到第一个可见元素 firstVisibleItem
  Widget groupThirdCategoryList = Expanded(
      child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.depth == 0) {

            }
            return false;
          },
          child: GroupGridView(
              controller: other.gridViewController,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0
              ),
              sectionCount: other.secondCateList.length,
              itemInSectionCount: (int section) => other.secondCateList[section].cateList!.length,
              itemInSectionBuilder: (BuildContext context, IndexPath indexPath) {
                return SizedBox(
                  width: thirdCateItemWidth,
                  height: thirdCateItemHeight,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        width: 50,
                        height: 50,
                        imageUrl: other.secondCateList[indexPath.section].cateList![indexPath.index].iconUrl!,
                        placeholder: (context, url) => assetImage("images/default.png", 58, 58),
                        errorWidget: (context, url, error) => assetImage("images/default.png", 58, 58),
                        fit: BoxFit.fill,
                      ),
                      Container(
                          height: 25,
                          margin: const EdgeInsets.only(top: 6),
                          child: Text(
                            other.secondCateList[indexPath.section].cateList![indexPath.index].categoryName!,
                            style: TextStyle(
                                fontSize: 12,
                                color: CommonStyle.color777677
                            ),
                          )
                      )
                    ],
                  ),
                );
              },
              headerForSection: (section) => Container(
                  key: other.keys[section],
                  height: 30,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(other.secondCateList[section].categoryName!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      )
                  )
              )
          )
      )
  );

  //右侧内容宽度
  bWidth = rWidth - 28;
  return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            topBanImg,
            secondScrollTabCategory,
            groupThirdCategoryList
          ],
        ),
      )
  );
}

int findFirstVisibleItemIndex(List<GlobalKey<State<StatefulWidget>>> keys) {
  int i = 0;
  for (; i < keys.length; i++) {
    //滚动三级分类
    RenderSliverToBoxAdapter? keyRenderObject = keys[i].currentContext?.findAncestorRenderObjectOfType<RenderSliverToBoxAdapter>();
    if (keyRenderObject != null) {
      //距离CustomScrollView顶部距离， 上滚出可视区域变为0
      final offsetY = (keyRenderObject.parentData as SliverPhysicalParentData).paintOffset.dy;
      if (offsetY > 10) {
        break;
      }
    }
  }
  final newIndex = i == 0 ? 0 : i - 1;
  return newIndex;
}