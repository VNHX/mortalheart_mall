import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/common/util/screen_util.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

Widget advBanner(BuildContext context, HomeController controller) {

  return GestureDetector(
              onTap: () => {},
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(0),
                child: CachedNetworkImage(
                  height: 100,
                  imageUrl: 'https://m15.360buyimg.com/mobilecms/jfs/t1/105817/5/25878/84922/622f2e3eE548c75b1/a564811c5763d4e8.png!q70.jpg',
                  // placeholder: (context, url) => assetImage("images/default.png", getScreenWidth(context) - 24, 90),
                  // errorWidget: (context, url, error) => assetImage("images/default.png", getScreenWidth(context) - 24, 90),
                  fit: BoxFit.fill,
                ),
              ),
  );
}
