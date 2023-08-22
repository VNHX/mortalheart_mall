
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MineController extends GetxController {
  EasyRefreshController freshController = EasyRefreshController(controlFinishRefresh: true);
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  final isTabClick = RxBool(false);
  final tabList = RxList([]);
  /// 滚动条值
  late double pageScrollY = 0.0 ;
  //
  double maxTop = 40;
  double minTop = 4;
  double nameMaxTop = 48;
  double maxSize = 70;
  double minSize = 30;
  double maxOpacity = 1;
  double minOpacity = 0;
  calcSize(y) {
    double toTop = maxTop - y * 0.8;
    double name2Top = nameMaxTop - y * 0.8;
    double realSize = maxSize - y * 0.8;
    double opacity = minOpacity + y * 0.01;
    if (toTop < minTop) toTop = minTop;
    if (toTop > maxTop) toTop = maxTop;
    if (name2Top < minTop) name2Top = minTop;
    if (name2Top > nameMaxTop) name2Top = nameMaxTop;
    if (realSize > maxSize) realSize = maxSize;
    if (realSize < minSize) realSize = minSize;

    if (opacity > maxOpacity) opacity = maxOpacity;
    if (opacity < minOpacity) opacity = minOpacity;

    return HeaderSize(toTop, name2Top, realSize, opacity);
  }
}

//
// double maxTop = 40;
// double minTop = 4;
// double nameMaxTop = 48;
// double maxSize = 70;
// double minSize = 30;
// double maxOpacity = 1;
// double minOpacity = 0;
//
// HeaderSize calcSize(double y) {
//   double toTop = maxTop - y * 0.8;
//   double name2Top = nameMaxTop - y * 0.8;
//   double realSize = maxSize - y * 0.8;
//   double opacity = minOpacity + y * 0.01;
//   if (toTop < minTop) toTop = minTop;
//   if (toTop > maxTop) toTop = maxTop;
//   if (name2Top < minTop) name2Top = minTop;
//   if (name2Top > nameMaxTop) name2Top = nameMaxTop;
//   if (realSize > maxSize) realSize = maxSize;
//   if (realSize < minSize) realSize = minSize;
//
//   if (opacity > maxOpacity) opacity = maxOpacity;
//   if (opacity < minOpacity) opacity = minOpacity;
//
//   return HeaderSize(toTop, name2Top, realSize, opacity);
// }
//
//
class HeaderSize {
  double top;
  double name2Top;
  double size;
  double opacity;

  HeaderSize(this.top, this.name2Top, this.size, this.opacity);
}