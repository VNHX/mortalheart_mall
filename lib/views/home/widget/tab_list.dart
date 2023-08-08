

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget tabList(BuildContext context, HomeController controller, {required ValueCallback<String> onTabChange}) {
  return Container(
          height: 30,
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
                itemCount: 20,
                itemExtent: 53.0,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => controller.onTabChange(),
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                width: 53,
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.only(left: 20),
                                // color: Colors.tealAccent,
                                child: Text(
                                  '测试',
                                  style: TextStyle(
                                      color:  controller.isSelect.value ? Colors.white : Colors.white,
                                    fontWeight: controller.isSelect.value ? FontWeight.w600:FontWeight.w100,
                                    fontSize:  controller.isSelect.value ? 15:13,
                                  ),
                                ),
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
            Container(
              height: 35.0,
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(left: 6),
              child:  Row(
                children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: assetImage('images/ic_home.png', 20, 20),
                ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      onTap: ()=>{},
                      child: const Text(
                        "分类",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
            )
  );
}
