import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController = RefreshController();
  //是否是floatingHeader中的tab点击
  final isTabClicked = RxBool(false);
  //滚动条位置
  final pageScrollY = RxDouble(0);
  ///
  final index = RxInt(0);
  /// 页数
  final currentPage = RxInt(0);
  //商品、评论、详情、同店好货锚点key
  final cardKeys = <GlobalKey>[
    GlobalKey(debugLabel: 'card_0'),
    GlobalKey(debugLabel: 'card_1'),
    GlobalKey(debugLabel: 'card_2'),
    GlobalKey(debugLabel: 'card_3')
  ];

  //缓存商品、评论、详情、同店好货4个模块的y坐标
  final Map<int, double> itemsOffsetMap = {};
  // 加载
  final isLoading = RxBool(false);

  ///
  final imgList = RxList([]);
  final thumbWidth = RxDouble(78);
  final bannerList = RxList([]);
  final tagList = RxList([]);
  /// 获取滚动距离
   changePageScrollYAction(ScrollNotification notification, BuildContext context) {
     if (notification.depth == 0) {
       double distance = notification.metrics.pixels;
       pageScrollY.value = distance;
       //监听滚动，选中对应的tab
       if (isTabClicked.value) {
         return false;
       };
       /// 更改顶部选项卡索引操作
       int newIndex = findFirstVisibleItemIndex(cardKeys, context);
       index.value = newIndex;
     }
  }

  int findFirstVisibleItemIndex(List<GlobalKey<State<StatefulWidget>>> cardKeys, BuildContext context) {
    int i = 0;
    for (; i < cardKeys.length; i++) {
      RenderSliverToBoxAdapter? keyRenderObject = cardKeys[i].currentContext?.findAncestorRenderObjectOfType<RenderSliverToBoxAdapter>();
      if (keyRenderObject != null) {
        //距离CustomScrollView顶部距离， 上滚出可视区域变为0
        final dy = (keyRenderObject.parentData as SliverPhysicalParentData).paintOffset.dy;
        if (dy > 42 + getStatusHeight(context)) {
          break;
        }
      }
    }
    final newIndex = i == 0 ? 0 : i - 1;
    return newIndex;
  }

  void scroll2PositionByTabIndex(int index, BuildContext context) {
    double offsetY = itemsOffsetMap[index]! - 42 - getStatusHeight(context);
    if (offsetY < 0) offsetY = 0;
    scrollController
        .animateTo(offsetY, duration: const Duration(milliseconds: 300), curve: Curves.linear)
        .then((value) => isTabClicked.value = false);
  }

}
