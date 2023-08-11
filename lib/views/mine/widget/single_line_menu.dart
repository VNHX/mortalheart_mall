import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_mall/views/mine/mine_controller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';

const rowNum = 5;
const pageNum = rowNum * 1;

Widget singleLineMenu(BuildContext context, MineController mieController) {
  return Container(
      height: 105,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Expanded(flex: 1, child: menuPageList(context)),
          Container(height: 10, alignment: Alignment.center, child: indicator(context))
        ],
      ));
}

Widget indicator(BuildContext context) {
  return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
                alignment: const Alignment(0, .5),
                height: 10,
                width: 10,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(
                    alignment: const Alignment(0, .5),
                    width: 10,
                    height: 10,
                  ),
                )
            );
          }
          );
}

Widget menuPageList(BuildContext context) {
  return PageView.builder(
      itemCount: 1,
      onPageChanged: (index) {
        
      },
      itemBuilder: (BuildContext context, int index) {
        return GridView.builder(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: rowNum,
              crossAxisSpacing: 10,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, position) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageUrl: '',
                    placeholder: (context, url) => assetImage("images/default.png", 40, 40),
                    errorWidget: (context, url, error) => assetImage("images/default.png", 40, 40),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: const Text(
                     '',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              );
            });
      },
  );
}
