
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/views/detail/detail_controller.dart';

class VideoPage extends GetView<DetailController>{
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      color: Colors.yellowAccent,
      child: const Text('视频'),
    );
  }


}