


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const rowNum = 5;
const pageNum = rowNum * 2;

Widget menuSlider(BuildContext context) {
  return Container(
      color: Colors.white,
      height: 185,
      padding: const EdgeInsets.only(bottom: 10),
      child: const Column(
        children: [
          Expanded(flex: 1, child:Text('菜单')),
        ],
      ));
}