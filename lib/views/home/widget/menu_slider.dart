


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

const rowNum = 5;
const pageNum = rowNum * 2;

Widget menuSlider(BuildContext context, HomeController controller) {
  if(controller.menuList.value.isEmpty){
    return Container();
  }
  return Container(
    color: CommonStyle.menuBjlor,
      height: 170,
    padding: const EdgeInsets.only(bottom: 10),
        child:  Container(
          padding: const EdgeInsets.only(left: 0,right: 8),
          child: Obx(()=>
            Column(
              children: [
                Expanded(flex: 1, child: menuPageList(context,controller)),
                Container(height: 15, alignment: Alignment.center, child:  indicator(context,controller))
              ],
            ),
          ),
        ),
  );
}

Widget indicator(BuildContext context, HomeController controller) {
  return
     ListView.builder(
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
         scrollDirection: Axis.horizontal,
         itemCount: (controller.menuList.length % pageNum) > 0 ? (controller.menuList.length ~/ pageNum) + 1 : (controller.menuList.length ~/ pageNum),
         itemBuilder: (context, index) {
           final Widget selectedMeu;
           if(controller.menuSliderIndex.value  == index ){
             selectedMeu = AnimatedOpacity(
               opacity: controller.menuSliderIndex.value == index ? 1.0 : 0.0,
               duration: const Duration(seconds: 600),
               curve: Curves.fastOutSlowIn,
               child: Container(
                 height: 5,
                 width: 10,
                 decoration: BoxDecoration(
                     color: CommonStyle.selectedMeuColor,
                     borderRadius: BorderRadius.circular(5.0)
                 ),
               ),
             );
           }else{
             selectedMeu =   CircleAvatar(
               radius:3,
               backgroundColor:Colors.grey,
               child: Container(
                 alignment: const Alignment(0, .6),
                 width:10,
                 height: 10,
               ),
             );
           }
           return Container(
               alignment: const Alignment(0, .6),
               height: 10,
               width: 10,
               child: selectedMeu
           );
         });

}

Widget menuPageList(BuildContext context, HomeController controller) {
  return PageView.builder(
        itemCount: (controller.menuList.length % pageNum) > 0 ? (controller.menuList.length ~/ pageNum) + 1 : (controller.menuList.length ~/ pageNum),
        onPageChanged: controller.setMenuSliderIndex,
        itemBuilder: (BuildContext context, int index) {
          return GridView.builder(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (index < (controller.menuList.length ~/ pageNum)) ? pageNum : (controller.menuList.length % pageNum),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowNum,
                crossAxisSpacing: 10,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, position) {
                return GestureDetector(
                    onTap: () {
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          imageUrl: controller.menuList[index * pageNum + position]['menuIcon'],
                          // placeholder: (context, url) => assetImage("image/default.png", 40, 40),
                          // errorWidget: (context, url, error) => assetImage("image/default.png", 40, 40),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            controller.menuList[index * pageNum + position]['menuName'],
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ));
              });
        },
      );
}

