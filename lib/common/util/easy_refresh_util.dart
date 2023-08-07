import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';

Header classicHeader = const ClassicHeader(
  clamping: true,
  position: IndicatorPosition.locator,
  mainAxisAlignment: MainAxisAlignment.end,
  dragText: '下拉刷新',
  armedText: '释放开始',
  readyText: '刷新中...',
  processingText: '刷新中...',
  processedText: '刷新成功',
  messageText: '最后更新时间 %T',
  safeArea: false,
  clipBehavior: Clip.none,
);
