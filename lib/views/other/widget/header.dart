
import 'package:flutter/cupertino.dart';
import 'package:mortalheart_mall/common/util/color_util.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/other/other_controller.dart';

Widget header(BuildContext context, OtherController other) {
  return Container(
      color: ColorUtil.hex2Color('#FE0F22'),
      height: 50 + getStatusHeight(context),
      padding: EdgeInsets.only(top: getStatusHeight(context)),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
              top: 1,
              child: Container(
                height: 38,
                width: getScreenWidth(context) - 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorUtil.hex2Color("#F0F1ED"),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 36.0,
                        alignment: Alignment.centerLeft,
                        child: Text('这是搜索框',
                            style: TextStyle(
                              color: ColorUtil.hex2Color('#818286'),
                            )),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ));
}
