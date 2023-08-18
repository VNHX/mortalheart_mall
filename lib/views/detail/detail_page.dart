
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/detail/detail_controller.dart';
import 'package:mortalheart_mall/views/detail/widget/goods_info.dart';
import 'package:mortalheart_mall/views/detail/widget/tab_header.dart';
import 'package:mortalheart_mall/widgets/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailPage extends GetView<DetailController>{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = Get.put(DetailController());
    // TODO: implement build
    Widget scrollView = detail.isLoading.value
        ? loadingWidget(context)
        : NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          detail.changePageScrollYAction(notification,context);
          return false;
        },
        child: Container(
          color: CommonStyle.colorF5F5F5,
          child: SmartRefresher(
            controller: detail.refreshController,
            enablePullUp: true,
            enablePullDown: false,
            onLoading: () async {
            },
            child: CustomScrollView(
              controller:detail.scrollController,
              slivers: [
                goodsInfo(context, detail.cardKeys[0],detail),
              ],
            ),
          ),
        )
    );

    Widget floatingHeader =  Positioned(
        top: 0,
        left: 0,
        child: tabHeader(context,detail, onChange: (index) {
          detail.isTabClicked.value = true;
          detail.scroll2PositionByTabIndex(index,context);
        }),
    );


    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Scaffold(
                body: Stack(
                  children: [scrollView,floatingHeader],
                ),
              )
          ),
        ],
      ),
    );
  }

}