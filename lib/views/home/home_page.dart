
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/easy_refresh_util.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/widget/SecondFloorWidget.dart';
import 'package:mortalheart_mall/views/home/widget/adv_img.dart';
import 'package:mortalheart_mall/views/home/widget/gallery_list.dart';
import 'package:mortalheart_mall/views/home/widget/menu_slider.dart';
import 'package:mortalheart_mall/views/home/widget/tab_list.dart';
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
    return  Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            controller.onScroll(notification);
            return false;
          },
          child: EasyRefresh.builder(
          controller:controller.freshController,
            // header: classicHeader,
            header: SecondaryBuilderHeader(
              header: classicHeader,
              secondaryTriggerOffset: 180,
              builder: ( context, state, header) {
                final mode = state.mode;
                print("这是下拉状态$mode");
                final offset = state.offset;
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
                return SecondFloorWidget(
                    scale,
                    mode,
                    header,
                    state,
                    hight: getScreenHeight(context),
                    opacity:1 - scale,
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
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      const HeaderLocator.sliver(clearExtent: false),
                      searchHeader(context,controller),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          tabList(context,controller),
                          galleryList(context,controller),
                          advBanner(context,controller),
                          menuSlider(context,controller),
                        ]),
                      ),
                    ];

                  },
                  body:PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      if (controller.isTabClick.value) return;
                      controller.currentTab.value = controller.tabs[index].code!;
                    },
                    children: controller.tabs.map((e) => PageGoodsList(e.code!, physics)).toList(),
                  ),

                );
              },
        ),
        ),
    );
  }
}


