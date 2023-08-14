
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/easy_refresh_util.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/widget/SecondFloorWidget.dart';
import 'package:mortalheart_mall/views/home/widget/activity_slider.dart';
import 'package:mortalheart_mall/views/home/widget/adv_img.dart';
import 'package:mortalheart_mall/views/home/widget/gallery_list.dart';
import 'package:mortalheart_mall/views/home/widget/menu_slider.dart';
import 'package:mortalheart_mall/views/home/widget/subsidy_slider.dart';
import 'package:mortalheart_mall/views/home/widget/tab_list.dart';
import 'package:mortalheart_mall/widgets/loading_widget.dart';
import 'package:mortalheart_mall/widgets/page_goods_list.dart';
import 'dart:math' as math;
import 'home_contoller.dart';
import 'widget/search_header.dart';
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final controller = Get.put(HomeController());
    // TODO: implement build
  if (controller.isLoading.value) return loadingWidget(context);
    return  Scaffold(
        backgroundColor:CommonStyle.menuBjlor,
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            controller.onScroll(notification);
            return false;
          },
          child: EasyRefresh.builder(
          controller:controller.freshController,
            // header: classicHeader,
            clipBehavior: Clip.none,
            header: SecondaryBuilderHeader(
              header: classicHeader,
              secondaryTriggerOffset: 180,
              builder: ( context, state, header) {
              final mode = state.mode;
                final offset = !controller.pageFloor.value?state.offset:0.0;
                final actualSecondaryTriggerOffset =
                state.actualSecondaryTriggerOffset!;
                final actualTriggerOffset = state.actualTriggerOffset;
                double scale = 1;
                if (offset > actualTriggerOffset) {
                  scale = math.max(
                      0.0,
                      (actualSecondaryTriggerOffset - offset) /
                          (actualSecondaryTriggerOffset - actualTriggerOffset)
                  );
                }
                return
                    SecondFloorWidget(
                      scale,
                      mode,
                      header,
                      state,
                      height: state.offset,
                      controller.freshController,
                      controller,
                );
              },
            ),
              onRefresh: () async =>  controller.easyRefreshSuccess(controller.freshController),
              childBuilder: (BuildContext context, ScrollPhysics physics) {
                return NestedScrollView(
                  controller: controller.scrollController,
                    physics:physics,
                  // physics:const NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      const HeaderLocator.sliver(clearExtent: false),
                      searchHeader(context,controller),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          tabList(context,controller), // tabs 导航
                          galleryList(context,controller), // 轮播图
                          advBanner(context,controller), /// 广告图
                          menuSlider(context,controller), /// menu 菜单
                          subsidySlider(context,controller), /// 补贴
                          activitySlider(context,controller), /// 活动
                        ]),
                      ),
                    ];

                  },
                  body:PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(), //禁止滑动
                      scrollDirection:Axis.vertical,
                      onPageChanged: (index) {
                      if (controller.isTabClick.value) return;
                      controller.currentTab.value = controller.tabs[index].code!;
                    },
                    children: controller.tabs.map((e) => PageGoodsList(e.code!, physics,)).toList(),
                  ),

                );
              },
        ),
        ),
    );
  }
}


