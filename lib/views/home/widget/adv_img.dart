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
                  imageUrl: controller.adUrl.value ?? "",
                  placeholder: (context, url) => assetImage("images/default.png", getScreenWidth(context) - 24, 90),
                  errorWidget: (context, url, error) => assetImage("images/default.png", getScreenWidth(context) - 24, 90),
                  fit: BoxFit.fill,
                ),
              ),
  );
}
