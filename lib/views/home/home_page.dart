
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/easy_refresh_util.dart';
import 'package:mortalheart_mall/views/home/widget/adv_img.dart';
import 'package:mortalheart_mall/views/home/widget/gallery_list.dart';
import 'package:mortalheart_mall/views/home/widget/menu_slider.dart';
import 'dart:math' as math;
import 'home_contoller.dart';
import 'widget/search_header.dart';
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // TODO: implement build
    return  Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            HomeController.onScroll(notification);
            // if (notification.depth == 0) {
            //   HomeController.onScroll(distance);
            // }
            return false;
          },
          child: EasyRefresh.builder(
          controller:HomeController.freshController,
            header: classicHeader,
              onRefresh: () async =>  RefreshAction(
                      () => HomeController.easyRefreshSuccess(HomeController.freshController),
                      () => HomeController.easyRefreshFail(HomeController.freshController)
              ),
              childBuilder: (BuildContext context, ScrollPhysics physics) {
                return NestedScrollView(
                  controller: HomeController.scrollController,
                  physics: physics,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      const HeaderLocator.sliver(clearExtent: false),
                      searchHeader(context),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          galleryList(context),
                          advBanner(context),
                          menuSlider(context),
                        ]),
                      ),
                    ];

                  },
                  body:PageView(
                    controller: HomeController.pageController,
                    onPageChanged: (index) {
                      if (HomeController.isTabClick.value) return;
                    },
                    children: const [
                      Text('1111111'),
                    ],
                  ),

                );
              },
        ),
        ),
    );
  }


}


