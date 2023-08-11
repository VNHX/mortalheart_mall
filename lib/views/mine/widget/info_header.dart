

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/mine/mine_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:mortalheart_mall/widgets/persistentHeader/sliver_header_builder.dart';

Widget infoHeader(BuildContext context, MineController mieController) {
  HeaderSize headerSize = mieController.calcSize(mieController.pageScrollY);
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        //有最大和最小高度
        maxHeight: 130 + getStatusHeight(context),
        minHeight: 48 + getStatusHeight(context),
        child: Container(
            padding: EdgeInsets.only(top: getStatusHeight(context)),
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/mine_top_bg.png"),
                )),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: 4,
                  right: 116,
                  child: assetImage('images/ic_friend.png', 26, 26),
                ),
                Positioned(
                  top: 4,
                  right: 66,
                  child: GestureDetector(
                    onTap: () => {},
                    child: assetImage('images/ic_setting.png', 28, 28),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 18,
                  child: GestureDetector(
                    onTap: () => {},
                    child: assetImage('images/ic_message.png', 28, 28),
                  ),
                ),
                  title(context,headerSize),
                header(context,headerSize),
                userInfo(context,headerSize),
              ],
            )),
      ),
  );
}

 Widget title(BuildContext context, HeaderSize headerSize) {
  return Positioned(
    top: 0,
    left: (getScreenWidth(context) - 100) / 2,
    child: Container(
      width: 100,
      height: 36,
      alignment: Alignment.center,
      child:  Opacity(
        opacity: headerSize.opacity,
        child: Text(
          '',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
    ),
  );
}
Widget header(BuildContext context, HeaderSize headerSize) {
  return Positioned(
      top: headerSize.top,
      left: 0,
      child: Container(
          width: headerSize.size,
          height: headerSize.size,
          margin: const EdgeInsets.only(left: 16),
          decoration: const ShapeDecoration(
              shape: CircleBorder(),
          )
      )
  );
}
Widget userInfo(BuildContext context, HeaderSize headerSize) {
  return Positioned(
    top: headerSize.name2Top,
    left: 100,
    child: SizedBox(
        width: getScreenWidth(context) - 100,
        height: 60,
        child: Opacity(
          opacity: 1 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
              '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text("积分: 200", style: TextStyle(fontSize: 16)),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                          "信用值: 1200",
                          style: TextStyle(fontSize: 16)
                      )
                  )
                ],
              )
            ],
          ),
        )
    ),
  );
}