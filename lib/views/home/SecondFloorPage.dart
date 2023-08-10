
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';

class SecondFloorPage extends GetView<HomeController>{
  const SecondFloorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('活动'),
      ),
      body:  const Text('Go back!'),
    );
  }

}