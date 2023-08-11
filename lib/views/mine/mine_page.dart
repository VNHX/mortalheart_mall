import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/util/easy_refresh_util.dart';
import 'package:mortalheart_mall/views/mine/widget/info_header.dart';
import 'package:mortalheart_mall/views/mine/widget/order_card.dart';
import 'package:mortalheart_mall/views/mine/widget/single_line_menu.dart';

import 'mine_controller.dart';

class MinePage extends GetView<MineController> {
  const MinePage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final mieController = Get.put(MineController());
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              return false;
            },
            child:  EasyRefresh.builder(
            controller: mieController.freshController,
            header: classicHeader,
              childBuilder: (BuildContext context, ScrollPhysics physics) {
              return NestedScrollView(
                controller: mieController.scrollController,
                physics: physics,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    const HeaderLocator.sliver(clearExtent: false),
                    infoHeader(context,mieController),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        orderCard(context,mieController),
                        singleLineMenu(context,mieController),
                      ]),
                    ),
                    // tabList(context, onTabChange: (code) => handleTabChange(store, code, tabs))
                  ];
                },
                body: PageView(
                  controller: mieController.pageController,
                  onPageChanged: (index) {
                    if (mieController.isTabClick.value) return;
                  },
                  children: [],
                ),
              );

              },
            )
        ),
    );
  }

}