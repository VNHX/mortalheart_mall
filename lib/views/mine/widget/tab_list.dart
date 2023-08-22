import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/mine/mine_controller.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget tabList(BuildContext context, MineController mieController,) {
  ScrollController controller = ScrollController();
  double screenWidth = getScreenWidth(context);

  return SliverPersistentHeader(
    pinned: true,
    delegate: SliverHeaderDelegate.fixedHeight(
      //固定高度
        height: 58,
        child: Container(
            color: CommonStyle.greyBgColor,
            child: ListView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemExtent: 90,
                  itemBuilder: (BuildContext context, int index) {
                    bool isSelect = false;
                    return GestureDetector(
                        onTap: () {
                         
                        },
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: 90,
                                  color: CommonStyle.greyBgColor,
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: isSelect ? CommonStyle.selectedTabColor : CommonStyle.unSelectedTabColor,
                                        fontWeight: isSelect ? FontWeight.bold : FontWeight.w500,
                                        decoration: TextDecoration.none),
                                  ),
                                )),
                            Container(
                                width: 20,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: isSelect ? CommonStyle.selectedTabColor : CommonStyle.greyBgColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                )),
                            Container(width: 20, height: 12, color: Colors.transparent),
                          ],
                        ));
                  })
            )),
  );
}
