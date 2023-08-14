import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/models/primary_category_list.dart';

class OtherController extends GetxController {
  /// 加载
  final isLoading = RxBool(false);
  final ScrollController scrollController = ScrollController();
  final ScrollController gridViewController = ScrollController();
  final secondKeys = <GlobalKey>[];
  final keys = <GlobalKey>[];
  /// 分类左侧
  final classlist =  RxList([]);
  /// 分类左侧字体颜色控制
  final isSelect = RxBool(false);
  /// 分类左侧样式01
  final isPrev = RxBool(false);
  /// 分类左侧样式02
  final isNext = RxBool(false);
  /// 右侧广告
  final headUrl = RxString('');
  /// 右侧数据
  final secondCateList = RxList([]);
  /// 右侧isSelect01
  final isYcSelect = RxBool(false);
  ///左侧一级分类默认选中信息
  late SelectedCategoryInfo? selectedCategoryInfo;
}
class SelectedCategoryInfo {
  CategoryInfo? previous;
  CategoryInfo? current;
  CategoryInfo? next;

  SelectedCategoryInfo(this.previous, this.current, this.next);
}