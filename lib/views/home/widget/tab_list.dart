

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/routes/routing_constants.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget tabList(BuildContext context, HomeController controller) {
  return Container(
          height: 24,
          alignment: Alignment.topCenter,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CommonStyle.gradientleftColor,
                CommonStyle.gradientRightColor,
                CommonStyle.gradientbottomColor,
              ],
            ),
          ),
          child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               SizedBox(
                 width: getScreenWidth(context) - 70.0,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: controller.tabs.length,
                   itemExtent: 55.0,
                   itemBuilder: (BuildContext context, int index) {
                     return  GestureDetector(
                         onTap: () => controller.onTabChange(controller.tabs[index].code,controller.tabs),
                         child: Flex(
                           direction: Axis.vertical,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Expanded(
                                 flex: 1,
                                 child: Container(
                                   width: 50,
                                   alignment: Alignment.topCenter,
                                   margin: const EdgeInsets.only(left: 20),
                                   // color: Colors.tealAccent,
                                   child:Obx(() => Text(
                                     controller.tabs[index].name ?? "",
                                     style: TextStyle(
                                       color: controller.currentTab == controller.tabs[index].code ? Colors.white : Colors.white,
                                       fontWeight: controller.currentTab == controller.tabs[index].code ? FontWeight.w600:FontWeight.w100,
                                       fontSize:  controller.currentTab == controller.tabs[index].code ? 13:13,
                                     ),
                                   )),
                                 )
                             ),
                           ],
                         )
                     );
                   },
                 ),
           ),
            // const SizedBox(
            //   width: 1,
            //   height: 20,
            // ),
            InkWell(
                onTap: ()=>{
                  Get.toNamed(Routes.classificationRoute)
                },
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 6),
                child:  Row(
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: assetImage('images/classification.png', 15, 15),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const Text(
                          "分类",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            )

          ],
            )
  );
}
