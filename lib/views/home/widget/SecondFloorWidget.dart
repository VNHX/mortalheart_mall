import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_mall/routes/routing_constants.dart';
import 'package:mortalheart_mall/views/home/home_contoller.dart';
import 'package:mortalheart_mall/widgets/image/asset_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondFloorWidget  extends StatefulWidget {
  final scale;
  final mode;
  final header;
  final state;
  final  height;
  final freshController;
  final HomeController controller;
  const SecondFloorWidget(
      this.scale,
      this.mode,
      this.header,
      this.state,
      this.freshController,
      this.controller,
      {super.key,
        required this.height,
      });
  @override
  State<SecondFloorWidget > createState() => _SecondFloorWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<HomeController>('controller', controller));
  }

}

class _SecondFloorWidgetState extends State<SecondFloorWidget >  {
  final RefreshController refreshController = RefreshController();
  ///声明变量
  late Timer _timer;
  ///记录当前的时间

  late int count = 0;
  floorStartTime() async {
    const Duration(milliseconds: 2000);
    _timer = Timer.periodic(const Duration(milliseconds:1000), (timer) {
        navigationPage(widget.freshController,widget.mode);
        _timer.cancel();
    });
  }
  startTime() async {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      ///自增
      count++;
      ///到5秒后停止
      if (count == 5) {
        _timer.cancel();
      }
    });

  }
  void navigationPage(freshController,mode)  async {
    print('跳转传$freshController');
    widget.controller.pageFloor.value = true;
    _timer.cancel();
    Get.toNamed(Routes.secondFloorRoute);
  }
  void cloneOpen() async {
    ///取消计时器
    _timer.cancel();
    widget.controller.pageFloor.value = false;
    widget.freshController.closeHeaderSecondary();
    print('这是清除二层楼状态：${widget.controller.pageFloor.value}');
    print('这是二层楼scale显示的值：${widget.scale}');
    print('这是二层楼mode状态：${widget.mode}');
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    ///取消计时器
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('二层楼状态${widget.mode}');
    print('是否打开活动页面；${widget.controller.pageFloor.value}');
    if(widget.mode==IndicatorMode.secondaryArmed){
      startTime();
    }
    if( widget.mode == IndicatorMode.secondaryReady ){
      floorStartTime();
    }
    if(widget.mode == IndicatorMode.secondaryOpen){
      cloneOpen();
    }
    // TODO: implement build
    return Stack(
      clipBehavior: Clip.none,
      children: [

        SizedBox(
          height: widget.height,
          width: double.infinity,
          child: CachedNetworkImage(
            width:double.infinity,
            height: widget.height,
            imageUrl:  widget.controller.homebj.value ?? '' ,
            placeholder: (context, url) => assetImage("images/default.png", double.infinity, widget.height),
            errorWidget: (context, url, error) => assetImage("images/default.png", double.infinity, widget.height),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: wightText(widget.mode,count,!widget.controller.pageFloor.value),
        ),
        Opacity(
          opacity: (
              widget.mode == IndicatorMode.secondaryOpen ||  widget.mode ==  IndicatorMode.secondaryReady||
                  widget.mode == IndicatorMode.secondaryClosing  )
              ? 0
              : widget.scale,
          child: widget.header.build(context, widget.state),
        ),
      ],
    );
  }
}


wightText(mode, int count, bool pageFloor){
  return  Center(
    child: AnimatedOpacity(
      opacity: mode == IndicatorMode.secondaryArmed && pageFloor
          ? 1
          : 0,
      duration: const Duration(milliseconds: 400),
      child:  count > 3?const Text(
        '松开有惊喜',
        style:TextStyle(
            color: Colors.white
        ),
      ):const Text(
        '继续下拉有惊喜',
        style:TextStyle(
            color: Colors.white
        ),
      ),
    ),
  );
}
