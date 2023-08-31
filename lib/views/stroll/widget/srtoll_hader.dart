
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/common/style/common_style.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/stroll/stroll_controller.dart';

Widget strollHeader(BuildContext context, StrollController stroll) {
  return SizedBox(
      height: 46 + getStatusHeight(context),
      child: Container(
        color: CommonStyle.colorF7CD6B,
        padding: EdgeInsets.only(top: getStatusHeight(context)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                  '头像',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
             Positioned(
                bottom: 10,
                left: 65,
                child:SizedBox(
                  height: 25,
                  width: getScreenWidth(context) - 130,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child:SizedBox(
                          width:50,
                      child: Obx(()=>
                          Text(
                            "关注",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: stroll.isSelected.value==0?FontWeight.w600:FontWeight.w500,
                                color: stroll.isSelected.value==0?CommonStyle.selectedMeuColor:CommonStyle.color333333
                            ),
                          )
                      ),
                  ),
                        onTap: ()=> stroll.onTabTap(0),
                      ),
                      InkWell(
                        child:SizedBox(
                          width:50,
                        child:
                        Obx(()=>Text(
                            "推荐",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: stroll.isSelected.value==2?FontWeight.w600:FontWeight.w500,
                                color: stroll.isSelected.value==2?CommonStyle.selectedMeuColor:CommonStyle.color333333
                            ),
                          ),
                        ),

                        ),
                        onTap: ()=>stroll.onTabTap(2),
                      ),
                    InkWell(
                      child:SizedBox(
                        width:50,
                        child: Obx(()=>Text(
                          "视频",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: stroll.isSelected.value==3?FontWeight.w600:FontWeight.w500,
                              color: stroll.isSelected.value==3?CommonStyle.selectedMeuColor:CommonStyle.color333333
                          ),
                        ),
                        ),
                      ),
                        onTap: ()=>stroll.onTabTap(3),
                      ),
                    ],
                  ),
                ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 6.0),
                        child: Text('搜索'),
                      )
                    ],
                )
            )
          ],
        ),
      )
  );
}