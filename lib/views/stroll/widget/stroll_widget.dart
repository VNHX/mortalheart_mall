


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_list_view/flutter_group_list_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/stroll/stroll_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget strollWidget (BuildContext context, StrollController stroll){
  print('我是点击之后的值：${getScreenHeight(context)}');
  late Widget strollConent;
  if(stroll.isSelected.value==0){
    strollConent =   Column(
      children: [
        Container(
          width: getScreenWidth(context),
          height:95,
          color: Colors.white,
          child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                itemBuilder: (context, index){
                  return  GestureDetector(
                    onTap: ()=>{

                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration:  BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                              border: Border.all(
                                color: Colors.red,
                                width: 1.5
                              )
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                              child: CachedNetworkImage(
                                height: 60,
                                imageUrl: "https://img-qn.51miz.com/preview/element/00/01/16/16/E-1161680-1DF4A9DA.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fw/720",
                                placeholder: (context, url) => assetImage("images/default.png", getScreenWidth(context) - 24, 100),
                                errorWidget: (context, url, error) => assetImage("images/default.png", getScreenWidth(context) - 24, 100),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            margin: const EdgeInsets.only(top: 6),
                            child: const Text(
                              '关注店铺的名字',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                  );
                }
          )
          // child: ,
        ),
        SizedBox(
          width: getScreenWidth(context),
          // padding: const EdgeInsets.only(top: 10,bottom: 10),
          height: 512,
          child: ListView.builder(
              itemCount: 100,
              padding:  const EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: getScreenWidth(context),
                  height: getScreenHeight(context)- 280,
                  margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  decoration: const BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child:  Text('内容区域$index'),
                );
                // return Text('内容区域$index');
              }
          ),
        ),
      ],
    );
  }
  if(stroll.isSelected.value==2){
    strollConent = Column(
      children: [
        Container(
          width: getScreenWidth(context),
          height: 50,
          color: Colors.yellow,
          child: const Text('搜索'),
        ),
        /**
         * Tabs 设计思路
         * 1、tabs占比90%，编辑占比10%
         * 2、每个tab 等比例划分
         * 3、当点击下一个时tab向前通过控制key，向前移动当前盒子的一半
         * 4、编辑下拉，可以拖动、删除，设置自己的喜好
         * */
        SizedBox(
          width: getScreenWidth(context),
          height: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: getScreenWidth(context)-30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stroll.tabs.length,
                  itemExtent: 55.0,
                  itemBuilder: (BuildContext context, int index) {
                    return  GestureDetector(
                        onTap: () => stroll.onTabChange(stroll.tabs[index]['code'],stroll.tabs),
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: 50,
                                  alignment: Alignment.center,
                                  child:Obx(() => Text(
                                    stroll.tabs[index]['name'] ?? "",
                                    style: TextStyle(
                                      color: stroll.currentTab == stroll.tabs[index]['code'] ? Colors.red : Colors.black54,
                                      fontWeight: stroll.currentTab == stroll.tabs[index]['code'] ? FontWeight.w600:FontWeight.w100,
                                      fontSize:  stroll.currentTab == stroll.tabs[index]['code'] ? 13:13,
                                    ),
                                  )
                                  ),
                                )
                            ),
                          ],
                        )
                    );
                  },
                ),
              ),
              InkWell(
                  onTap: ()=>{
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child:  const Text(
                      "+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Text('内容区域'),
        )
      ],
    );;
  }
  if(stroll.isSelected.value==3){
    strollConent = Column(
      children: [
       Container(
              width: getScreenWidth(context),
              color: CommonStyle.searchColor,
              child: Text('视频2'),
            )
      ],
    );
  }
  return strollConent;
}